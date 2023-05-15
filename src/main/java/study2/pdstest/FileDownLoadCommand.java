package study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// (/)이 부분 진짜 진짜 조심!!!! 
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		String fName = request.getParameter("file")==null ? "" : request.getParameter("file");
		
		File file = new File(realPath + fName);
		
		/* 프로토콜 형식에 맞도록 헤더에 정보를 제공 */
		// mimeType: 파일 형식(예. 텍스트 파일, 바이너리 파일 등등) --> 파일 전송 시 자바에서는 전부 2진 바이너리 형식을 이용한다.
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");  // 2진 바이너리 형식을 의미
		}
		
		// 사용하는 브라우저에 대한 정보 : 만약 인터넷익스플로러(IE)에서 인코딩 방식을'euc-kr';로, 나머지는 'utf=8'로 전송
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(fName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// Java에 의해서 실제로 파일을 다운(업)로드 처리시켜준다.(FileInputStream/FileOutputStream/ServletOutputStream)
		// 서버 안에서 파일 복사 붙여넣을 때는 앞에 두 개를 쓰고, 서버에 있는 파일을 클라이언트에 다운받을 때는 ServletOutputStream을 쓴다.
		FileInputStream fis = new FileInputStream(file);       // 여기서 읽어서
		ServletOutputStream sos = response.getOutputStream();  // 여기로 보내주깅
		
		// 전송할 객체를 생성한 후에는 실제 파일을 객체에 byte단위로 담아서 처리
		byte[] b = new byte[2048];  //에서 4096까지면 안정적이다. 2k~4k
		int data = 0;
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		
		// 여기까지 다운로드 완료! 이후 사용된 객체를 모두 반납한다.
		sos.close();
		fis.close();
	}
}

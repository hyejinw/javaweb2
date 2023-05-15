package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		
		String fName = request.getParameter("fName")==null ? "" : request.getParameter("fName");
		System.out.println("pdstest에서 넘어온 파일명? " + fName);

		
		COS 라이브러리에서 제공하는 객체: MultipartRequest() / DefaultFileRenamePollicy()
		사용법 : MultipartRequest(저장소명(request), "서버에 저장될 파일 경로", "서버에 저장될 파일 최대 용량", "코드 변환방식", "기타 옵션(파일명 중복방지)")
		
		* 우리가 전에 쓴 realPath 방식 설명
		ServletContext application = request.getServletContext();
		String realPath = request.getServletContext().getRealPath("/");
		
		System.out.println("realPath : " + realPath);
		결과 : D:\javaweb\jsp\works\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\javaweb\
*/		
		
		
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		//System.out.println("realPath : " + realPath);
		
		int maxSize = 1024 * 1024 * 5; // 서버에 저장할 최대 용량을 5MByte 로 제한
		String encoding = "UTF-8";

	  // 파일 업로드처리 (객체가 생성되면서 파일이 업로드 처리된다.) : 제한 사항에 걸리지 않으면 그 양이 어떻든 생성하면서 바로 업로드된다.
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보 추출 (업로드한 파일명과 서버에 저장된 파일명은 다를 수 있다!)
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
				
		System.out.println("원본 파일명: " + originalFileName);	
		System.out.println("서버 저장 경로 : " + realPath);
		System.out.println("서버에 저장된 파일명: " + filesystemName);	
		
		
		
		if(!originalFileName.equals("")) {
			request.setAttribute("msg", "파일 업로드 성공");
		}
		else {
			request.setAttribute("msg", "파일 업로드 실패");
			
		}
		request.setAttribute("url", request.getContextPath() + "/pdstest/FileUpLoad1.st");

	}

}

package study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad2OkCommand implements StudyInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		int maxSize = 1024 * 1024 * 10; // 서버에 저장할 최대 용량을 10MByte 로 제한
		String encoding = "UTF-8";

	  // 파일 업로드처리 (객체가 생성되면서 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보 추출 (업로드한 파일명과 서버에 저장된 파일명은 다를 수 있다!)
		// 열거형
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		System.out.println("서버에 저장경로 : " + realPath);
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);
			
			System.out.println("원본 파일명 : " + originalFileName);
			System.out.println("서버에 저장된 파일명 : " + filesystemName);
		}
		
		if(!originalFileName.equals("")) {
			request.setAttribute("msg", "파일 업로드 성공");
		}
		else {
			request.setAttribute("msg", "파일 업로드 실패");
		}
		request.setAttribute("url", request.getContextPath()+"/pdstest/FileUpLoad2.st");
	}

}

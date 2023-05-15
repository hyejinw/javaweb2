package study2.pdstest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("file")==null ? "" : request.getParameter("file");
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		
		File file = new File(realPath + fName);
		String res = "0";
		
		
		// 파일 존재 유무 확인!
		if(file.exists()) {
			file.delete();
			res = "1";
		}
		
		response.getWriter().write(res);

	}

}

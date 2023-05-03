package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFinderResCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "": request.getParameter("name");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getNameCheck(name);
		
		request.setAttribute("name", vo.getName());
		request.setAttribute("mid", vo.getMid());
	}
}

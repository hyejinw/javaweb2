package study2.login3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFinderResCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
    
    LoginDAO dao = new LoginDAO();
    LoginVO vo = dao.getMidCheck(mid);  // 새로 메소드를 만들지 않고 기존 '아이디 중복 체크'를 재사용
    request.setAttribute("vo", vo);
	}
}

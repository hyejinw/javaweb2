package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFinderOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "": request.getParameter("name");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getNameCheck(name);
		
		String msg = "", url = "";
		
		if(vo.getMid() != null) {
      msg = "NO";
      url ="/IdFinderRes.re?name="+name;
		}
		else {
			msg = "입력하신 성명은 존재하지 않습니다.";
			url = "/IdFinder.re";
		}
    request.setAttribute("msg", msg);
    request.setAttribute("url", request.getContextPath() + url);
	}
}

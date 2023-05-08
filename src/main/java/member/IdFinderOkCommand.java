package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFinderOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "": request.getParameter("name");
		String nickName = request.getParameter("nickName")==null ? "": request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getNameCheck(name, nickName);
		
		String msg = "", url = "";
		
		if(vo.getMid() == null) {
			msg = "존재하는 않는 회원입니다.";
			url = "/IdFinder.mem";
		}
		else {
			msg = "NO";
			url ="/IdFinderRes.mem?name="+name+"&nickName="+nickName;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", request.getContextPath() + url);
	}
}

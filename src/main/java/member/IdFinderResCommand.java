package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFinderResCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "": request.getParameter("name");
		String nickName = request.getParameter("nickName")==null ? "": request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getNameCheck(name, nickName);
		
		request.setAttribute("name", vo.getName());
		request.setAttribute("nickName", vo.getNickName());
		request.setAttribute("mid", vo.getMid());
	}
}

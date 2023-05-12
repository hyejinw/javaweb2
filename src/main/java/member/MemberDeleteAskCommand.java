package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteAskCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		dao.setDeleteAskOk(mid);
		
		// 세션을 끊는다.
		session.invalidate();
		
		request.setAttribute("msg", "회원에서 탈퇴되셨습니다. 만나서 반가웠습니다!");
		request.setAttribute("url", request.getContextPath()+"/");
	}

}

package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");

		MemberDAO dao = new MemberDAO();
		int res = dao.getMemberNickCheck(nickName);
		
		request.setAttribute("res", res);  
		request.setAttribute("nickName", nickName);
		
//		if(vo.getNickName() == null) {
//			request.setAttribute("res", 1);   // 사용 가능한 닉네임
//		}
//		else {
//			request.setAttribute("res", 0);   // 이미 사용 중인 닉네임 
//		}
//		request.setAttribute("nickName", nickName);
	}
}

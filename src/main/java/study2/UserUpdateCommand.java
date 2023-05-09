package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax2.UserDAO;
import study2.ajax2.UserVO;

public class UserUpdateCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null? "":request.getParameter("mid");
		String name = request.getParameter("name")== null? "":request.getParameter("name");
		int age = request.getParameter("age")== null? 0 :Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address")== null? "":request.getParameter("address");
		
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		
		UserVO vo = new UserVO();
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		String res = "", res2 = "";
		UserDAO dao = new UserDAO();
		if(sMid.equals(mid)) {
			res = dao.setUpdate(vo, sMid);  //  되면 1, 안 되면 0으로 보내겠다.
			System.out.println("res : " + res);
		}
		else {
			// 중복 검사
		 res2 = dao.getMidSearch(mid);
		 	if(res2.equals("1")) {
		 		res = dao.setUpdate(vo, sMid);
			}
			else {
				res = "아이디가 중복되었습니다. 다시 입력하세요.";
			}
		}

		response.getWriter().write(res);
	}
}

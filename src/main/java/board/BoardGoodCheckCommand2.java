package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand2 implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();	
		String mid = (String) session.getAttribute("sMid");
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		for(Cookie cookie : cookies) {
			System.out.println(cookie.getName());
			if(cookie.getName().equals("good"+mid)) {
				visitor = 1;
				System.out.println("visit통과");
				
				if(cookie.getValue().contains(request.getParameter("idx"))) {
					System.out.println("visitif통과");
					
					// dao 에서 해당 idx 글 정보만 가져오기 
					BoardVO vo = dao.getBoardContent(idx);
					request.setAttribute("vo", vo);
				}
				else {
					cookie.setValue(cookie.getValue() + "_" + request.getParameter("idx"));
					response.addCookie(cookie);
					
					// 좋아요수 1회 증가시키기
					dao.setGoodUpdate(idx);
					BoardVO vo = dao.getBoardContent(idx);
					
					request.setAttribute("vo", vo);
				}
			}
		}
		if(visitor == 0) {
			Cookie cookie1 = new Cookie("good"+mid, request.getParameter("idx"));
			response.addCookie(cookie1);
			
			// 좋아요수 1회 증가시키기
			dao.setGoodUpdate(idx);
			BoardVO vo = dao.getBoardContent(idx);
			
			request.setAttribute("vo", vo);
		}
	}
}

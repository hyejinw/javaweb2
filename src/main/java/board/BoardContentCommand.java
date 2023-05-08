package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		
		// 1. 아이디마다 다른 쿠키를 만들 예정이라, session에 든 아이디를 가져왔다.
		HttpSession session = request.getSession();	
		String mid = (String) session.getAttribute("sMid");
		
		// 2. 생성된 모든 쿠키 내용 중에서 비교하겠다. visitor는 switch처럼 사용했습니다.
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		// 3. 이미 생성된 쿠키 중에 visit + (아이디)의 값과 같은 쿠키가 있으면, visitor를 1로 바꿉니다. 
		// 없으면 if(visitor == 0)로 가서 새로 만들어 줍니다.
		for(Cookie cookie : cookies) {
			System.out.println(cookie.getName());
			if(cookie.getName().equals("visit"+mid)) {
				visitor = 1;
				
				// 4. 해당 쿠키 안에 글 고유번호인 idx와 관련된 게 있다면, 조회수 변화 없이 dao를 통해 글 정보만 가져와서 jsp에 뿌리겠다.
				if(cookie.getValue().contains(request.getParameter("idx"))) {
					// dao 에서 해당 idx 글 정보만 가져오기 
					BoardVO vo = dao.getBoardContent(idx);
					request.setAttribute("vo", vo);
				}
				// 5. 만약 idx가 들어있지 않다면, 해당 내용을 새로 만들어주고 조회수를 늘리겠다.
				else {
					cookie.setValue(cookie.getValue() + "_" + request.getParameter("idx"));
					response.addCookie(cookie);
					
					// 글 조회수 1회 증가시키기
					dao.setReadNumUpdate(idx);
					BoardVO vo = dao.getBoardContent(idx);
					
					request.setAttribute("vo", vo);
				}
			}
		}
		// 6. visit + (아이디)로 된 쿠키가 없으면 새로 만들어줍니다.
		if(visitor == 0) {
			Cookie cookie1 = new Cookie("visit"+mid, request.getParameter("idx"));
			response.addCookie(cookie1);
			
			// 글 조회수 1회 증가시키기
			dao.setReadNumUpdate(idx);
			BoardVO vo = dao.getBoardContent(idx);
			
			request.setAttribute("vo", vo);
		}
	}
}

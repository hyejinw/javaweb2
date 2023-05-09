package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {
// 세션으로 조회수 중복 방지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		
		
		// 글 조회수 1회 증가시키기("'board'+고유번호" 값을 객체배열(ArrayList)에 담았다.)
		HttpSession session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		
		// 처음엔 없을 거니까! 만들어주자!
		if(contentIdx == null) {
			contentIdx = new ArrayList<>();
		}
		String imsiContentIdx = "board" + idx;
		
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNumUpdate(idx);       // 게시글 조회수 올리고
			contentIdx.add(imsiContentIdx);  // arrayList에 값 추가!!!!
		}
		
		session.setAttribute("sContentIdx", contentIdx);
		
		
		// 현재 선택된 게시글(idx)의 내용을 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
	}
}

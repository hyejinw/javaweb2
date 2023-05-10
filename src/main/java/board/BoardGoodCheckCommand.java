package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {
//세션으로 좋아요 수 중복 방지
	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		
		// 글 좋아요 1회 증가시키기("'boardGood'+고유번호" 값을 객체배열(ArrayList)에 담았다.)
		HttpSession session = request.getSession();
		ArrayList<String> goodIdx = (ArrayList<String>) session.getAttribute("sGoodIdx");
		
		// 처음엔 없을 거니까! 만들어주자!
		if(goodIdx == null) {
			goodIdx = new ArrayList<>();
		}
		String imsiGoodIdx = "boardGood" + idx;
		
		if(!goodIdx.contains(imsiGoodIdx)) {
			dao.setGoodUpdate(idx);      // 게시글 좋아요 올리고
			goodIdx.add(imsiGoodIdx);    // arrayList에 값 추가!!!!
		}
		session.setAttribute("sGoodIdx", goodIdx);
		
		// 현재 선택된 게시글(idx)의 내용을 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
	}
}

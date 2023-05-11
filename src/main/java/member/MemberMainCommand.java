package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		// level을 문자로 처리해서 넘긴다.
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		else if(vo.getLevel() == 4) strLevel = "운영자";
		
		request.setAttribute("point", vo.getPoint());
		request.setAttribute("todayCnt", vo.getTodayCnt());
		request.setAttribute("visitCnt", vo.getVisitCnt());
		request.setAttribute("strLevel", strLevel);
		request.setAttribute("photo", vo.getPhoto());
		
		
		// 특정 회원의 총 레코드 건수 구하기
		// 1. 작성한 방명록 글 총 개수 구하기 (아이디, 닉네임이 같으면 본인이 쓴 글) (성명은 제외시켰다. 중복이 가능하기 때문!)
		int guestCnt = dao.getGuestList(vo.getMid(), vo.getNickName());
		request.setAttribute("guestCnt", guestCnt);
		
		
		// 2. 작성한 게시판 글 총 개수 구하기 (아이디가 같으면 본인이 쓴 글: 물론 board에는 작성자가 nickName으로 나온다. 다만 별명은 변경 가능하니까 아이디로 하겠다.)
		int boardCnt = dao.getBoardList(vo.getMid());
		request.setAttribute("boardCnt", boardCnt);
	}
}

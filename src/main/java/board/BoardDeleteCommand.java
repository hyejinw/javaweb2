package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardDeleteCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 정상적인 경로를 통해서 삭제하지 않을 경우엔 홈으로 돌려보낸다.
		HttpSession session = request.getSession();
		String sNickName = (String) session.getAttribute("sNickName");
		int sLevel = (int) session.getAttribute("sLevel");
		
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		
		if(sLevel != 0) {
			if(!sNickName.equals(nickName)) {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("url", request.getContextPath() + "/");
				return;
			}  
		}	
		
		// 정상적인 경로일 때 처리
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1: Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5: Integer.parseInt(request.getParameter("pageSize"));
		
		BoardDAO dao = new BoardDAO();
		
		// 현재 글에 댓글이 있는지 확인 후 삭제처리한다.
		ArrayList<BoardReplyVO> vos = dao.getBoardReply(idx);
		if(vos.size() != 0) {
			request.setAttribute("msg", "현 게시글에 댓글이 존재합니다. \\n 댓글을 먼저 삭제해 주세요.");
			request.setAttribute("url", request.getContextPath() + "/BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
			return;
		}
		
		// 현재 글에 댓글이 없다면 삭제처리한다.
		int res = dao.setBoardDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.setAttribute("url", request.getContextPath() + "/BoardList.bo?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "게시글이 삭제되지 못했습니다.");
			request.setAttribute("url", request.getContextPath() + "/BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}				
	}

}

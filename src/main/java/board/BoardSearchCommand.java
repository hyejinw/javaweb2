package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> vos = dao.getBoardContentSearch(search, searchString);  // 여기에 사실 limit ?,? 이렇게 적어줄 변수를 원래 추가해줘야 한다.
		
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "제목";
		else if(search.equals("nickName")) searchTitle = "글쓴이";
		else searchTitle = "내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);  
		request.setAttribute("searchTitle", searchTitle);  // 사용자 배려차원에서 검색 필터를 한국어로 바꿔준다.
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchCount", vos.size());       // 전체 건수
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}

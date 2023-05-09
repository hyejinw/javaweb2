package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

// 디렉토리 패턴으로 만들었다!!!!
// 순수 ajax 시작!
@SuppressWarnings("serial")
@WebServlet("/AjaxTest1_2")
public class AjaxTest1_2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
//		PrintWriter out = response.getWriter();
//		out.print(vo.getName());
		
		String name = "";
		if(vo.getName() == null) {
			name="찾는 자료가 없습니다.";
		}
		else {
			name = vo.getName();
		}
		
		response.getWriter().write(name);   // 헤더에 문자형식으로 값을 집어넣고, 문자형식만 넘겨준다.
	}
}

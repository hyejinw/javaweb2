package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/FinderOk")
public class FinderOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginDAO dao = new LoginDAO();
		//LoginVO vo = new LoginVO();
		
		PrintWriter out = response.getWriter();
		LoginVO vo = dao.getMidCheck(mid);  // 새로 메소드를 만들지 않고 기존 '아이디 중복 체크'를 재사용
		if(vo.getMid() !=null) {
			if(name.equals(vo.getName())) {
//				out.print("<script>");
//				out.print("alert('비밀번호는 "+vo.getPwd()+" 입니다.');");
//				out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
//				out.print("</script>");
				request.setAttribute("vo", vo);
				String viewPage = "/study/0428_database/finderRes.jsp";
				request.getRequestDispatcher(viewPage).forward(request, response);
			}
			else {
				out.print("<script>");
				out.print("alert('입력하신 성명이 맞지 않습니다.');");
				out.print("location.href='"+request.getContextPath()+"/study/0428_database/finder.jsp';");
				out.print("</script>");
			}
		}
		else {
			out.print("<script>");
			out.print("alert('입력하신 아이디는 존재하지 않습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/finder.jsp';");
			out.print("</script>");
		}
	}
}

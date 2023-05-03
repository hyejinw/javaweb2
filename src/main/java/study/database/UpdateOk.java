package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/UpdateOk")
public class UpdateOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 이 부분 주의하자!!! update.jsp에선 mid값을 넘긴 적이 없다. 처음 login했을 때 session에 저장한 값을 가져오는 게 맞다!!!
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
	
		LoginDAO dao = new LoginDAO();
		int res = dao.setUpdateOk(vo);
		
		PrintWriter out = response.getWriter();
		if(res == 1) {
			session.setAttribute("sName", name);
			out.print("<script>");
			out.print("alert('개인정보 수정되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('회원정보 수정에 실패하였습니다.');");
			out.print("location.href='"+request.getContextPath()+"/database/Update';");
//		out.print("location.href='"+request.getContextPath()+"/study/0428_database/update.jsp';");
//	  직접 jsp를 부르지 않고 값을 전달해준 바로 그 전 단계로 가야 한다!!!
			out.print("</script>");
		}
	}
}

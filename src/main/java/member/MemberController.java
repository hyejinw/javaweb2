package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();   // 미완
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberJoin")) {   // 함
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();    // 함 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();    // 함 
			command.execute(request, response);
			viewPage += "/memberIdCheck.jsp";
		}
		else if(com.equals("/MemberNickCheck")) {
			command = new MemberNickCheckCommand();    // 함 
			command.execute(request, response);
			viewPage += "/memberNickCheck.jsp";
		}
		else if(com.equals("/IdFinder")) {       // 미완
			command = new IdFinderCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}

package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@SuppressWarnings("serial")
@WebServlet("*.fa")
public class LoginController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginInterface command = null;
        String viewPage = "/WEB-INF/study2/login3";
        
        String com = request.getRequestURI();
        com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
    
        if(com.equals("/Login")) {
            viewPage += "/login.jsp";
        }
        else if(com.equals("/LoginOk")) {
            command = new LoginOkCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        else if(com.equals("/MemberMain")) {
            viewPage += "/memberMain.jsp";
        }
        else if(com.equals("/Finder")) {
            viewPage += "/finder.jsp";
        }
        else if(com.equals("/FinderOk")) {
            command = new LoginFinderOkCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        else if(com.equals("/FinderRes")) {
	        	command = new LoginFinderResCommand();
	        	command.execute(request, response);
            viewPage += "/finderRes.jsp";
        }
        else if(com.equals("/Join")) {
            viewPage += "/join.jsp";
        }
        else if(com.equals("/JoinOk")) {
            command = new LoginJoinOkCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        else if(com.equals("/MemberMain")) {
        	viewPage += "/memberMain.jsp";
        }
        else if(com.equals("/LoginSearch")) {
            command = new LoginSearchCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        else if(com.equals("/MemberSearch")) {
        	command = new MemberSearchCommand();
        	command.execute(request, response);
            viewPage += "/memberSearch.jsp";
        }
        else if(com.equals("/List")) {
            command = new LoginListCommand();
            command.execute(request, response);
            viewPage += "/memberList.jsp";
        }
        else if(com.equals("/Logout")) {
            command = new LogoutCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        else if(com.equals("/DeleteOk")) {
            command = new LoginDeleteCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        else if(com.equals("/Update")) {
            command = new LoginUpdateCommand();
            command.execute(request, response);
            viewPage += "/update.jsp";
        }
        else if(com.equals("/UpdateOk")) {
            command = new LoginUpdateOkCommand();
            command.execute(request, response);
            viewPage = "/include/message.jsp";
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }
}
 

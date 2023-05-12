package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세션이 끊겼다면 작업의 진행을 중단, 그리고 홈으로 전송!
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");

		
		if(com.equals("/MemberLogin")) {
			command = new MemberLoginCommand();    // 함 (변경사항 많음)
			command.execute(request, response);
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();   // 미완
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();    // 함
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberJoin")) {   // 함
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();    // 함 (변경사항 많음)
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
		else if(com.equals("/IdFinder")) {       // 함
			viewPage += "/idFinder.jsp";
		}
		else if(com.equals("/IdFinderOk")) {
			command = new IdFinderOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/IdFinderRes")) {
			command = new IdFinderResCommand();
			command.execute(request, response);
			viewPage += "/idFinderRes.jsp";
		}	
		
		// 세션 끊기면 자동 홈으로 아웃
		else if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		
		
		else if(com.equals("/MemberMain")) {
			command = new MemberMainCommand();    // 함 
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		// 특정 회원이 작성한 글 보기
		else if(com.equals("/MemberGuestList")) {
			command = new MemberGuestListCommand();    // 함 
			command.execute(request, response);
			viewPage += "/memberGuestList.jsp";
		}
		// 멤버 리스트
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();    // 함 
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		// 회원 비밀번호 업데이트
		else if(com.equals("/MemberPwdUpdate")) {
			viewPage += "/memberPwdUpdate.jsp";
		}
		// 회원 비밀번호 업데이트
		else if(com.equals("/MemberPwdUpdateOk")) {
			command = new MemberPwdUpdateOkCommand();    // 함 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 회원 정보 수정을 위한 비밀번호 확인창 띄우기
		else if(com.equals("/MemberPwdCheckForm")) {
			viewPage += "/memberPwdCheckForm.jsp";
		}
		// 회원 정보 수정 위한 비밀번호 확인
		else if(com.equals("/MemberPwdCheckOk")) {
			command = new MemberPwdCheckOkCommand();    // 함 
			command.execute(request, response);
			viewPage = "/include/message.jsp";			
		}
		// 회원 정보 수정
		else if(com.equals("/MemberUpdate")) {
			command = new MemberUpdateCommand();    // 함 
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";
		}		
		// 회원 정보 수정 확인
		else if(com.equals("/MemberUpdateOk")) {
			command = new MemberUpdateOkCommand();    // 함 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}		
		// 회원 탈퇴
		else if(com.equals("/MemberDeleteAsk")) {
			command = new MemberDeleteAskCommand();    // 함 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}		

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}

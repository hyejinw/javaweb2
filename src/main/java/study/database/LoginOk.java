package study.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = new LoginVO();
		vo = dao.getLoginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		// 날짜 비교를 위한 초기 설정 
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		int todayCount = vo.getTodayCount();
		String lastDate = vo.getLastDate();
		
		/*
		 * int failCount = vo.getFailCount(); System.out.println(failCount);
		 */
		
  	// 로그인 했을 때 DB에 값이 있는 경우
		if(vo.getName() != null) {
			// 로그인에 성공헀으면 failCount를 무조건 0으로 세팅한다.
			dao.failCount(0, mid);
			
		 /*
      방문포인트 처리하기('최종접속일처리'/'방문카운트'도 함께한다.)
      db의 최종접속일(10자리)와 시스템날짜(10자리)를 비교하여 같으면 todaCount = vo.getTodayCount()+1, 같지않으면 todayCount = 0
      이때 접속일이 다르다면 point=vo.getPoint()+10, 같지않으면 다시 방문카운트를 비교해서 5이내면 point=vo.getPoint()+10, 5이상이면 point=vo.getPoint() 처리한다.
      작업처리후 다음과같이 메소드호출하여 DB처리한다.
      dao.setPointPlus(mid, todayCount, point);
     */
      // 날짜 비교
      int point = 0;
      
      if(strToday.equals(lastDate.substring(0,10))) {
          todayCount++;
          if(vo.getTodayCount() < 5) point = vo.getPoint() + 10;
          else point = vo.getPoint();
      }
      // 다른 날이다.
      else {
          todayCount = 1;
          point = vo.getPoint() + 10;
      }
      
      // 변경된 사항을 update한다.
      dao.setPointPlus(mid, point, todayCount);
      
      // 변경된 사항을 다시 불러온다.
      vo = dao.getLoginCheck(mid, pwd);  
			
			// 1. 세션처리
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", lastDate);
			/* session.setAttribute("sLastDate", vo.getLastDate()); 업데이트 전의 최종 방문일을 찾아내야 한다. 이렇게 적으면 현재 로그인한 시간이 뜬다. */
			session.setAttribute("sTodayCount", vo.getTodayCount());
			
			
		  // 2.쿠키에 아이디를 저장/해제 처리한다.
      // 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
      String idSave = request.getParameter("idSave")==null ? "off" : "on";
      System.out.println("idSave : " + idSave);
      Cookie cookieMid = new Cookie("cMid", mid);
      cookieMid.setPath("/");
      if(idSave.equals("on")) {
          cookieMid.setMaxAge(60*60*24*7);
      }
      else {
      	cookieMid.setMaxAge(0);
      }
      response.addCookie(cookieMid);
      
			out.print("<script>");
			out.print("alert('"+mid+"님의 로그인 성공');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
		}
		
		// 로그인 했을 때 DB에 값이 없는 경우
		else {
			
			// nonono!! 이렇게 못 쓴다. 로그인에 계속 로그인에 실패했을 때를 기준으로 만들어야 한다. 
			//마지막으로 로그인한 날과 다른 날이면 failCount 값을 0으로 만든다.
			/*
			 * if(!strToday.equals(lastDate.substring(0,10))) { dao.failCount(0, mid); }
			 */
			
			vo = dao.getMidCheck(mid);
			int failCount = vo.getFailCount();
			System.out.println(failCount);
			
			// 회원 인증 실패 시 처리
			if(failCount < 4) {
				failCount++;
				dao.failCount(failCount, mid);

				out.print("<script>");
				out.print("alert('로그인 "+failCount+"회 실패.');");
				out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
				out.print("</script>");
			}

			else {
				dao.failCount(0, mid);

				out.print("<script>");
				out.print("alert('로그인 인증 5회 실패.\\n비밀번호 찾기 페이지로 이동합니다.');");
				out.print("location.href='"+request.getContextPath()+"/study/0428_database/finder.jsp';");
				out.print("</script>");
			}
		}
	}
}
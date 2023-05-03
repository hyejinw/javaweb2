package study2.login3;
 
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
 
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
//LoginOkCommand.java 에
//로그인 오류 횟수를 session에 저장하고 빼는 방법으로 코드 수정했습니다. 
public class LoginOkCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int fail = session.getAttribute("sFail")==null ? 0 : (int) session.getAttribute("sFail");  //로그인 실패했을 때 쓸 거여!
        session.setAttribute("sFail", fail);
        
        String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
        String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
        
        LoginDAO dao = new LoginDAO();
        LoginVO vo = new LoginVO();
        vo = dao.getLoginCheck(mid, pwd);
        
        // 날짜 비교를 위한 초기 설정 
        Date today = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String strToday = sdf.format(today);
        
        int todayCount = vo.getTodayCount();
        String lastDate = vo.getLastDate();
        
      // 로그인 했을 때 DB에 값이 있는 경우
        if(vo.getName() != null) {
            // 로그인에 성공헀으면 sFail를 무조건 0으로 세팅한다.
            session.setAttribute("sFail", 0);
 
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
      request.setAttribute("msg", mid+"님 로그인 되었습니다.");
      request.setAttribute("url", request.getContextPath()+"/MemberMain.pa");
        }
        
        // 로그인 했을 때 DB에 값이 없는 경우
        else {
            session.setAttribute("sFail", fail + 1);
            fail = (int) session.getAttribute("sFail");
            
            // 회원 인증 실패 시 처리
            if(fail < 5) {
          request.setAttribute("msg", "로그인 "+fail+"회 실패.");
          request.setAttribute("url", request.getContextPath()+"/Login.pa");                
            }
 
            else {
                session.setAttribute("sFail", 0);
                request.setAttribute("msg", "로그인 인증 5회 실패.\\n비밀번호 찾기 페이지로 이동합니다.");
                request.setAttribute("url", request.getContextPath()+"/Finder.pa");                
            }        
        }
    }
}
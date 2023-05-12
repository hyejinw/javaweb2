package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;
import guest.GuestDAO;

public class MemberLoginOkCommand implements MemberInterface {
//로그인 오류 횟수를 session에 저장하고 뺀다. 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		// 여기부터 다시! salt라는 게 필요하다!
		vo = dao.getMemberMidCheck(mid);

		// String salt = vo.getSalt();
		pwd = vo.getSalt() + pwd;

		// 다시 암호화 처리!!!!!!
		SecurityUtil security = new SecurityUtil();
		String shaPwd = security.encryptSHA256(pwd);

		// 진짜 아이디가 없거나, 1개월 전에 탈퇴한 회원일 때
		if (vo.getMid() == null || vo.getUserDel().equals("OK")) {
			request.setAttribute("msg", "입력한 아이디는 없는 회원입니다.");
			request.setAttribute("url", request.getContextPath() + "/MemberLogin.mem");
			return;
		} 
		if (!shaPwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "잘못된 비밀번호 입니다.");
			request.setAttribute("url", request.getContextPath() + "/MemberLogin.mem");
			return;
		}

		// 로그인 성공 시에 처리할 내용 (1.회원 등업관련 1-1.주요필드 세션에 저장 2.오늘 방문횟수 처리 3.총방문수와 방문포인트 4.쿠키 아이디저장 )
		// 1
//		// 준회원 -> 정회원 등업관련 (방명록 작성 5건 이상, 방문횟수 10회 이상)
//		  이걸 여기서 처리하면 등업확인을 위해 재로그인을 해야 하는 불편함이 있다! 그래서 10이 아닌 9로 둔 거지만 그래도! 프로그램 상 정확히 10이 됐을 때 정회원으로 바꾸는 게 더 좋은 것 같다.
//		if(vo.getLevel() == 1) {
//			int guestCnt = dao.getGuestList(vo.getMid(), vo.getNickName());
//			
//			if(guestCnt >= 5 && vo.getVisitCnt() >= 9) dao.setLevelUpdate(vo.getMid());
//			
//		}
//		vo = dao.getMemberMidCheck(mid);
		
		// 1-1
		HttpSession session = request.getSession();
		int fail = session.getAttribute("sFail") == null ? 0 : (int) session.getAttribute("sFail"); // 로그인 실패했을 때 쓸 거여!
		session.setAttribute("sFail", fail);

		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sLastDate", vo.getLastDate());

	
		
		// 2 & 3
		// 날짜 비교를 위한 초기 설정
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);

		// 오늘 처음 방문 시는 오늘 방문 카운트(todayCnt)를 0으로 세팅한다.
		if (!vo.getLastDate().substring(0, 10).equals(strToday)) {
			dao.setTodayCntUpdate(mid);
			vo.setTodayCnt(0);
		}

		// 하루 방문포인트 최대 50점(5회 방문까지)
		int nowTodayPoint = 0;
		if (vo.getTodayCnt() >= 5) {
			nowTodayPoint = vo.getPoint();
		} else {
			nowTodayPoint = vo.getPoint() + 10;
		}
		dao.setMemberTotalUpdate(mid, nowTodayPoint);

		// 4
		// 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
		String idSave = request.getParameter("idSave") == null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if (idSave.equals("on")) {
			cookieMid.setMaxAge(60 * 60 * 24 * 7);
		} else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		request.setAttribute("msg", vo.getNickName() + "님 로그인 되었습니다.");
		request.setAttribute("url", request.getContextPath() + "/MemberMain.mem");

		
		/*
		 * if(vo.getMid() != null) { // 로그인에 성공헀으면 sFail를 무조건 0으로 세팅한다.
		 * session.setAttribute("sFail", 0);
		 * 
		 * // 날짜 비교 int point = 0;
		 * 
		 * if(strToday.equals(lastDate.substring(0,10))) { todayCnt++;
		 * if(vo.getTodayCnt() < 5) point = vo.getPoint() + 10; else point =
		 * vo.getPoint(); } // 다른 날이다. else { todayCnt = 1; point = vo.getPoint() + 10;
		 * }
		 * 
		 * // 변경된 사항을 update한다. dao.setPointPlus(mid, point, todayCnt);
		 * 
		 * // 변경된 사항을 다시 불러온다. vo = dao.getMemberLoginCheck(mid, pwd);
		 * 
		 * // 1. 세션처리 session.setAttribute("sMid", mid); session.setAttribute("sName",
		 * vo.getName()); session.setAttribute("sPoint", vo.getPoint());
		 * session.setAttribute("sLastDate", lastDate);
		 * session.setAttribute("sLastDate", vo.getLastDate()); 업데이트 전의 최종 방문일을 찾아내야 한다.
		 * 이렇게 적으면 현재 로그인한 시간이 뜬다. session.setAttribute("sTodayCount",
		 * vo.getTodayCnt());
		 * 
		 * 
		 * // 2.쿠키에 아이디를 저장/해제 처리한다. }
		 * 
		 * // 로그인 했을 때 DB에 값이 없는 경우 else { session.setAttribute("sFail", fail + 1); fail
		 * = (int) session.getAttribute("sFail");
		 * 
		 * // 회원 인증 실패 시 처리 if(fail < 5) { request.setAttribute("msg",
		 * "로그인 "+fail+"회 실패."); request.setAttribute("url",
		 * request.getContextPath()+"/MemberLogin.mem"); } else {
		 * session.setAttribute("sFail", 0); request.setAttribute("msg",
		 * "로그인 인증 5회 실패.\\아이디 찾기 페이지로 이동합니다."); request.setAttribute("url",
		 * request.getContextPath()+"/IdFinder.mem"); } }
		 */
	}
}
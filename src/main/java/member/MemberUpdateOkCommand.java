package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 값 가져오기
		HttpSession session = request.getSession();
		String mid =(String) session.getAttribute("sMid");
		String sNickName =(String) session.getAttribute("sNickName");
		
		String nickName = request.getParameter("nickName")==null ? "":request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "":request.getParameter("name");
		String gender = request.getParameter("gender")==null ? "":request.getParameter("gender");
		
		//생일은 값이 null 왔다고 공백("")으로 보내면 오류가 생긴다. => (30번처럼 적어도 오류는 뜬다: 미해결) => 결국 form에서 기본값을 줬다.
		//String birthday = request.getParameter("birthday")==null ? now : request.getParameter("birthday");
		//System.out.println("birthday: "+ birthday);
		String birthday = request.getParameter("birthday")==null ? "" : request.getParameter("birthday");

		String tel = request.getParameter("tel")==null ? "":request.getParameter("tel");
		String address = request.getParameter("address")==null ? "":request.getParameter("address");
		String email = request.getParameter("email")==null ? "":request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "":request.getParameter("homePage");
		String job = request.getParameter("job")==null ? "":request.getParameter("job");
		
		// hobby는 배열로 오기 때문에 따로 추가 처리가 필요
		String[] hobbies = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbies.length != 0) {
			for(String strHobby : hobbies) {
				hobby += strHobby + "/";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		
		// noimage.jsp를 여기다 줄 필요가 있는지 의문이다.
		String photo = request.getParameter("photo")==null ? "noimage.jpg":request.getParameter("photo");
		String content = request.getParameter("content")==null ? "":request.getParameter("content");
		String userInfor = request.getParameter("userInfor")==null ? "":request.getParameter("userInfor");
		
		
		// 2. BackEnd 체크(null값, 길이, 중복여부 확인)
		// 닉네임 중복체크
		MemberDAO dao = new MemberDAO();
		
		if(!nickName.equals(sNickName)) {
			String tempNickName =dao.getMemberNickCheck1(nickName).getNickName();
			//MemberVO vo2 = dao.getMemberNickCheck1(nickName);
			
			// 중복 확인
			if(tempNickName != null) {
				request.setAttribute("msg", "이미 사용 중인 닉네임입니다.");
				request.setAttribute("url", request.getContextPath() + "/MemberUpdate.mem");
				return;
			}
		}

		// 3. 모든 체크 완료 후, vo에 값을 담는다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);

		int res = dao.setMemberUpdateOk(vo);
		
		if(res == 1) {
			// 세션에 닉네임 새로 저장
			session.setAttribute("sNickName", nickName);
			
			request.setAttribute("msg", "회원 정보 수정을 완료했습니다!");
			request.setAttribute("url", request.getContextPath() + "/MemberMain.mem");
		}
		else {
			request.setAttribute("msg", "회원 정보에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("url", request.getContextPath() + "/MemberUpdate.mem");
		}
	}

}

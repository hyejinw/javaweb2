package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Date date = new Date();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		String now = formatter.format(date);
//		System.out.println("now: "+ now);
		
		// 1. 값 가져오기
		String mid = request.getParameter("mid")==null ? "":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "":request.getParameter("pwd");
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
		
		// 아이디와 닉네임 중복체크
		MemberDAO dao = new MemberDAO();
		MemberVO vo =dao.getMemberMidCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("msg", "이미 사용 중인 아이디입니다.");
			request.setAttribute("url", request.getContextPath() + "/MemberJoin.mem");
			return;
		}
		vo =dao.getMemberMidCheck(mid);
		if(vo.getNickName() != null) {
			request.setAttribute("msg", "이미 사용 중인 닉네임입니다.");
			request.setAttribute("url", request.getContextPath() + "/MemberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화 처리!!!!!!
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		pwd = salt + pwd;
		
    SecurityUtil security = new SecurityUtil();
    String shaPwd = security.encryptSHA256(pwd);
		
    // 3. 모든 체크 완료 후, vo에 값을 담는다.
		vo = new MemberVO();
		vo.setMid(mid);
//		vo.setPwd(pwd);
		vo.setPwd(shaPwd);
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
		vo.setSalt(salt);

		int res = dao.setMemberJoin(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "회원가입을 성공했습니다. 만나서 반갑습니다!");
			request.setAttribute("url", request.getContextPath() + "/MemberLogin.mem");
		}
		else {
			request.setAttribute("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("url", request.getContextPath() + "/MemberJoin.mem");
		}
	}
}

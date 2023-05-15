package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
		// 회원 사진 업로드 관련
    String realPath = request.getServletContext().getRealPath("/images/pdstest");
    int maxSize = 1024 * 1024 * 10;   
    String encoding = "UTF-8";
		
    // 파일 업로드처리.....(객체가 생성되면서 파일이 업로드처리된다.)
    MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());

    String photo = multi.getFilesystemName("fName") == null ? "noimage.jpg" :  multi.getFilesystemName("fName");
    
    
		// 1. 값 가져오기
		String mid = multi.getParameter("mid")==null ? "":multi.getParameter("mid");
		String pwd = multi.getParameter("pwd")==null ? "":multi.getParameter("pwd");
		String nickName = multi.getParameter("nickName")==null ? "":multi.getParameter("nickName");
		String name = multi.getParameter("name")==null ? "":multi.getParameter("name");
		String gender = multi.getParameter("gender")==null ? "":multi.getParameter("gender");
		
		String birthday = multi.getParameter("birthday")==null ? "" : multi.getParameter("birthday");

		String tel = multi.getParameter("tel")==null ? "":multi.getParameter("tel");
		String address = multi.getParameter("address")==null ? "":multi.getParameter("address");
		String email = multi.getParameter("email")==null ? "":multi.getParameter("email");
		String homePage = multi.getParameter("homePage")==null ? "":multi.getParameter("homePage");
		String job = multi.getParameter("job")==null ? "":multi.getParameter("job");
		
		// hobby는 배열로 오기 때문에 따로 추가 처리가 필요
		String[] hobbies = multi.getParameterValues("hobby");
		String hobby = "";
		if(hobbies.length != 0) {
			for(String strHobby : hobbies) {
				hobby += strHobby + "/";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		
		String content = multi.getParameter("content")==null ? "":multi.getParameter("content");
		String userInfor = multi.getParameter("userInfor")==null ? "":multi.getParameter("userInfor");
		
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

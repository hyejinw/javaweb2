package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class LoginJoinOkCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
        String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
        String name = request.getParameter("name")==null ? "" : request.getParameter("name");
        
        //가져온 값을 vo에 넣어준다!
        LoginVO vo = new LoginVO();
        vo.setMid(mid);
        vo.setPwd(pwd);
        vo.setName(name);
        
        LoginDAO dao = new LoginDAO();
        // 중복 아이디 검사체크 필요!!!!
        LoginVO vo2 = dao.getMidCheck(mid);
        
        String msg = "", url = ""; 
        if(vo2.getMid() != null) {
            msg = "아이디가 중복되었습니다.";
            url = "/Join.fa";
        }
        else {
        //아이디가 중복 x -> DB에 저장!!!!
            dao.setJoinOk(vo);
            msg = "회원 가입되었습니다. 반갑습니다!";
            url = "/Login.fa";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", request.getContextPath() + url);
    }
}

package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class LoginSearchCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
        
        LoginDAO dao = new LoginDAO();
    
        LoginVO vo = dao.getMidCheck(mid);
        
        String msg = "", url = "";
        if(vo.getMid() != null) {
            //아이디가 있다.
            //request.setAttribute("vo", vo);
            msg = "NO";
            url = "/MemberSearch.fa?mid="+mid;
        }
        else {
            //아이디가 없다.
            msg = "회원 정보가 없습니다.";
            url = "/MemberMain.fa";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", request.getContextPath() + url);
    }
}
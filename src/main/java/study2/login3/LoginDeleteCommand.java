package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class LoginDeleteCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String mid = (String) session.getAttribute("sMid");
        LoginDAO dao = new LoginDAO();
        
        int res = dao.setDeleteOk(mid);
        String msg = "", url = "";
        
        if(res == 1) {
            msg = "탈퇴 처리되었습니다.";
            url = "/Logout.fa";
        }
        else {
            msg = "탈퇴에 실패하였습니다.";
            url = "/MemberMain.fa";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", request.getContextPath() + url);
    }
}
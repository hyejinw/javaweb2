package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class LogoutCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //session에 저장되어 있는 sMid 변수의 값을 가져와서 String으로 타입을 변환한다.
        String mid = (String)session.getAttribute("sMid");
        
        // 로그아웃 후에는 session에 저장된 모든 값을 지워버린다.
        session.invalidate();
        
        request.setAttribute("msg", mid+"님 로그아웃 되었습니다.");
        request.setAttribute("url", request.getContextPath() + "/Login.fa");
    }
}
 
package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class LoginFinderOkCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
        String name = request.getParameter("name")==null ? "" : request.getParameter("name");
        
        LoginDAO dao = new LoginDAO();
        LoginVO vo = dao.getMidCheck(mid);  // 새로 메소드를 만들지 않고 기존 '아이디 중복 체크'를 재사용
        
        String msg = "", url = "";
        
        if(vo.getMid() !=null) {
            if(name.equals(vo.getName())) {
                msg = "NO";
                url = "/FinderRes.fa?mid="+mid;
            }
            else {
                msg = "입력하신 성명이 맞지 않습니다.";
                url = "/Finder.fa";
            }
        }
        else {
            msg = "입력하신 아이디는 존재하지 않습니다.";
            url = "/Finder.fa";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", request.getContextPath() + url);
    }
}
 

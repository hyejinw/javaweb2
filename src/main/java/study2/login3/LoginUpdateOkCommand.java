package study2.login3;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class LoginUpdateOkCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 이 부분 주의하자!!! update.jsp에선 mid값을 넘긴 적이 없다. 처음 login했을 때 session에 저장한 값을 가져오는 게 맞다!!!
        HttpSession session = request.getSession();
        String mid = (String) session.getAttribute("sMid");
        String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
        String name = request.getParameter("name")==null ? "" : request.getParameter("name");
        
        LoginVO vo = new LoginVO();
        vo.setMid(mid);
        vo.setPwd(pwd);
        vo.setName(name);
    
        LoginDAO dao = new LoginDAO();
        int res = dao.setUpdateOk(vo);
        String msg = "", url = "";
        
        if(res == 1) {
            session.setAttribute("sName", name);
            msg = "개인정보가 수정되었습니다.";
            url = "/MemberMain.fa";
        }
        else {
            msg = "회원정보 수정에 실패하였습니다.";
            url = "/Update.fa";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", request.getContextPath() + url);
    }
}
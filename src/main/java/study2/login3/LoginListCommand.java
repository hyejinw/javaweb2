package study2.login3;
 
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class LoginListCommand implements LoginInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDAO dao = new LoginDAO();
         
        ArrayList<LoginVO> vos = dao.getLoginList();
 
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String strToday = sdf.format(today);
    
    request.setAttribute("vos", vos);
    }
}
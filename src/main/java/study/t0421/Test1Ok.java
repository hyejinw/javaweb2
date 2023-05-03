package study.t0421;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0421/Test1Ok")
public class Test1Ok extends HttpServlet {
	 @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html; charset=utf-8");
		 
		 /*
			// String mid = request.getParameter("mid"); 
		 String mid = "";
		 if(request.getParameter("mid") == null) mid = "";
		 
		 String name = request.getParameter("name");
		 
//	 if(mid.equals("admin")) {
		 if(request.getParameter("mid").equals("admin")) {
			 System.out.println("관리자님 환영합니다.");
		 }
		 else {
			 System.out.println("방문객님 환영합니다.");
			 
		 }
		 */
		 
		 // Null 값 처리 : 삼항 연산자를 씁니당
		 String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		 String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		 String job = request.getParameter("job")==null ? "" : request.getParameter("job");


		 System.out.println("mid : " + mid);
		 System.out.println("name : " + name);
		 System.out.println("job : " + job);
		 
		 request.setAttribute("mid", mid); // 저장소에 담기!
		 request.setAttribute("name", name); // 저장소에 담기!
		 request.setAttribute("job", job); // 저장소에 담기!
		 
//		 RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/study/0421/test1Res.jsp");
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0421/test1Res2.jsp");
		 dispatcher.forward(request, response);
		 
		 // 새로고침을 하면 화면에 test1Res.jsp이 올라가 있더라도 url주소 파일이 새로고침되는 것이다. 
		 // 그런데 만약 Test1Ok가 저장소였다면 새로고침될 때마다 값이 추가 저장된다. 중복저장!
		 // 따라서 여기에 계속 머무르게 하면 안 된다.
		 
	}	
}

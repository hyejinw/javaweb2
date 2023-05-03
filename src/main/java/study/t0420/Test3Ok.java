package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test3Ok")
public class Test3Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name= request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender= request.getParameter("gender");
		
		String[] hobbies = request.getParameterValues("hobby");   // 값이 배열로 넘어올 때는 values로 적어주자!
		
//		System.out.println(hobbies[0]);
		
		String strHobby = "";        
		for(String hobby : hobbies) {
			strHobby += hobby + " | ";
		}
		strHobby = strHobby.substring(0, strHobby.length()-2); 
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + strHobby);
		
		
//		PrintWriter out = response.getWriter();
//		
//		out.print("<script>");
//		out.print("alert('자료가 저장되었습니다.');");
//		out.print("location.href = '"+request.getContextPath()+"/study/0420/test3.jsp';");
//		out.print("</script>");
		
		// DB에 자료 저장 후 view로 이동하기  (이건 동기식/직렬화이다.)
		 response.sendRedirect(request.getContextPath()+"/study/0420/test3Res.jsp?name="+name); // location.href와 똑같은 명령이다. 서버에서 사용하는 명령.
		                                                                               // name의 값을 보낼 수 있다.
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test3Res.jsp"); //contextPath를 적지 않아도 된다.
//		dispatcher.forward(request, response);   // 서버에서 가져온 값request을 다시 클라이언트로 보낸다.response
	}
}

package study.t0420;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test4Ok")
public class Test4Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name= request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender= request.getParameter("gender");
		
		String[] hobbies = request.getParameterValues("hobby");   // 값이 배열로 넘어올 때는 values로 적어주자!
		
		String strHobby = "";        
		for(String hobby : hobbies) {
			strHobby += hobby + " | ";
		}
		strHobby = strHobby.substring(0, strHobby.length()-2);
		
		String hostIp = request.getParameter("hostIp");
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + strHobby);
		System.out.println("접속자IP : " + hostIp);
		
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("str", strHobby);
		request.setAttribute("hostIp", hostIp);   // 결과는 ip버전 6로 나온다.
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test4Res.jsp"); //contextPath를 적지 않아도 된다.
		dispatcher.forward(request, response);   // 서버에서 가져온 값request을 다시 클라이언트로 보낸다.response
	}
}

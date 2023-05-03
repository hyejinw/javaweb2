package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t8Get")
public class Test8 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
	
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));  // 서버에서 가져온 값의 타입은 모두 문자열이다.
		
		System.out.println("성명 : " + name);  // 이건 console에 찍는 거고
		System.out.println("나이 : " + age);
		
		
		PrintWriter out = response.getWriter();  // 이건 웹 화면/view에 찍는 것이다.
		out.print("성명 : " + name + "<br />");
		out.print("나이 : " + age);
	}

}

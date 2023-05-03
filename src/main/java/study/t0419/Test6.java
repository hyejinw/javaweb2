package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t6")
public class Test6 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");   // 이렇게 적으면 서버는 값을 가져올 때 html를 읽어주고, 한글은 utf-8 방식으로 읽어준다/응답해준다.
		
		PrintWriter out = response.getWriter(); // 마찬가지로 서버에서 response된 값을 가져다 쓰겠다는 의미로 객체를 하나 생성해준다.
		
		out.print("안녕 클레오파트라 세상에서 제일가는 포테이토칩 <br />");
		out.print("God damn it");
	}
}

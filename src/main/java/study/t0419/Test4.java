package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t4")     // 접속할 url 주소가 된다.
public class Test4 extends HttpServlet {
	
	@Override   // 앞에 한 것처럼 복잡하게 많이 적는 게 아니라, 부모에게 상속받은 메소드를 override해서 내 입맛에 맞게 재정의해서 쓰면 된다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		out.println("Servlet Test.../ T4....");
	}
}

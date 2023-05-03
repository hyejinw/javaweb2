package study.t0427;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0427/el2Ok")
public class El2Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String[] hobbies = request.getParameterValues("hobby");

		
		System.out.println(hobbies);  // 주소가 나온다.
		
		for(String hobby : hobbies) { // 방법1) 값을 뽑아낸다.
			System.out.println(hobby);
		}

		for(int i=0; i<hobbies.length; i++) { // 방법2)
			System.out.println(hobbies[i]);
		}
		request.setAttribute("name", name);
		request.setAttribute("hobbies", hobbies);
		
		String viewpage = "/study/0427/el2.jsp";
		request.getRequestDispatcher(viewpage).forward(request, response);
	}
}

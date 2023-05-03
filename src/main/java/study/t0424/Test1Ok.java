package study.t0424;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0424/test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리를 필터에서 하면 아래 2줄 생략 가능!
		request.setCharacterEncoding("utf-8");
		response.setContentType("test/html; charset=utf-8");
		
		// Null 값 체크
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		// gender는 null이 넘어올 수 없다. 초기값을 주었다!
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender"); 
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
	
		//DB에 삽입 처리: 입력받은 변수의 값을 VO에 담아서 처리
		Test1VO vo = new Test1VO();
		
		// 이번에는 setter를 통해서 값을 담을 것이다.
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setJob(job);
		vo.setAddress(address);
		// vo에 담긴 자료를 DB에 저장되었다
		
		
		//처리된 자료들을 view에 보여주기 위해 request 저장소에 담아서 넘겨준다.
		request.setAttribute("vo", vo);
		
		String viewPage ="/study/0424/test1Res.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);   아래처럼 한 줄로 작성할 수 있다.
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}

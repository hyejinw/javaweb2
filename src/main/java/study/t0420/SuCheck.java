package study.t0420;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/SuCheck")
public class SuCheck extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] su = request.getParameterValues("su");
		
		int[] no = new int[5];
		
		for(int i=0; i<5; i++) {
			no[i] = Integer.parseInt(su[i]);
		}
		
		// 정렬
	    for (int i = 1; i < no.length; i++) {
	        int tmp = no[i];
	        int j = i - 1;
	        while (j >= 0 && tmp < no[j]) {
	            no[j + 1] = no[j];
	            j--;
	        }
	        no[j + 1] = tmp;
	    }

//		for(int i=1; i<no.length; i++) {
//			int position = i;
//			
//			while(position > 0 && no[i] < no[position - 1]) {
//				no[position] = no[position - 1];
//				position--;
//			}
//			no[position] = no[i];
//		}
		System.out.println(no[0]);
		String str = "";        
		for(int nos : no) {
			str += nos + " | ";
		}
		str = str.substring(0, str.length()-2);
		
		request.setAttribute("str", str);
		System.out.println(su);

//		response.sendRedirect(request.getContextPath()+"/study/0420/suSort.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/suRes.jsp"); 
	  dispatcher.forward(request, response);
	}
}

package study2.ajax2;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import study2.StudyInterface;

public class UserSearchCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")== null ? 0: Integer.parseInt(request.getParameter("idx"));
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.userSearch(idx);
		HttpSession session = request.getSession();
		session.setAttribute("sMid", vo.getMid());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("age", vo.getAge()+"");
		map.put("address", vo.getAddress());
		
		JSONObject memberObj = new JSONObject(map);		
		String str = memberObj.toJSONString();
		
		response.getWriter().write(str);
	}

}

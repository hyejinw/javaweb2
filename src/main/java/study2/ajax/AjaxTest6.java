package study2.ajax;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.MemberDAO;
import member.MemberVO;

// 디렉토리 패턴으로 만들었다!!!!
// 순수 ajax 시작!
@SuppressWarnings("serial")
//@WebServlet("/AjaxTest4")
public class AjaxTest6 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		System.out.println("mid : "+mid);
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		HashMap<String, String> map = new HashMap<>(); // map 은 순서와 상관없다.
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("nickName", vo.getNickName());
		map.put("gender", vo.getGender());
		map.put("point", vo.getPoint()+"");

		System.out.println("map : " + map);
		// HashMap형식의 자료를 문자열로 변환
		// JSON 형식의 자료로 변경. Map 형식의 자료를 저장할 JSON 객체를 생성
		// 주소: https://code.google.com/archive/p/json-simple/downloads 에서 첫 번째 파일 다운로드 후 lib에 추가
		JSONObject memberObj = new JSONObject(map);
		System.out.println("memberObj : " +memberObj);
		//response.getWriter().write(memberObj.toString());   // 헤더에 문자형식으로 값을 집어넣고, 문자형식만 넘겨준다.

		
		// JSON 객체를 문자열로 변경처리 toJSONString()
		String str = memberObj.toJSONString();
		System.out.println("str : " + str);
		response.getWriter().write(str);   // 헤더에 문자형식으로 값을 집어넣고, 문자형식만 넘겨준다.
		
		
		/*
	   vos객체를 만들어서 JSON객체로 저장하여 넘겨주고자 할 경우는?
	   JSONArray jsonVOS = new JSONArray();
	   jsonVOS.add(memberObj);
	*/
	
	}
}

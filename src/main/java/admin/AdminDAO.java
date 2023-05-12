package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;
import member.MemberVO;

public class AdminDAO {

	// 싱글톤으로 선언된 DB연결 객체(GetConn)을 연결
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	// 회원 등급 변경
	public String setMemberLevelChange(int level, int idx) {
		String res = "0";
		try {
			sql = "update member set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
			res = "1";
			
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 회원 삭제
	public void setMemberDelete(int idx) {
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	
}
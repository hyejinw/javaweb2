package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class PdsDAO {
	// 싱글톤으로 선언된 DB연결 객체(GetConn)을 연결
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	PdsVO vo = null;

	
	// 자료실 파트별 리스트 구하기
	public ArrayList<PdsVO> getPdsList(String part) {
		ArrayList<PdsVO> vos = new ArrayList<PdsVO>();
		 try {
			 if(part.equals("전체")) {
				 sql = "select * from pds order by idx desc";
				 pstmt = conn.prepareStatement(sql);
			 }
			 else {
				 sql = "select * from pds where part = ? order by idx desc";
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, part);
			 }
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 vo = new PdsVO();
				 vo.setIdx(rs.getInt("idx"));
				 vo.setMid(rs.getString("mid"));
				 vo.setNickName(rs.getString("nickName"));
				 vo.setfName(rs.getString("fName"));
				 vo.setfSName(rs.getString("fSName"));
				 vo.setfSize(rs.getInt("fSize"));
				 vo.setTitle(rs.getString("title"));
				 vo.setPart(rs.getString("part"));
				 vo.setPwd(rs.getString("pwd"));
				 vo.setfDate(rs.getString("fDate"));
				 vo.setDownNum(rs.getInt("downNum"));
				 vo.setOpenSw(rs.getString("openSw"));
				 vo.setContent(rs.getString("content"));
				 vo.setHostIp(rs.getString("hostIp"));
				 
				 vos.add(vo);
			 }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 자료실 파일 업로드(DB 저장)
	public int setPdsInputOk(PdsVO vo) {
		int res = 0;
		try {
			sql = "insert into pds values(default,?,?,?,?,?,?,?,?,default,default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getPart());
			pstmt.setString(8, vo.getPwd());
			pstmt.setString(9, vo.getOpenSw());
			pstmt.setString(10, vo.getContent());
			pstmt.setString(11, vo.getHostIp());
			
			pstmt.executeUpdate();
			res = 1;
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 다운로드 횟수 증가
	public void setPdsDownNumCheck(int idx) {
		try {
			sql = "update pds set downNum = downNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// idx로 개별 자료 검색
	public PdsVO getIdxSearch(int idx) {
		PdsVO vo = new PdsVO();
		try {
			sql = "select * from pds where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
			  vo.setMid(rs.getString("mid"));
			  vo.setNickName(rs.getString("nickName"));
			  vo.setfName(rs.getString("fName"));
			  vo.setfSName(rs.getString("fSName"));
			  vo.setfSize(rs.getInt("fSize"));
			  vo.setTitle(rs.getString("title"));
			  vo.setPart(rs.getString("part"));
			  vo.setPwd(rs.getString("pwd"));
			  vo.setfDate(rs.getString("fDate"));
		 	  vo.setDownNum(rs.getInt("downNum"));
		    vo.setOpenSw(rs.getString("openSw"));
			  vo.setContent(rs.getString("content"));
			  vo.setHostIp(rs.getString("hostIp"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 파일시스템에서 파일 삭제 후, DB에서 자료실의 정보를 삭제
	public String setPdsDelete(int idx) {
		String res = "0";
		try {
			sql = "delete from pds where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = "1";
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
}

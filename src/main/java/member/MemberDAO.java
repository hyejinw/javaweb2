package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import guest.GuestVO;

public class MemberDAO {

	// 싱글톤으로 선언된 DB연결 객체(GetConn)을 연결
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	// 아이디 체크 후 자료가 있으면 vo에 개인 정보를 모두 담는다. (나중에 재사용할 거라 다 담았다)
	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	public MemberVO getMemberNickCheck1(String nickName) {
		vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 닉네임 체크 후 자료가 있으면 vo에 닉네임만 담는다. => (변경)그냥 변수만 담아도 될 듯
	public int getMemberNickCheck(String nickName) {
		//vo = new MemberVO();
		int res = 1;
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) res = 0;
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return res;
	}

	// 회원가입 
	public int setMemberJoin(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			pstmt.setString(16, vo.getSalt());
			pstmt.executeUpdate();
			res = 1;
		
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//(로그인 확인용 메소드)
	
	//오늘 처음 방문시에 방문카운트를 0으로 초기화.
	public void setTodayCntUpdate(String mid) {
		try {
			sql = "update member set todayCnt=0 where mid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 로그인 시, point증가, todayCnt 증가, visitCnt 증가, lastDate 변경
	public void setMemberTotalUpdate(String mid, int nowTodayPoint) {
		try {
      sql = "update member set point=?, lastDate=now(), todayCnt=todayCnt+1, visitCnt=visitCnt+1 where mid=?";
      pstmt = conn.prepareStatement(sql);
	  	pstmt.setInt(1, nowTodayPoint);
  		pstmt.setString(2, mid);
 	  	pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 아이디 찾기
	public MemberVO getNameCheck(String name, String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql ="select mid,name,nickName from member where name=? and nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, nickName);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println('통');
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
			}
			System.out.println("s: "+vo.getMid());
			System.out.println("s: "+vo.getName());
			
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	// 총 회원 수 구하기 (from/ MemberListCommand)
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 회원 전체 리스트 (from/ MemberListCommand)
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<>();
		try {
			sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
				
				// 관리자 창에서 탈퇴처리한 회원의 마지막 접속일 확인을 위해 사용
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	// 특정 회원의 총 레코드 건수 구하기 (from/ MemberMainCommand)
	// 1. 작성한 방명록 글 총 개수 구하기 (아이디, 닉네임이 같으면 본인이 쓴 글) (성명은 제외시켰다. 중복이 가능하기 때문!)
	public int getGuestList(String mid, String nickName) {
		int guestCnt = 0;
		try {
			sql = "select count(idx) as cnt from guest where name in(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, nickName);
			rs = pstmt.executeQuery();
			
			rs.next();
			guestCnt = rs.getInt("cnt");

		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return guestCnt;
	}

	
	// 2. 작성한 게시판 글 총 개수 구하기 (아이디가 같으면 본인이 쓴 글)
	public int getBoardList(String mid) {
		int boardCnt = 0;
		try {
			sql = "select count(idx) as cnt from board where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);

			rs = pstmt.executeQuery();
			
			rs.next();
			boardCnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류xx : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return boardCnt;
	}

	
	// 특정 회원의 방명록 전체 보기 (from/ MemberGuestListCommand)(성명은 중복이 될 수 있으니, 작성자 검색에 사용하지 않겠다.)
	public ArrayList<GuestVO> getMemberGuestList(int startIndexNo, int pageSize, String mid, String nickName) {
		ArrayList<GuestVO> vos = new ArrayList<>();
		try {
			sql = "select * from guest where name in(?, ?) order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, nickName);			
			pstmt.setInt(3, startIndexNo);
			pstmt.setInt(4, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestVO vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostip"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 준회원에서 정회원으로 등업하기 (from/ (unused) MemberLoginOkCommand : MemberMainCommand.java에서 처리하게 되어서 이건 사용하지 않음!)
	public void setLevelUpdate(String mid) {
		try {
      sql = "update member set level=2 where mid=?";
      pstmt = conn.prepareStatement(sql);
  		pstmt.setString(1, mid);
 	  	pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 등업처리 시켜주기(from/ MemberMainCommand.java)
	public void setLevelUpCheck(String mid, int level) {
		try {
			sql = "update member set level = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 비밀번호 변경
	public int setMemberPwdUpdateOk(String mid, String newPwd) {
		int res = 0;
		try {
			sql = "update member set pwd = ? where mid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res = 1;
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 회원 정보수정
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set nickName=?, name=?, gender=?, birthday=?,"
					+ "tel=?, address=?, email=?, homePage=?, job=?, hobby=?,"
					+ "photo=?, content=?, userInfor=?  where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getHomePage());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getUserInfor());
			pstmt.setString(14, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 회원 탈퇴
	public void setDeleteAskOk(String mid) {
		try {
			sql = "update member set userDel = 'OK' where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	
}
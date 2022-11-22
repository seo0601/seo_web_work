package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	
	private static UsersDao dao;
	//외부에서 객체를 생성할 수 없도록
	private UsersDao() {}
	//참조 값을 리턴해주는 static 메소드
	public static UsersDao getInstance() {
		if(dao == null) {
			dao = new UsersDao();
		}
		return dao;
	}
	
	//비밀번호를 수정하는 메소드
	public boolean updatePwd(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "UPDATE users "
					+ " SET pwd=?"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 것이 있으면 해주고
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			//INSERT OR UPDATE OR DELETE 문을 수행하고 수정,삭제,추가된 ROW의 개수를 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//인자로 전달된 아이디에 해당하는 가입 정보를 리턴해주는 메소드
	public UsersDto getData(String id) {
		UsersDto dto = null;
		//필요한 객체를 담을 지역 변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection pool에서 Connection 객체를 하나 얻어 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT pwd, email, profile, TO_CHAR(regdate, 'YYYY.MM.DD') AS regdate"
					+ " FROM users"
					+ " WHERE id=?";
			
			pstmt = conn.prepareStatement(sql);
			//sql 문의 ?에 바인딩 할 것이 있으면 한다.
			pstmt.setString(1, id);
			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	//인자로 전달되는 dto에 있는 아이디와 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		
		//아이디와 비밀번호 유효성 여부를 담을 변수를 만들고 초기값 false를 부여하기
		boolean isValid = false;
		
		//필요한 객체를 담을 지역 변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//Connection pool에서 Connection 객체를 하나 얻어 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT id"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";
			
			pstmt = conn.prepareStatement(sql);
			//sql 문의 ?에 바인딩 할 것이 있으면 한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//SELECT 된 ROW가 있는지 확인해 본다.
			if (rs.next()) {
				isValid =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	//회원 한 명의 정보를 DB에 저장하고 성공 여부를 리턴하는 메소드
	public boolean insert(UsersDto dto) {//UsersDto에 id, pwd, email이 있다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 것이 있으면 해주고
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			//INSERT OR UPDATE OR DELETE 문을 수행하고 수정,삭제,추가된 ROW의 개수를 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
}

package test.grade.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.grade.dto.GradeDto;
import test.util.DbcpBean;

public class GradeDao {

		private static GradeDao dao;
		//외부에서 객체를 생성할 수 없도록
		private GradeDao() {}
		//참조 값을 리턴해주는 static 메소드
		public static GradeDao getInstance() {
			if(dao == null) {
				dao = new GradeDao();
			}
			return dao;
		}
		
		
		
	   //전체 회원의 목록을 리턴하는 메소드
	   public List<GradeDto> getList(){
	      //회원 목록을 담을 객체 생성
	      List<GradeDto> list=new ArrayList<>();
	      
	      //필요한 객체를 담을 지역변수를 미리 만들어 둔다. 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection Pool 에서 Connection 객체를 하나 얻어온다.
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문의 뼈대 구성하기
	         String sql = "SELECT name, javascript, java, oracle"
	               + " FROM grade"
	               + " ORDER BY name ASC";
	         //sql 문의 ? 에 바인딩 할게 있으면 한다.

	         pstmt = conn.prepareStatement(sql);
	         //SELECT 문을 수행하고 결과값을 받아온다.
	         rs = pstmt.executeQuery();
	         //반복문 돌면서 ResultSet 에서 필요한 값을 얻어낸다.
	         while (rs.next()) {
	            //커서가 위치한곳에서 회원 한명의 정보를 얻어내서 MemberDto 객체에 담은후 
	            GradeDto dto=new  GradeDto();
	            dto.setName(rs.getString("name"));
	            dto.setJavascript(rs.getString("javascript"));
	            dto.setJava(rs.getString("java"));
	            dto.setOracle(rs.getString("oracle"));
	            //ArrayList 객체에 누적 시킨다.
	            list.add(dto);
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
	               conn.close(); //Connection Pool 에 Connection 반납하기
	         } catch (Exception e) {
	         }
	      }
	      
	      return list;
	   }
	
	    //성적 입력 메소드		
		public boolean insert(GradeDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
	
			try {
				conn = new DbcpBean().getConn();
				//수정할 미완성의 sql문
				String sql = "INSERT INTO grade"
							+ " (name, javascript, java, oracle)"
							+ " VALUES(?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				//?에 바인딩 할 것이 있으면 해주고
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getJavascript());
				pstmt.setString(3, dto.getJava());
				pstmt.setString(4, dto.getOracle());
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

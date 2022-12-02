package test.suggestion.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.suggestion.dto.SuggestionDto;
import test.suggestion.dto.SuggestionDto;
import test.util.DbcpBean;

public class SuggestionDao {
	public static SuggestionDao dao;
	/*
	 *  static 메소드는 생성자를 호출하지 않고 클래스 명으로 바로 호출을 하기 때문에
	 *  메소드 호출 전에 무언가 준비 작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 *  static 블럭은 해당 클래스를 최초로 사용할 때 한 번만 실행되서
	 *  초기화 잡업을 하기에 적당한 블럭이다.
	 */
	static {
		if(dao == null) {
			dao = new SuggestionDao();
		}
	}
	
	private SuggestionDao() {}
	
	public static SuggestionDao getInstance() {
		return dao;
	}
	
	//전체 글의 갯수를 리턴하는 메소드
	public int getCount() {
		int count = 0;
		//필요한 객체를 담을 지역 변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection pool에서 Connection 객체를 하나 얻어 온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS num FROM suggestion";
			//sql 문의 ?에 바인딩 할 것이 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if(rs.next()) {
				count = rs.getInt("num");
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
		return count;
	}
	
	//글의 조회수를 올리는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "UPDATE suggestion"
					+ " SET viewCount=viewCount+1"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 것이 있으면 해주고
			pstmt.setInt(1, num);
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
	
	//글을 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "DELETE FROM suggestion"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 것이 있으면 해주고
			pstmt.setInt(1, num);
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
	
	//글을 수정하는 메소드
	public boolean update(SuggestionDto dto) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;

	      int rowCount = 0;

	      try {
	         conn = new DbcpBean().getConn();
	         String sql = "UPDATE suggestion"
	               + " SET title=?, content=?"
	               + " WHERE num=?";

	         pstmt = conn.prepareStatement(sql);
	         // ?에 바인딩할게 있으면 해주고
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setString(2, dto.getContent());
	         pstmt.setInt(3, dto.getNum());

	         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW의 갯수 리턴 받기
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

   //글 하나의 정보를 리턴해주는 메소드
   public SuggestionDto getData(int num) {
      SuggestionDto dto=null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = new DbcpBean().getConn();
         //select 문의 뼈대 구성하기
         String sql = "SELECT writer, title, content, viewCount, regdate"
               + " FROM suggestion"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩 할게 있으면 하기
         pstmt.setInt(1, num);
         //sql 문 수행하고 ResultSet 객체 얻어내기
         rs = pstmt.executeQuery();
         if (rs.next()) {
            dto=new SuggestionDto();
            dto.setNum(num);
            dto.setWriter(rs.getString("writer"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setViewCount(rs.getInt("viewCount"));
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
	
	 //글의 목록을 리턴하는 메소드
	 public List<SuggestionDto> getList(SuggestionDto dto){
	      
	      List<SuggestionDto> list=new ArrayList<SuggestionDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT *"
	         		+ "FROM"
	         		+ "   (SELECT result1.*, ROWNUM AS rnum"
	         		+ "   FROM"
	         		+ "      (SELECT num,writer,title,viewCount, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') AS regdate"
	         		+ "      FROM suggestion"
	         		+ "      ORDER BY num DESC) result1)"
	         		+ "WHERE rnum BETWEEN ?  AND ?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         pstmt.setInt(1, dto.getStartRowNum());
	         pstmt.setInt(2, dto.getEndRowNum());
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            //select 된 row 하나의 정보를 suggestionDto 객체를 생성해서 담고 
	            SuggestionDto tmp=new SuggestionDto();
	            tmp.setNum(rs.getInt("num"));
	            tmp.setWriter(rs.getString("writer"));
	            tmp.setTitle(rs.getString("title"));
	            tmp.setViewCount(rs.getInt("viewCount"));
	            tmp.setRegdate(rs.getString("regdate"));
	            //suggestionDto 객체의 참조값을 List 에 누적 시키기
	            list.add(tmp);
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
	      return list;
	   }
	
	//새 글을 저장하는 메소드
	public boolean insert(SuggestionDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "INSERT INTO suggestion"
					+ " (num,writer,title, content, viewCount, regdate)"
					+ " VALUES(suggestion_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 것이 있으면 해주고
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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

package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	
	public static CafeDao dao;
	/*
	 *  static 메소드는 생성자를 호출하지 않고 클래스 명으로 바로 호출을 하기 때문에
	 *  메소드 호출 전에 무언가 준비 작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 *  static 블럭은 해당 클래스를 최초로 사용할 때 한 번만 실행되서
	 *  초기화 잡업을 하기에 적당한 블럭이다.
	 */
	static {
		if(dao == null) {
			dao = new CafeDao();
		}
	}
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		return dao;
	}

	   //글 하나의 정보를 리턴해주는 메소드
	   public CafeDto getData(int num) {
	      CafeDto dto=null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT writer, title, content, viewCount, regdate"
	               + " FROM board_cafe"
	               + " WHERE num=?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         pstmt.setInt(1, num);
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            dto=new CafeDto();
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
	 public List<CafeDto> getList(){
	      
	      List<CafeDto> list=new ArrayList<CafeDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT num, writer, title, viewCount, regdate"
	               + " FROM board_cafe"
	               + " ORDER BY num DESC";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기

	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            //select 된 row 하나의 정보를 CafeDto 객체를 생성해서 담고 
	            CafeDto dto=new CafeDto();
	            dto.setNum(rs.getInt("num"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setTitle(rs.getString("title"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setRegdate(rs.getString("regdate"));
	            //CafeDto 객체의 참조값을 List 에 누적 시키기
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
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return list;
	   }
	
	//새 글을 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "INSERT INTO board_cafe"
					+ " (num,writer,title, content, viewCount, regdate)"
					+ " VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
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

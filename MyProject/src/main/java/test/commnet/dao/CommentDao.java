package test.commnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.comment.dto.CommentDto;
import test.util.DbcpBean;

public class CommentDao {
	   //static 필드
	   private static CommentDao dao;
	   //외부에서 객체 생성하지 못하도록 생성자를 private 로
	   private CommentDao() {}
	   //자신의 참조값을 리턴해주는 메소드
	   public static CommentDao getInstance() {
	      if(dao==null) {
	         dao=new CommentDao();
	      }
	      return dao;
	   }
	   
	 //댓글 하나의 정보를 리턴해주는 메소드
	   public CommentDto getData(int comment_num) {
		   CommentDto dto=null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT comment_num, id, content, regdate"
	               + " FROM board_comment"
	               + " WHERE comment_num=?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         pstmt.setInt(1, comment_num);
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            dto=new CommentDto();
	            dto.setComment_num(rs.getInt("comment_num"));
	            dto.setId(rs.getString("id"));
	            dto.setContent(rs.getString("content"));
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
	   
	 //댓글 목록을 리턴하는 메소드
	 public List<CommentDto> getList(CommentDto dto){
	      
	      List<CommentDto> list=new ArrayList<CommentDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT * FROM board_comment";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            //select 된 row 하나의 정보를 TaskDto 객체를 생성해서 담고 
	        	CommentDto tmp=new CommentDto();
	            tmp.setComment_num(rs.getInt("comment_num"));
	            tmp.setId(rs.getString("id"));
	            tmp.setContent(rs.getString("content"));
	            tmp.setRegdate(rs.getString("regdate"));
	            //TaskDto 객체의 참조값을 List 에 누적 시키기
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
		 
	//댓글을 저장하는 메소드
	public boolean insert(CommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			conn = new DbcpBean().getConn();
			//수정할 미완성의 sql문
			String sql = "INSERT INTO board_comment"
					+ " (comment_num, id, content, regdate)"
					+ " VALUES(board_comment_seq.NEXTVAL, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 것이 있으면 해주고
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getContent());
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

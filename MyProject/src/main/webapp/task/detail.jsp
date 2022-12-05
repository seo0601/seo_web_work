<%@page import="java.util.List"%>
<%@page import="test.commnet.dao.CommentDao"%>
<%@page import="test.comment.dto.CommentDto"%>
<%@page import="test.task.dao.TaskDao"%>
<%@page import="test.task.dto.TaskDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자세히 보여줄 글의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//DB에서 해당 글의 정보를 얻어와서
	TaskDto dto = TaskDao.getInstance().getData(num);
	//댓긂 목록 불러오기
	CommentDto dto2 = new CommentDto();
	List<CommentDto> list = CommentDao.getInstance().getList(dto2);
	//글의 조회수 1 증가 시키기
	TaskDao.getInstance().addViewCount(num);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h3>글 상세 보기</h3>
		<table class="table table-striped">
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
				
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<%--
				textarea를 이용해서 문자열을 입력받으면 tab 기호, 공백, 개행 기호도 같이 입력받는다.
				해당 기호를 재현하는 방법은 세 가지가 있다.
				1. textarea에 출력하기
				2. <pre></pre> 요소 안에서 출력하기
				3. 개행 기호를 찾아서 <br />로 대체 하기
			 --%>
			<tr>
				<th>내용</th>
				<td rows="10" readonly rows="10" readonly><%=dto.getContent().replace("\r\n", "<br/>") %></td>
			</tr>
		</table>
		<%
         //로그인된 아이디가 있으면 읽어온다(null 일수도 있다)
         String id=(String)session.getAttribute("id");
      %>
      <%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
      <%if(dto.getWriter().equals(id)){ %>
         <a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
         <a href="javascript:" onclick="deleteConfirm()">삭제</a>
         <script>
            function deleteConfirm(){
               const isDelete=confirm("이 글을 삭제 하겠습니까?");
               if(isDelete){
                  location.href="private/delete.jsp?num=<%=dto.getNum()%>";
               }
            }
         </script>
      <%} %>      	
	</div>
	<div class="container">

		
	<div class="container">
		<div class="form-group">
			<form method="post" action="${pageContext.request.contextPath}/comment/insert.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<td style="border-bottom:none;" valign="middle"><br><br></td>
						<td><input type="text" name="id" id="id" placeholder="작성자"/></td>
						<td><input type="text" style="height:50px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "content"></td>
						<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<td align="left" bgcolor="beige">댓글</td>
					</tr>
					<tr>
					<%
						for(CommentDto tmp : list){
					%>
							<div class="container">	
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
											<tr>						
												<td align="left"><%= tmp.getComment_num() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=tmp.getId() %> <%=tmp.getContent() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=tmp.getRegdate() %></td>		
												<td colspan="2"></td>
												<td align="right">																						
													
												</td>
											</tr>
										
										</tbody>
									</table>			
								</div>
							</div>
							<%
								}
							%>
					</tr>
			</table>
		</div>
	</div>

	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
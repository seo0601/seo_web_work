<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//TodoDao 객체를 이용해서 할 일 목록을 얻어온다.
	TodoDao dao = TodoDao.getInstance();
	List<TodoDto> list = dao.getList();
%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%--/include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage"/>
	</jsp:include>
	
	<div class="container"  align="right">
	<h1 class="text-center"><small>할 일 목록</small></h1>
		<table class="table table-striped table-hover">
			<thead class="table table-dark">
				<tr>
					<th>번호</th>
					<th>할 일</th>
					<th>날짜</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- out.print(tmp.getNum());을 밑처럼 줄여서 가능, 밑에서는 ;을 안써도 됨 -->
				<%for(TodoDto tmp : list){%>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a class="btn btn-light btn-sm" href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
						<td><a class="btn btn-light btn-sm" href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
					</tr>
				<%}%>
			</tbody>
		</table>
		<hr />
		<a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/insertform.jsp">할 일 추가</a>
		<div class="container text-center">
			<ul class="pagination justify-content-center ">
			    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">Next</a></li>
	 		 </ul>	
		</div>
	</div>
</body>
</html>
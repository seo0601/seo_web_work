<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UsersDao dao = UsersDao.getInstance();
	List<UsersDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/grade/users_view.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>password</th>
					<th>email</th>
					<th>profile</th>
					<th>regdate</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>

				<%for(UsersDto tmp : list) {%>
					<tr>
						<td><%=tmp.getId() %></td>
						<td><%=tmp.getPwd() %></td>
						<td><%=tmp.getEmail() %></td>
						<td><%=tmp.getProfile() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="${pageContext.request.contextPath}/admin/delete.jsp?id=<%=tmp.getId() %>">삭제</a></td>
						
					</tr>
			<%}%>

			</tbody>
		</table>
	</div>
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
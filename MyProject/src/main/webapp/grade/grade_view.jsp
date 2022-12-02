<%@page import="test.grade.dto.GradeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.grade.dao.GradeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GradeDao dao = GradeDao.getInstance();
	List<GradeDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/grade/grade_view.jsp</title>
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
					<th>이름</th>
					<th>javascript</th>
					<th>java</th>
					<th>oracle</th>
				</tr>
			</thead>
			<tbody>

				<%for(GradeDto tmp : list) {%>
					<tr>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getJavascript() %></td>
						<td><%=tmp.getJava() %></td>
						<td><%=tmp.getOracle() %></td>
					</tr>
			<%}%>

			</tbody>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
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
</head>
<body>
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
</body>
</html>
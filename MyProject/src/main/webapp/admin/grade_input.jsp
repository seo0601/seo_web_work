<%@page import="test.grade.dao.GradeDao"%>
<%@page import="test.grade.dto.GradeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String javascript = request.getParameter("javascript");
	String java = request.getParameter("java");
	String oracle = request.getParameter("oracle");
	
	GradeDto dto = new GradeDto();
	dto.setName(name);
	dto.setJavascript(javascript);
	dto.setJava(java);
	dto.setOracle(oracle);
	
	GradeDao dao = GradeDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/grade/grade_input.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				<strong><%=name %></strong>님의 성적이 입력되었습니다.
				<a href="${pageContext.request.contextPath}/grade/grade_view.jsp">성적 보러가기</a>
			</p>
		<%}else{%>
			<p>
				성적 추가 실패
				<a href="grade_inputform.jsp">다시 입력하기</a>
			</p>
		<%}%>	 
	</div>
</body>
</html>
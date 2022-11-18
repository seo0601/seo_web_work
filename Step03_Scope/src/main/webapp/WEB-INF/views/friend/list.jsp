<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//"list"라는 키 값으로 request scope에 담겨 있는 List<String> type의 참조 값 얻어오기
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/WEB-INF/views/friend/list.jsp</title>
</head>
<body>
	<h1>친구 목록입니다.</h1>
	<ul>
	<%for(String tmp : list){%>
		<li><%=tmp%></li>
	<%} %>
	</ul>
</body>
</html>
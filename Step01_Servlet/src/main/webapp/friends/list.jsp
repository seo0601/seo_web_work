<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
		//친구 목록(sample data)이라고 가정
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");	
%>
<body>

		<ul>
<%		
		for(String tmp : names){
			out.println("<li>"+tmp+"</li>");
			}
%>				
		</ul>
		<ul>
			<%for(String tmp : names){%>
				<li><%=tmp %></li>
			<%} %>
		</ul>
</body>
</html>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//"dto"라는 키 값으로 담긴 MemberDto type의 참조 값 얻어오기
	UsersDto dto = (UsersDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<h1>회원 한 명의 정보입니다.</h1>
	<p>번호 : <strong><%=dto.getNum() %></strong></p>
	<p>이름 : <strong><%=dto.getName() %></strong></p>
	<p>주소 : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>
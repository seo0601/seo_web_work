<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 아이디, 비밀번호 읽어오기
	request.getParameter("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//2. DB에 실제로 존재하는 정보인지 확인하기(맞는 정보이면 로그인 처리도 한다.)
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	UsersDao dao = UsersDao.getInstance();
	boolean isValid = dao.isValid(dto);
	if(isValid){
		//session scope에 id라는 키 값으로 로그인된 아이디 담기
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60); 
	}

	//3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isValid) {%>
			<p>로그인되었습니다.</p>
			<a href="../index.jsp">인덱스 페이지로 가기</a>
		<%}else{%>
			<p>로그인에 실패했습니다.</p>
			<a href="loginform.jsp">로그인 화면으로 돌아가기</a>
		<%}%>
	</div>
</body>
</html>
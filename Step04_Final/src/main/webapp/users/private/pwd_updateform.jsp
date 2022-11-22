<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getParameter("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("email");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
</head>
<body>
	<div class="container">
		<form action="pwd_update.jsp" method="post">
			<div>
				<label class="form-label" for="id">아이디</label>
				<input type="text" class="form-control" name="id" id="id" value="<%=id%>"/>
			</div>
			<div>
				<label for="pwd" class="form-label">현재 비밀번호</label>
				<input type="text"  name="pwd" id="pwd" value="<%=pwd%>" readonly/>
			</div>
			<div>
				<label for="pwd" class="form-label">수정할 비밀번호</label>
				<input type="text"  name="pwd" id="pwd" />
			</div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>
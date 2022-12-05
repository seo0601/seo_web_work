<%@page import="test.commnet.dao.CommentDao"%>
<%@page import="test.comment.dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String content = request.getParameter("content");
	
	CommentDto dto = new CommentDto();
	dto.setId(id);
	dto.setContent(content);
	boolean isSuccess = CommentDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment/insert.jsp</title>
</head>
<body>
		<div class="container">
		<%if(isSuccess) {%>
			<p>
				저장되었습니다.
			</p>
		<%}else{%>
			<p>
				가입이 실패했습니다
			</p>
		<%}%>	 
	</div>
</body>
</html>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이러한 로직을 비즈니스 로직이라한다.
	//수정할 할 일의 번호와 할 일을 읽어오기
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	
	//TodoDto에 담고	
	TodoDto dto = new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	boolean isSuccess = TodoDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<script>
	<%if(isSuccess){%>	
		alert("수정 했습니다.");
		location.href="list.jsp"
	<%}else{%>		
		alert("수정 실패!");
		location.href="updateform.jsp?num=<%=num%>";
	<%} %>
	
	</script>
</body>
</html>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 회원의 번호를 읽어와서
	int num = Integer.parseInt(request.getParameter("num"));
	//해당 할 일의 정보를 DB에서 불러온 다음
	TodoDto dto = TodoDao.getInstance().getData(num);
	//수정할 수 있는 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<form action="update.jsp" method="post">
			<div>
				<label for="num">번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum() %>" readonly />
			</div>
			<div>
				<label for="content">할 일</label>
				<input type="text" id = "content" name="content" value="<%=dto.getContent()%>"/>
			</div>
			<div>
				<label for="regdate">날짜</label>
				<input type="text" id="regdate" name="regdate" value="<%=dto.getRegdate() %>" readonly />
			</div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>
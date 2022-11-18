<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 할 일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	//TodoDto에 담고
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	dto.setRegdate(regdate);
	//DB에 저장하고
	TodoDao dao = TodoDao.getInstance();
	boolean isSuccess = dao.insert(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%--작업의 성공 여부에 따라 다른 내용을 응답해 준다. --%>
		<%if(isSuccess){%>
			<p>
					<strong><%=content %></strong>를 성공적으로 추가했습니다.
					<a href="${pageContext.request.contextPath}/todo/list.jsp">확인</a>
			</p>
			<% }else{%>
				<p>
					할일 목록 추가 실패!
					<a href="${pageContext.request.contextPath}/todo/insertform.jsp">다시 입력하러 가기</a>
				</p>
			<%}%>
		}
	</div>
</body>
</html>
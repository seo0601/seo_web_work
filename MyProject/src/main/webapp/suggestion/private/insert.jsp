<%@page import="test.suggestion.dao.SuggestionDao"%>
<%@page import="test.suggestion.dto.SuggestionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//글 작성자는 로그인된 아이디
	String writer = (String)session.getAttribute("id");
	//폼 전송되는 내용을 추출해서
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//TaskDto에 담고
	SuggestionDto dto = new SuggestionDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);

	
	boolean isSuccess = SuggestionDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				<strong><%=title %></strong>이 저장되었습니다.
				<a href="${pageContext.request.contextPath}/suggestion/list.jsp">글 목록 보러가기</a>
			</p>
		<%}else{%>
			<p>
				가입이 실패했습니다
				<a href="insertform.jsp">글 다시 쓰기</a>
			</p>
		<%}%>	 
	</div>
</body>
</html>
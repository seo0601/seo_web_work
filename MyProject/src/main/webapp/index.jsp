<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 id라는 키값으로 저장된 값이 있는지 읽어오기(없으면 null)
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<div class="container">
		<h3>에이콘 아카데미 학생 관리</h3>
		<div>
			<%if(id != null) {%>
					<p>
						<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>님
						<br />					
						<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/users/logout.jsp'">로그아웃</button>
					</p>
			<%}else {%>
				<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/users/loginform.jsp'">로그인</button>
			<%} %>
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/grade/grade_view.jsp">성적 조회</a></li>
			<li><a href="${pageContext.request.contextPath}/task/list.jsp">과제 게시판</a></li>
			<li><a href="">건의 사항</a></li>
			<li><a href="">게시판</a></li>
			<!-- 관리자일때만 메뉴확인가능 -->
			<% if(id != null && id.equals("admin")){ %>
					<li><a href="${pageContext.request.contextPath}/admin/grade_inputform.jsp">성적 입력</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/grade_view.jsp">성적 조회</a></li>
				<%}%>

			
		</ul>
	</div>
</body>
</html>
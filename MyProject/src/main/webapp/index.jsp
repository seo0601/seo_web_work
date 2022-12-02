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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
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
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 id라는 키값으로 저장된 값이 있는지 읽어오기(없으면 null)
	String id = (String)session.getAttribute("id");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%--/include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<div>
			<%--
				1. sessionScope.id != null
				2. id != null
				3. id ne null
				4. not empty id
				
				el에서 1, 2, 3, 4는 모두 같은 결과다.
			 --%>
			<c:choose>
				<c:when test="${session.getAttribute.id != null }">
					<p>
						<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>님
						<br />					
						<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/users/logout.jsp'">로그아웃</button>
					</p>
				</c:when>
				<c:otherwise>
					<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/users/loginform.jsp'">로그인</button>
				</c:otherwise>
			</c:choose>
			
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
		<br />
		<a href="https://github.com/seo0601" target="_blank">
			<img width="300px" height="300px"  src="https://user-images.githubusercontent.com/76125650/139602266-044d30d7-1ad5-4b59-a0db-bf0777dd8b7a.png" />
		</a>
		<a href="https://getbootstrap.com/" target="_blank">
			<img width="300px" height="300px" src="https://getbootstrap.kr/docs/5.2/assets/brand/bootstrap-logo-shadow.png" />
		</a>
		<a href="https://acornedu.co.kr/index.jsp"  target="_blank">
			<img width="300px" height="300px" src="https://t1.daumcdn.net/cfile/blog/2701793C56B186792C" />
		</a>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
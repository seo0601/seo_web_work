<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	[ taglib ]
	
	url="import 할 라이브러리 종류"
	prefix="해당 라이브러리를 사용할 접두어 설정"
	
	만일 접두어를 prefix="gura"라고 설정한다면
	jsp 페이지에서 <gura:xxx> 형태의 tag를 사용할 수 있다.
	
	위의 설정에서는 prefix="c"라고 설정해서(core 라이브러리라는 의미에서 c)
	<c:xxx> 형태의 tag를 jsp 페이지 내에서 사용할 수 있다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/hello.jsp</title>
</head>
<body>
	<h1>JSTL의 core 라이브러리 사용해 보기</h1>
	<c:forEach var="i" begin="0" end="9" step="1">
		<p>안녕 JSTL <strong>${i}</strong></p>
	</c:forEach>
	<h1>JSTL을 사용하지 않고 java code로 위와 같은 동작을 하기</h1>
	<%for(int i=0; i<10; i++) {%>
		<p>안녕<strong><%=i %></strong></p>
	<%} %>
</body>
</html>
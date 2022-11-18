<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		전송 파라미터를 추출하면 숫자 모양을 띄고 있어도 문자열(String)으로 읽어 온다.
		읽어온 다음 숫자(정수)로 바꾸고 싶으면 Integer 클래스의 static 메소드 .parseInt() 메소드를 활용한다.
		
		전송 파라미터 : ?num=x&amount=x
	*/
	
	int num = Integer.parseInt(request.getParameter("num"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	//GET 방식 파라미터로 전달된 값을 가지고 무언가 구입하는 로직을 처리하고 응답하기.
	//아직은 처리할 것이 없어서 빈 칸
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title> <!-- 경로를 보기 편하라고 타이틀에 쓴 것이다. -->
</head>
<body>
	<p>
		<!-- 클라이언트에게 출력은 되지만 클라이언트(웹 브라우저)가 무시하는 주석 -->
		<strong><%=num %></strong>번 상품 <strong><%=amount %></strong>개를 주문했습니다.
		<%--
			jsp 페이지에서의 주석 : jsp 페이지가 무시하는 주석
			
			context path는 나중에 제거되거나 변경될 예정이기 때문에 java code 영역이나 jsp 페이지에
			실제로 코딩이 디어 있으면 안된다.
			
			그래서 메소드 혹은 아래의 EL을 활용해서 context path를 출력해야 한다.
		 --%>
		<a href="${pageContext.request.contextPath}/index.html ">인덱스로 돌아가기</a>
		<a href="/Step01_Servlet/index.html ">인덱스로 돌아가기2</a>

	</p>
</body>
</html>
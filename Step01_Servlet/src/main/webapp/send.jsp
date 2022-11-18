<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	//"msg"라는 파라미터 명으로 전달되는 문자열을 읽어와서 msg라는 지역 변수에 담기
	//해당 파라미터 명으로 전달되는 정보가 없으면 null이 리턴된다.
	String msg = request.getParameter("msg");
	System.out.println("msg:"+msg);
%>
	
	<p class ="text-success text-end"><strong>메세지 잘 받았어 클라이언트야!</strong></p>
	<p class ="text-info text-center"><em>메세지 잘 받았어 클라이언트야!</em></p>
	<p class ="font-italic text-secondary"><small>메세지 잘 받았어 클라이언트야!</small></p>
	<p class="text-primary text-center">메세지 잘 받았어 클라이언트야!</p>
	<p class="text-danger text-end">메세지 잘 받았어 클라이언트야!</p>
	
</body>
</html>
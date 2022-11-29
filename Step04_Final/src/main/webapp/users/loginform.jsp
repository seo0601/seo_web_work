<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽어 오기
	String url = request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url == null){
		//로그인 후에 인덱스 페이지로 갈 수 있도록 한다.
		String cPath = request.getContextPath();
		url = cPath+"/index.jsp";
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<div class="dropdown">
			<button class="btn btn-outline-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				접속
			</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			    <li><a class="dropdown-item" href="loginform.jsp">로그인</a></li>
			    <li><a class="dropdown-item" href="signup_form.jsp">회원가입</a></li>
	  		</ul>
		</div>
		<br />
		<h4>로그인</h4>
		<form action="login.jsp" method="post">
				<!-- 로그인 성공 후 어디로 갈 지에 대한 정보를 url이라는 파라미터명으로 같이 전송되도록 한다. -->
				<input type="hidden" name="url" value="<%=url%>"/>
			<div>
				<label class="form-label" for="id">아이디</label>
				<input type="text" class="form-control" style="width:300px" name="id" id="id"/>
			</div>
			<div id="loginHelp" class="form-text">아이디는 영어로만 입력하세요</div>
			<div>
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="text" class="form-control" style="width:300px" name="pwd" id="pwd" />
			</div>
			<br />
			<button class="btn btn-outline-primary" type="submit">로그인</button>
		</form>
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
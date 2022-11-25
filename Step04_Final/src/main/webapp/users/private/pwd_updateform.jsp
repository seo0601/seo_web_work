<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>비밀번호 수정 폼</h2>
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div class="mb-3">
				<label for="pwd" class="form-label" >기존 비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<div class="mb-3">
				<label for="newPwd" class="form-label">새 비밀번호</label>
				<input class="form-control" type="password" name="newPwd" id="newPwd" />
			</div>
			<div class="mb-3">
				<label for="newPwd2" class="form-label">새 비밀번호 확인</label>
				<input class="form-control" type="password" id="newPwd2" />
			</div>
			<button type="submit" class="btn btn-outline-primary">수정하기</button>
			<button type="reset" class="btn btn-outline-primary">리셋</button>
		</form>
	</div>
	
	<script>
		//폼에 submit 이벤트가 일어났을 때 실행할 함수가 등록하고
		document.querySelector("#myForm").addEventListener("submit", function(event){
			let pwd1 = document.querySelector("#newPwd").value;
			let pwd2 = document.querySelector("#newPwd2").value;
			//새 비민번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1 != pwd2){
				alert("비밀번호를 확인 하세요!")
				//폼 제출 막기
				event.preventDefault();
			}
		});
	</script>
</body>
</html>
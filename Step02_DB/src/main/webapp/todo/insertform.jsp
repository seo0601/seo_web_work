<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>할 일 추가하기</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="content">할 일</label>
				<input type="text" name="content" id= "content" />
			</div>
			<button type="submit" class="btn btn-outline-info">추가</button>
		</form>
	</div>
</body>
</html>
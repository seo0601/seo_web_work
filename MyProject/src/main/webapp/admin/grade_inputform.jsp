<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/grade/grade_inputform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<form action="grade_input.jsp" method="post" id="gradeInputForm">
			<div>
				<label class="control-label" for="name">이름</label>
				<input class="form-control"  type="text" name="name" id="name" />
			</div>
			<div>
				<label class="control-label" for="javascript">Java Script</label>
				<input class="form-control"  type="text" name="javascript" id="javascript" />
			</div>
			<div>
				<label class="control-label" for="java">Java</label>
				<input class="form-control"type="text" name="java" id="java" />
			</div>
			<div>
				<label class="control-label" for="oracle">Oracle</label>
				<input class="form-control" type="text" name="oracle" id="oracle" />
			</div>
			<br />
			<button class="btn btn-default type="submit">입력</button>
			<button class="btn btn-default type="reset">리셋</button>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
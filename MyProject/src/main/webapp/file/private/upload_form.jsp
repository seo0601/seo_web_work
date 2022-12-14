<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h3>과제 제출</h3>
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file" />
			- enctype="multipart/form-data"가 설정된 폼을 전송하면
			  폰 전송된 내용을 추출할 때 HttpServletRequest 객체로 추출을 할 수 없다.
			  MultipartRequerst 객체를 이용해서 추출해야 한다. 
		 -->
		 <form action="upload.jsp" method="post" enctype="multipart/form-data">
		 	<div>
		 		<label for="title" class="form-label">제목</label>
		 		<input type="text" name="title" style="width:300px" id="title" class="form-control" />
		 	</div>
		 	<div>
		 		<label for="myFile">첨부 파일</label>
		 		<input type="file" name="myFile" id="myFile" />
		 	</div>
		 	<button class="btn btn-outline-primary" type="submit">업로드</button>
		 </form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
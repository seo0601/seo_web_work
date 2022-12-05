<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/location.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
#conatainer{
    height: 100px;
    width: 100px;
    background: red;
    margin:10px;
    text-align: center;
    display:table-cell;
    vertical-align:middle;
}
</style>
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="container">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1119.134563494659!2d127.0314937337881!3d37.49870575504364!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca157ac1001eb%3A0x1232b973d5aac612!2z7ISc7Jq47Yq567OE7IucIOqwleuCqOq1rCDsl63sgrzrj5kg7YWM7Zek656A66GcIDEyNA!5e0!3m2!1sko!2skr!4v1571019630515!5m2!1sko!2skr"  width ="500px" height="369px"  align="left" frameborder="0" style="border:0" ></iframe>
	</div>	
	<div class="container">
		<img  align="right" src="https://acornedu.co.kr/images/test/map_gangnam4.png" />
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
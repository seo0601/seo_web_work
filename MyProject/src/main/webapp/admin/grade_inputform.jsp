<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/grade/grade_inputform.jsp</title>
</head>
<body>
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
			<button type="submit">입력</button>
			<button type="reset">리셋</button>
	</div>
</body>
</html>
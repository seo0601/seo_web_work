<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바꿔준다.
	int num = Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용해서 삭제하고 성공 여부를 리턴받는다.
	UsersDao dao = UsersDao.getInstance();
	boolean isSuccess = dao.delete(num);
	//2. 응답하기(무슨 응답을 하면 적절할까?)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
	<div class="container">
			<p>
					<string><%=num %>번 회원 정보 삭제를 성공!</string>
				<a href="${pageContext.request.contextPath}/member/list.jsp">확인</a>
			</p>
	</div>
</body>
</html>
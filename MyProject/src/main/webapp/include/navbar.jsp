<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//navbar.jsp 페이지가 어디에 include 되었는지 읽어오기
	String thisPage = request.getParameter("thisPage");
	String id = (String)session.getAttribute("id");
%>
<nav class="navbar navbar-expand-lg  navbar-light" style="background-color: white;"">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<img src="https://acornedu.co.kr/images/n_logo.png" alt="" width="100" height="70" class="d-inline-block align-text-top"/>
		</a>	
		 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
         </button>
         <!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div 안에 넣어두면 된다. -->
         <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("sign_form") ? "active" : "" %>" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
               </li>
               <%if(id != null) {%>
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("grade") ? "active" : "" %>" href="${pageContext.request.contextPath}/grade/grade_view.jsp">성적 확인</a>
               </li>
               <%} %>
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("task") ? "active" : "" %>" href="${pageContext.request.contextPath}/task/list.jsp">게시판</a>
               </li>
			   	
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("file_list") ? "active" : "" %>" href="${pageContext.request.contextPath}/file/list.jsp">과제 목록</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("cafe_list") ? "active" : "" %>" href="${pageContext.request.contextPath}/file/private/upload_form.jsp">과제 제출</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("suggestion") ? "active" : "" %>" href="${pageContext.request.contextPath }/suggestion/list.jsp">건의 사항</a>
               </li>
               <!-- 관리자일때만 메뉴확인가능 -->
			<% if(id != null && id.equals("admin")){ %>
					<li class="nav-item">
						<a class="nav-link <%= thisPage.equals("grade") ? "active" : "" %>" href="${pageContext.request.contextPath}/admin/grade_inputform.jsp">성적 입력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link <%= thisPage.equals("grade_view") ? "active" : "" %>" href="${pageContext.request.contextPath}/admin/users_view.jsp">회원 목록</a>
					</li>
				<%}%>
            </ul>
         </div>	
	</div>
</nav>
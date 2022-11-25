<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//navbar.jsp 페이지가 어디에 include 되었는지 읽어오기
	String thisPage = request.getParameter("thisPage");
	String id = (String)session.getAttribute("id");
%>
<nav class="navbar navbar-expand-md navbar-dark" style="background-color:black;">
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
                  <a class="nav-link <%= thisPage.equals("study") ? "active" : "" %>" href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a>
               </li>
               
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("game") ? "active" : "" %>" href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a>
               </li>
               <%} %>

               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("file_list") ? "active" : "" %>" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("cafe_list") ? "active" : "" %>" href="${pageContext.request.contextPath }/cafe/list.jsp">글목록보기</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link <%= thisPage.equals("upload") ? "active" : "" %>" href="${pageContext.request.contextPath }/file/private/upload_form.jsp">업로드</a>
               </li>
            </ul>
         </div>	
	</div>
</nav>
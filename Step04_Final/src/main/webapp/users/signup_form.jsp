<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
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
			<ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="loginform.jsp">로그인</a></li>
			    <li><a class="dropdown-item" href="signup_form.jsp">회원가입</a></li>
	  		</ul>
		</div>
		<br />
		<h4>회원 가입 폼입니다.</h4>
		<form action="signup.jsp" method="post" id="signupForm">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" style="width:300px" type="text" name="id" id="id" />
				<div class="vaild-feedbck">사용 가능한 아이디입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" style="width:300px" type="password" name="pwd" id="pwd" />	
				<div class="invalid-feedback">비밀 번호를 확인하세요</div>			
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호 확인</label>
				<input class="form-control" style="width:300px" type="password" name="pwd2" id="pwd2" />				
			</div>
			<div>
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" style="width:300px" type="text" name="email" id="email" />
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요</div>		
			</div>
			<br />
			<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
   <script>
   		//유효성 여부를 저장할 변수를 만들고 초기값 대입
   		let isIdValid = false;
   		let isPwdValid = false;
   		let isEmailValid = false;
   
      	// id 를 입력할 때 마다 호출되는 함수 등록 
      	document.querySelector("#id").addEventListener("input", function(){
	    	 //input 요소의 참조 값을 self에 미리 담아 놓기
	    	 //this는 document.querySelector("#id");와 같다.	 
	    	 const self=this;
	    	 //일단 2개의 클래스를 모두 제거 한 다음
	    	 self.classList.remove("is-vaild");
	    	 self.classList.remove("is-invalid");
	         //1. 입력한 아이디를 읽어와서
	         const inputId=self.value;
	         //2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
	         fetch("checkid.jsp?inputId="+inputId)
	         .then(function(response){
	            return response.json();
	         })
	         .then(function(data){
	            //3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
	            console.log(data);
	            if(data.isExist){
	                self.classList.add("is-invalid");
	                isIdValid = false;
	            }else{
	               self.classList.add("is-valid");
	               isIdValid = true;
	            }
	         });
	      });
      
     	//함수에 등록해서 사용하기
      	function checkPwd(){    		
	    	 //먼저 2개의 클래스를 제거하고
	     	 document.querySelector("#pwd").classList.remove("is-valid");
	     	 document.querySelector("#pwd").classList.remove("is-invalid");
	     	 //입력한 두 개의 비밀 번호를 읽어와서
	     	 const pwd = document.querySelector("#pwd").value;
	     	 const pwd2 = document.querySelector("#pwd2").value;
	     	 
	     	 //만일 비밀번호 입력란과 확인란이 다르다면
	     	 if(pwd != pwd2){
	     		document.querySelector("#pwd").classList.add("is-invalid");
	     		isPwdValid = false;
	     	 }else{//같다면
	     		document.querySelector("#pwd").classList.add("is-valid");
	     		isPwdValid = true;
	     	 }
	      }
	      
	      // pwd를 입력할 때마다 호출되는 함수 등록
	      document.querySelector("#pwd").addEventListener("input", function(){
	    	 checkPwd();
	      });
	      
	      document.querySelector("#pwd2").addEventListener("input", function(){
	    	  checkPwd();
	      });
		      
      	//이메일을 입력했을때 검증하기
      	document.querySelector("#email").addEventListener("input", function(){
	          
	          this.classList.remove("is-valid");
	          this.classList.remove("is-invalid");
	          //입력한 이메일
	          const inputEmail=this.value;
	          //이메일을 검증할 정규 표현식  
	          const reg=/@/;
	          //만일 입력하 이메일이 정규 표현식 검증을 통과하지 못했다면
	          if(!reg.test(inputEmail)){
	             this.classList.add("is-invalid");
	             isEmailValid = false;
	          }else{//통과했다면
	             this.classList.add("is-valid");
	          	 isEmailValid = true;
	          }
	       });
	      //폼에 submit 이벤트가 일어났을 때 실행할 함수 등록
	      document.querySelector("#signupForm").addEventListener("submit", function(){
	    	  
	    	  //아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증 결과를 고려해서 조건부로 실행되도록 해야 한다.
	    	  const isFormValid = isIdValid && isPwdValid && isEmailValid;
	    	  //만일 폼이 유효하지 않으면
	    	  if(!isFormValid){
	    		  event.preventDefault(); //폼 전송 막기
	    	  }
	      });
      
   </script>

	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<body id="">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	    	<!-- sidebar -->
	    	<%-- <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import> --%>
	    	
	    	<div id="content-wrapper" class="d-flex flex-column">
	    		<div id="content">
	    		
	    		<%-- <c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import> --%>
	    		
		    		<div class="container-fluid">
		    				<!-- Content -->

						    <div class="container-xxl">
						      <div class="authentication-wrapper authentication-basic container-p-y">
						        <div class="authentication-inner">
						          <!-- Register -->
						          <div class="card" style="width: 800px; align-items: center; margin: auto; margin-top: 60px;">
						            <div class="card-body">
						              <!-- Logo -->
						              <div class="app-brand justify-content-center">
						                <a href="#" class="app-brand-link gap-2">
						                  <img alt="" src="/resources/images/jisun3.png" style="width: 40px;" height="40px;">
						                  <span class="app-brand-text demo text-body fw-bolder">Animal Hospital</span>
						                </a>
						              </div>
						              <!-- /Logo -->
						              <h4 class="mb-2">Welcome to Animal Hospital! 👋</h4>
						              <p class="mb-4">Please sign-in to your account and start the adventure</p>
										<div>
										
											<form:form modelAttribute="empVO" action="/emp/login" method="POST">
											  <div class="form-group">
											  	<form:label path="username">사원번호</form:label>
												<form:input  id="username" path="username" value="2023000" cssClass="form-control"/>					
											 
											  </div>
											  <div class="form-group">
											  	<form:label path="password">비밀번호</form:label>
											    <form:password id="password" path="password" value="123456" cssClass="form-control"/>
											  
											  </div>
											  <button type="submit" class="btn btn-primary" style="margin-top: 30px;">로그인</button>

							        		</form:form>	
							        		
										</div>
										<br>
									 <p class="text-center">
										<a href="/emp/findUser">비밀번호 찾기</a>								
						              </p>
						              
						            </div>
						          </div>
						          <!-- /Register -->
						        </div>
						      </div>
						    </div>
						
						    <!-- / Content -->
		    		</div>   		
	    		
	    		</div>	    		
	    		<%-- <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import> --%>
	    	</div>
	    </div> 
	    
	<script type="text/javascript">
	
	$('#searchBtn').on("click", function(){
		let empName = $("#empName").val();
		let email = $("#email").val();
		
		let data = {empName:empName, email:email};
		
		if(empName == ""){
	        alert("이름은 필수입력사항입니다.");
	        empName.focus();
	        return;
	    }
	    if(email == ""){
	        alert("이메일은 필수입력사항입니다.");
	        email.focus();
	        return;
	    }
	    
	    $.ajax({
			url:"/emp/login/findUsername",
			method:"post",	
            data: data,
            dataType : "text",
			success : function(text){
				if(text != null){
					$(#searchUser).html("사원번호는 "+ text +"입니다.")
				}else{
					$(#searchUser).html("일치하는 정보가 없습니다.")
				}
				console.log(data);
				
			},
			error : function(xhr){
				alert("에러코드 = " + xhr.status);
			}
		});
	 
		
	});
	</script>
	     
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<body id="page-top">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	    	<div id="content-wrapper" class="d-flex flex-column">
	    		<div id="content">	    		
		    		<div class="container-fluid" style="margin-top: 50px;">
						<sec:authentication property="Principal" var="user"/>
						    <div class="container-xxl">
						      <div class="authentication-wrapper authentication-basic container-p-y">
						        <div class="authentication-inner">
						          <!-- Register -->
						          <div class="card" style="width: 800px; align-items: center; margin: auto; margin-top: 10px;">
						            <div class="card-body">
						              <!-- Logo -->
						              <div class="app-brand justify-content-center">
						                <a href="#" class="app-brand-link gap-2">
						                  <img alt="" src="/resources/images/jisun3.png" style="width: 40px;" height="40px;">
						                  <span class="app-brand-text demo text-body fw-bolder">Animal Hospital</span>
						                </a>
						              </div>
						              
						              <!-- /Logo -->
						              <h4 class="mb-2" style="">비밀번호를 변경해주세요.</h4>
						              <p class="mb-4">Please change your password!</p>
										<div>
										<%-- <form id="pwUpdateForm" action="pwUpdate" method="post" onsubmit="return validateForm()"> --%>
										
										<form id="pwUpdateForm" action="pwUpdate" method="post" onsubmit="return validateForm()">
										<%-- <form:form modelAttribute="pwVO" action="/emp/pwUpdate" method="POST"> --%>
											<input type="hidden" name="username" value="${vo.username}">
											<input type="hidden" name="randomPw" value="${vo.randomPw}">

												<label>새 비밀번호 등록</label>
													 <input type="password" class="form-control" id="password" name="password" required>
													 <div id="passwordError" style="font-size: 12px; color:red;"></div>
													 <div id="passwordSuccess"style="float: right;"></div>
													 <%-- <form:errors path="password" cssStyle="color: red; font-size: 12px;"/> --%>
													 <br>
												<label>새 비밀번호 확인</label>
													 <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" required>
													 <%-- <form:errors path="passwordCheck" cssStyle="color: red; font-size: 12px;"/> --%>
													<div id="passwordCheckError" style="font-size: 12px; color:red;"></div>
													<div id="passwordCheckSuccess" style="float: right;"></div>
											  <br><br>			  			  				  				          													  	  				  			  				  				          		
											  <button type="submit" class="btn btn-primary" id="updateBtn" style="margin-top: 30px;">완료</button>
							        		</form>
							        		<%-- </form:form>  --%>
																	
											<%-- <form:form modelAttribute="pwVO" action="/emp/pwUpdate" method="POST">
											    <form:label path="password">새 비밀번호 등록</form:label>
											    <form:password path="password" cssClass="form-control"/>
											    <form:errors path="password" cssStyle="color: red; font-size: 12px;"/>
											
											    <br>
											
											    <form:label path="passwordCheck">새 비밀번호 확인</form:label>
											    <form:password path="passwordCheck" cssClass="form-control"/>
											    <form:errors path="passwordCheck" cssStyle="color: red; font-size: 12px;"/>
											
											    <br>
											
											    <button type="submit" class="btn btn-primary" style="margin-top: 10px;">완료</button>
											</form:form> --%>						
																													
										</div>
						
						            </div>
						          </div>
						          <!-- /Register -->
						        </div>
						      </div>
						    </div>
						
						    <!-- / Content -->
		    		</div>   		
	    		
	    		</div>	    		

	    	</div>
	    </div>  
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

<script type="text/javascript">
    $(document).ready(function () {
        $('#pwUpdateForm').on('submit', function (event) {
            if (!validateForm()) {
                event.preventDefault();
            }
        });

        $('#password, #passwordCheck').on('keyup', function () {
            validatePassword();
        });

        function validateForm() {
            const password = $("#password").val();
            const passwordCheck = $("#passwordCheck").val();

            if (password !== passwordCheck) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            } else {
                alert("비밀번호가 정상적으로 변경되었습니다.");
                return true;
            }
        }

        function validatePassword() {
            const reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
            const password = $("#password").val();
            const passwordCheck = $("#passwordCheck").val();
            
            if (!reg.test(password)) {
                $('#passwordError').text('비밀번호는 영어소문자+숫자 포함 8자리 이상입니다.');
            } else if (password === passwordCheck && reg.test(password)) {
                $('#passwordError').html('<img src="/resources/images/accept.png" style="width: 20px; height: 20px; float: right;">');
            } else {
            	$('#passwordError').text('');
            }
            
            if (!reg.test(passwordCheck)) {
                $('#passwordCheckError').text('비밀번호는 영어소문자+숫자 포함 8자리 이상입니다.');
            } else if (password === passwordCheck && reg.test(password)) {
                $('#passwordCheckError').html('<img src="/resources/images/accept.png" style="width: 20px; height: 20px; float: right;">');
            } else {
            	$('#passwordCheckError').text('');
            }
        }                   
    });
</script>

</body>
</html>
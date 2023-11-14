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
						              <h4 class="mb-2">비밀번호를 변경해주세요.🔐</h4>
						              <p class="mb-4">Please change your password!</p>
										<div>
											<form id="pwUpdateForm" action="pwUpdate" method="post" onsubmit="return validateForm()">
										<%-- <form:form modelAttribute="pwVO" action="/emp/pwUpdate" method="POST"> --%>
											<input type="hidden" name="username" value="${vo.username}">
											<input type="hidden" name="randomPw" value="${vo.randomPw}">

												<label>새 비밀번호 등록</label>
													 <input type="password" class="form-control" id="password" name="password">
													 <div id="passwordError" style="font-size: 12px; color:red;"></div>
													 <%-- <form:errors path="password" cssStyle="color: red; font-size: 12px;"/> --%>
													 <br>
												<label>새 비밀번호 확인</label>
													 <input type="password" class="form-control" id="passwordCheck" name="passwordCheck">
													 <%-- <form:errors path="passwordCheck" cssStyle="color: red; font-size: 12px;"/> --%>
													<div id="passwordError" style="font-size: 12px; color:red;"></div>
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
	    $('#password, #passwordCheck').on('keyup', function () {
	        validateForm();
	    });

	    $('#updateBtn').on('submit', function (event) {
	        if (!confirm('수정하시겠습니까?')) {
	            event.preventDefault();
	        }
	    });

	    function validateForm() {
	        const reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	        let password = $('#password').val();
	        let passwordCheck = $('#passwordCheck').val();

	        if (password == '') {
	            $('#passwordError').text('변경 할 비밀번호를 입력해주세요.');
	        } else {
	            $('#passwordError').text('');
	        }

	        if (passwordCheck == '') {
	            $('#passwordCheckError').text('비밀번호 확인란를 입력해주세요.');
	        } else {
	            $('#passwordCheckError').text('');
	        }

	        if (password != passwordCheck) {
	            $('#passwordCheckError').text('비밀번호가 일치하지 않습니다.');
	        } else {
	            $('#passwordCheckError').text('');
	        }

	        if (!reg.test(password)) {
	            $('#passwordError').text('비밀번호는 영어소문자+숫자 포함 8자리 이상입니다.');
	        } else {
	            $('#passwordError').text('');
	        }
	    }
	});
	</script>
	<!-- <script type="text/javascript">
    function validateForm() {
        const reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; /* 최소 8 자, 최소 하나의 문자 + 하나의 숫자 (특수문자X) */
        let password = $("#password").val();
        let passwordCheck = $("#passwordCheck").val();

        if (password == "") {
            alert("변경 할 비밀번호를 입력해주세요.");
            $("#password").focus();
            return false;
        }
        if (passwordCheck == "") {
            alert("비밀번호 확인란를 입력해주세요.");
            $("#passwordCheck").focus();
            return false;
        }
        if (password !== passwordCheck) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        if (!reg.test(password)) {
            alert("비밀번호는 영어소문자+숫자 포함 8자리 이상입니다.");
            return false;
        } else {
            alert("비밀번호가 정상적으로 입력되었습니다.");
            return true;
        }
   	 }

	    $('#updateBtn').on("click", function () {
	        // confirm 대화상자에서 '확인'을 누르면 true, '취소'를 누르면 false를 반환
	        if (!confirm("수정하시겠습니까?")) {
	            event.preventDefault();
	        }
	    });
	</script> -->

</body>
</html>
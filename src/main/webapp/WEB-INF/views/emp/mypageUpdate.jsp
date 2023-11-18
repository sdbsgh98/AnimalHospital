<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				
			<sec:authentication property="Principal" var="user"/>
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
					<div class="card shadow mb-4" style="align-items: center;">
			
						<div style="width:75%; margin-bottom: 30px;">
							<form action="mypageUpdate" method="post" enctype="multipart/form-data">
								<div style="width: 300px; float: left;">
									<c:if test="${vo.originalFileName == null }">
										<img alt="" src="/resources/images/default.jpeg" class="rounded-circle" style="width: 230px; height: 230px; margin: 30px;">
									</c:if>
									<c:if test="${vo.originalFileName != null }">		
										<img alt="" src="../files/emp/${vo.fileName}" class="rounded-circle" style="width: 230px; height: 230px; margin: 30px;">
									</c:if>
									<input type="file" class="form-control" name="files">
								</div>
							<div style="width: 70%; margin-top: 20px; margin-bottom: 20px; margin-left:10px; float: left;">
								<input type="hidden" name="username" value="${vo.username}">
								<input type="hidden" name="empName" value="${vo.empName}">
								<input type="hidden" name="deptName" value="${vo.deptName}">
								<input type="hidden" name="positionName" value="${vo.positionName}">
								<input type="hidden" name="hireDate" value="${vo.hireDate}">
								<input type="hidden" name="birth" value="${vo.birth}">
								<input type="hidden" name="fileName" value="${vo.fileName}">
								<input type="hidden" name="originalFileName" value="${vo.originalFileName}">
								
								<table class="table" style="margin-top: 40px; margin-left: 10px;">
									<tr>
										<td>사번</td>
										<td>${vo.username}</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${vo.empName}</td>
									</tr>
									<tr>
										<td>부서</td>
										<td>${vo.deptName}</td>
									</tr>
									<tr>
										<td>직급</td>
										<td>${vo.positionName}</td>
									</tr>

								</table>							
							</div>
							<br><br>
							<div>
								<table class="table" style="margin-top: 20px;">
									<tr>
										<td>입사일</td>
										<td>${vo.hireDate}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>
											<div class="form-group">
												<input type="email" class="form-control"  name="email" id="email" value="${vo.email}" required="required"/>
												<div id="emailError" style="font-size: 12px; color:red;"></div>
												<!-- <input type="button" class="form-control" id="emailCheck" value="이메일 중복확인" style="background-color: rgb(255,239,222); margin-top: 5px;" onclick='btnActive()'> -->
												<!-- <a class="btn form-control" id="sendBtn" style="background-color: rgb(255,239,222); margin-top: 10px; margin-bottom: 10px; display: none;" onclick="btn_mail(1)">인증번호 전송</a>
												<div id="mailDiv" name="mail_number">
										            <input type="text" class="form-control" name="number" id="number" style="margin-top: 10px;width: 73%;float: left; display: none;" placeholder="인증번호 입력">
										            <button type="button" class="form-control" style="width: 25%; background-color: rgb(255,239,222); margin-top: 10px; float: right; display: none;" name="confirmBtn" id="confirmBtn" >확인</button> -->
									        </div>
										
										</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>
											<div class="form-group">
												<input type="text" class="form-control"  name="phone" id="phone" value="${vo.phone}" required="required"/>
												<div id="phoneError" style="font-size: 12px; color:red;"></div>
											</div>
										</td>
									</tr>
								
									<tr>
										<td>생년월일</td>
										<td>${vo.birth}</td>
									</tr>

								</table>
							</div>
							<br>
								<button class="btn btn-primary" id="updateBtn" style="float: right;">수정완료</button>
								</form>
						</div>
					</div>
					<!-- <button type="submit" class="btn btn-danger" id="btn_update">수정완료</button> -->
					<!-- / Content -->
					</div>
				</div>
				
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
<script type="text/javascript">
/* $('#emailCheck').on("click", function () {
	let target = document.getElementById('updateBtn');
	let emailbtn = document.getElementById('emailCheck');
	let email = $("#email").val();
	
	document.getElementById("sendBtn").style.display = "";
	
    if (target.disabled == false) {
        $("#emailCheckError").text('이메일 중복확인을 해주세요.');
    } else {
        $("#emailCheckError").text('');
    } */
	
/*     $.ajax({
        url: "/emp/findEmail",
        type: "POST",
        data: {email: email},
        success: function (data) {
            if (data === "success") {	        	    
                alert("사용할 수 없는 이메일입니다.");
                target.disabled = true;
                email.focus();
				return;
            } else {
                alert("사용가능한 이메일입니다.");
                target.disabled = false;
                $("#email").prop("readonly", true);
                emailbtn.style.display = "none";
            }
        },
        error: function () {
        	alert("오류발생");
        }
    }); */
});
</script>
<!-- 	<script type="text/javascript">
 
	$('#sendBtn').on("click", function(){	
		document.getElementById("number").style.display = "";
		document.getElementById("confirmBtn").style.display = "";
		document.getElementById("sendBtn").style.display = "none";

	    let email = $("#email").val();
        
	    $.ajax({
	        url: "/emp/sendMail", 
	        type: "POST",
	        data: { email: $("#email").val() },  
	        success: function () {
	            alert("인증메일 발송완료"); 
	        },
	        error: function () {
	            console.log("문제있음"); 
	        }
	    });  
	  
	    
	});
		
	</script> -->

<!-- 	<script type="text/javascript">
    $('#confirmBtn').on("click", function () {
        let code = $("#number").val();
		let username = $("#username").val();
        
        if (!code || isNaN(code)) {
          alert("인증번호를 입력헤주세요.");
          $("#number").focus();
          return;
        }

        $.ajax({
          url: "/code",
          type: "POST",
          data: { code: code },
          success: function (data) {
            if (data === "success") {
              alert("인증이 완료되었습니다.");
            } else {

              alert("인증에 실패하셨습니다.");
            }
          },
          error: function () {
        	  alert("관리자에게 문의해주세요.");
          }
        });
      });


	</script> -->

<script type="text/javascript">

$(document).ready(function () {
	
	$('#email').on("keyup", function () {
		let target = document.getElementById('updateBtn');
	    let email = $("#email").val();
		let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
        if (email == "") {
            $("#emailError").text('이메일을 입력해주세요.');
            return;
        } else if (!emailRegex.test(email)) {
            $("#emailError").text('이메일 형식이 올바르지 않습니다.');
            email.focus();
            return;
        } else {
            $("#emailError").text('');
        }

	});
	
	$('#phone').on("keyup", function () {   
		let phone = $("#phone").val();
		
        if (phone == "") {
            $("#phoneError").text('연락처를 입력해주세요.');
            return;
        }else {
            $("#phoneError").text('');
        }
	});
});

</script>

</body>
</html>
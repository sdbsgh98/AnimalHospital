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

												<input type="email" class="form-control"  name="email" id="email" value="${vo.email}"/>

											</div>
										</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>
											<div class="form-group">

												<input type="text" class="form-control"  name="phone" id="phone" value="${vo.phone}"/>

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
								<button class="btn btn-primary" style="float: right;">수정완료</button>
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

/* let index = {
		init: function(){
			$("#btn_update").on("click",()=>{
				this.update();
			});
		},
		
		update: function(){
			let data = {
					email: $("#email").val(),
					phone: $("#phone").val()
			};
			
			$.ajax({
				//회원정보 수정 요청
				type: "PUT",
				url: "/emp/mypage/mypageUpdate",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType:"json"
				//응답 정상일 때 
			}).done(function(resp){
				alert("회원정보 수정이 완료되었습니다.");
				location.href="/"
			}).fail(function(error){
				alert(JSON.stringify(error));
			});
		}

} */

</script>

</body>
</html>
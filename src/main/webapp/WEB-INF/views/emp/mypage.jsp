<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
			<sec:authentication property="Principal" var="user"/>
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->

				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
					
					<form>
					<h3>${user.empName}의 마이페이지</h3>
													
					<div class="card shadow mb-4" style="align-items: center;">
							<div style="width:75%; margin-bottom: 30px;">
                                <div style="width: 300px; float: left;">
                                    <c:choose>
                                        <c:when test="${empty vo.originalFileName}">
                                            <img alt="" src="/resources/images/default.jpeg" class=" rounded-circle" style="width: 250px; height: 250px; margin: 30px;">
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../files/emp/${vo.fileName}"  class=" rounded-circle" style="width: 250px; height: 250px; margin: 30px;">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
							<div style="width: 70%; margin-top: 20px; margin-bottom: 20px; margin-left:10px; float: left;">
								
								<table class="table" style="margin-top: 40px;">

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
							<br>
							<div>
								<table class="table">
									<tr>
										<td>입사일</td>
										<td>${vo.hireDate}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${vo.email}</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td>${vo.phone}</td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td>${vo.birth}</td>
									</tr>
									<tr>
										
									</tr>
								</table>
							</div>
							<a href="/emp/mypageUpdate?username=${user.username}" class="btn btn-primary" style=" margin-top: 10px; margin-left: 10px; float: right;">내 정보수정</a>
							<a href="/emp/pwUpdate?username=${user.username}" class="btn btn-outline-primary" style=" margin-top: 10px; float: right;">비밀번호 변경</a>
							<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">추가</button>   -->
						<div style="margin-top: 70px;">	
								<p style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 전자서명 관리</p>
								<c:if test="${empty sign.uploadName}">
									<a href="/emp/signAdd" style="float: right">등록</a>
								</c:if>

								<c:if test="${not empty sign.uploadName}">
								<div style="width: 30%; float: left;">
									<img alt="" src="../files/sign/${sign.uploadName}" style="width: 120px; height: 120px; margin: 30px;">
								</div>
								<div style="width:65%; margin-top: 50px; float: left;">
									<span style="text-align: center;">${sign.signName}</span><br>
									<span style="text-align: center;">등록일 : ${sign.addDate}</span>
									<a href="/emp/signAdd" style="float: right">수정</a>
								</div>
								</c:if>

						</div>	
							<br>
<%-- 				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">사원 등록</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">

								 <form action="/emp/signAdd" method="post" enctype="multipart/form-data" id="signAdd">
										<table style="margin: auto;">
											<tr>
												<td>사원번호</td>
												<td><input type="text" class="form-control" name="username" id="username" value="${user.username}" readonly="readonly"></td>
											</tr>
											<tr>
												<td>별칭</td>
												<td><input type="text" class="form-control" name="signName" id="signName" placeholder="별칭을 입력해주세요."></td>
											</tr>
											<tr>
												<td>파일</td>
												<td><input type="file" class="form-control" name="files" id="files"></td>
											</tr>
																						
											</table>
									</form>	
					          		<br>
							      <div class="modal-footer">
							        <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button class="btn btn-primary" id="addBtn">등록</button>
							      </div>
								</div>
							  </div>
							</div>
						</div> --%>
							
						</div>
					</div>						
				</form>
				<!-- Content wrapper -->		
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	</div>
</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
<!-- 	<script type="text/javascript">
	
	$('#addBtn').on("click", function(){
		let username = $("#username").val();
		let signName = $("#signName").val();
		let files = $("#files").val();

		
		let data = {signName:signName, files:files};
		
		if(signName == ""){
	        alert("이름은 필수입력사항입니다.");
	        empName.focus();
	        return;
	    }

	    
	    $.ajax({
			url:"/emp/signAdd",
            data: data,
			method:"post",	
			success : function(){
				console.log(data);
				alert("등록이 완료되었습니다!");
				location.href="/emp/mypage?username="+username;
			},
			error : function(data){
				console.log(data);
				alert("관리자에게 문의해주세요.");
			}
		});
	 
		
	});
	</script> -->
</body>
</html>
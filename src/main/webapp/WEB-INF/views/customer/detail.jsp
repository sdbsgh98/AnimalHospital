<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<meta charset="UTF-8">
<title>고객상세페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page" style="align-items:center;">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
					<h3>${vo.animalName}의 고객정보</h3>
						<div class="card shadow mb-4" style="align-items: center;">
							<div>
								<c:if test="${!empty vo.fileVO}">
									<div style="width: 300px; float: left;">
										<c:forEach items="${vo.fileVO}" var="f">
											<img alt="" src="../files/customer/${f.fileName}" class=" rounded-circle"
											style="width: 250px; height: 250px; margin: 30px;">
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${empty vo.fileVO}">
									<div style="width: 300px; float: left;">
											<img alt="" src="/resources/images/default.jpeg" class=" rounded-circle"
											style="width: 250px; height: 250px; margin: 30px;">
									</div>
								</c:if>
								
								<div style="width: 550px; margin-top: 20px; margin-bottom: 20px; float: left;">
									<table class="table" style="margin-top: 40px;">
										<tr>
											<td>이름</td>
											<td>${vo.animalName}</td>
										</tr>
										<tr>
											<td>나이</td>
											<td>${vo.age}</td>
										</tr>
										<tr>
											<td>성별</td>
											<td>${vo.gender}</td>
										</tr>
										<tr>
											<td>중성화</td>
											<td>${vo.neutering}</td>
										</tr>
									</table>
								</div>
								<br>
								<div>
									<table class="table">
										<tr>
											<td>몸무게</td>
											<td>${vo.weight}</td>
										</tr>
										<tr>
											<td>종류</td>
											<td>${vo.kind}</td>
										</tr>
							
										<tr>
											<td>보호자이름</td>
											<td>${vo.name}</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${vo.phone}</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>${vo.address}</td>
										</tr>
									</table>
								</div>
		
								<!-- 고객정보삭제모달 -->
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">
								  삭제
								</button>
								<a href="./update?customerNo=${vo.customerNo}" class="btn btn-primary" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">수정</a>
								<a href="/treatmentchart/list?customerNo=${vo.customerNo}" class="btn btn-primary" style="float: left; margin-top: 20px; margin-bottom: 20px; margin-left: 10px;">진료차트</a>
								
								<!-- 고객정보삭제모달창 -->
								<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">고객정보삭제</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        고객정보를 삭제하시겠습니까?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        <a href="./delete?customerNo=${vo.customerNo}" class="btn btn-primary">삭제</a>
								      </div>
								    </div>
								  </div>
								</div>
							</div>
						</div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
			</div>
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

</body>
</html>
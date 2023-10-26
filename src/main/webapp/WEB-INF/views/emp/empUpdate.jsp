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
<title>Insert title here</title>

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
			<form action="empUpdate" method="post">
					<br><h3>사원 정보 수정</h3>
				<div class="card shadow mb-4" style="width: 1400px; margin: auto;">												
					
							<div style="width:900px; float: left; margin-bottom: 30px; margin-left: 250px;">
								<div style="width: 300px; float: left;">
									<img alt="" src="/resources/images/${vo.originalFileName}" style="width: 200px; height: 200px; margin: 30px;">
								</div>
							<div style="width: 550px; margin-top: 20px; float: left;">
								<input type="hidden" name="username" value="${vo.empNo}">
								<table class="table">
									<tr>
										<td>사번</td>
										<td>${vo.empNo}</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>
											<input type="text" name="name" value="${vo.name}">
										</td>
									</tr>
									<tr>
										<td>부서</td>
										<td>
											<select name='deptNo'>
												<option value="${vo.deptNo}" selected="selected">${vo.deptName}</option>
												<option value="200">인사행정부</option>
												<option value="400">내과</option>
												<option value="500">외과</option>
												<option value="600">영상과</option>
												<option value="700">간호과</option>
												<option value="100">대표원장</option>
												<option value="999">가발령</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>직급</td>
										<td>
											<select name='positionNo'>
												<option value="${vo.positionNo}" selected="selected">${vo.positionName}</option>
												<option value="2">대표원장</option>
												<option value="3">원장</option>
												<option value="4">과장</option>
												<option value="5">팀장</option>
												<option value="6">수의사</option>
												<option value="7">사무장</option>
												<option value="8">대리</option>
												<option value="9">사원</option>
												<option value="10">간호실장</option>
												<option value="11">수의테크니션</option>
												<option value="12">가발령</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>상태</td>
										<td>
											<select name='state'>
												<option value="재직" selected="selected">${vo.state}</option>
												<option value="재잭">재직</option>
												<option value="휴직">휴직</option>
												<option value="퇴사">퇴사</option>
											</select>
										</td>
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

								</table>
							</div>
						</div>
				</div>
					<button class="btn btn-danger">수정완료</button>
			</form>							
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
	</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

</body>
</html>
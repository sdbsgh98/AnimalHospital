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
							<div style="width:900px; margin-bottom: 30px;">
                                <div style="width: 300px; float: left;">
                                    <c:choose>
                                        <c:when test="${empty vo.originalFileName}">
                                            <img alt="" src="/resources/images/default.jpeg" style="width: 250px; height: 250px; margin: 30px;">
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../files/emp/${vo.fileName}" style="width: 250px; height: 250px; margin: 30px;">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
							<div style="width: 550px; margin-top: 20px; margin-bottom: 20px; float: left;">
								
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
								<p>내 전자서명 관리</p>
							<div>
								<a href="/emp/signAdd">+</a>
								<table class="table">
									<tr>
										<td>사인이름</td>
										<td>${sign.signName}</td>
									</tr>
<%-- 									<tr>
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
										
									</tr> --%>
								</table>								
							</div>
							<br>
							<a href="/emp/mypageUpdate?username=${user.username}" class="btn btn-danger">수정</a>
							<a href="/emp/pwUpdate?username=${user.username}" class="btn btn-danger">비밀번호 변경</a>
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

</body>
</html>
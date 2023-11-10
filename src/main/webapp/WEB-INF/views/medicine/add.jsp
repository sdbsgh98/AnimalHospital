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
<title>약품추가페이지</title>

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
						<h3>약품추가</h3>
						<div class="card shadow mb-4" style="align-items: center;">
							<form action="./add" method="POST">
								<div>	
									<div style="width: 550px; margin-top: 20px; float: left;">
										<table class="table">
											<tr>
												<td>약품명</td>
												<td><input type="text" name="name" class="form-control" id="name" placeholder="약품이름을 입력하세요."></td>
											</tr>
											<tr>
												<td>재고</td>
												<td><input type="text" name="stock" class="form-control" id="stock"></td>
											</tr>
											<!-- <tr>	
												<td>입고일</td>
												<td><input type="date" name="medicineDate" class="form-control" id="medicineDate"></td>
											</tr> -->
											<tr>
												<td>유통기한</td>
												<td><input type="date" name="expirationDate" class="form-control" id="expirationDate"></td>
											</tr>
											
										</table>
										<button type="submit" class="btn btn-primary" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">약품등록</button>
									</div>
								</div>
							</form>
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
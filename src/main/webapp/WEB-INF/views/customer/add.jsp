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
<title>고객정보추가페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
		<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->

				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h3>고객정보추가</h3>
						<div class="card shadow mb-4" style="align-items: center;">			
							<!-- Content -->
							<form action="./add" method="POST" enctype="multipart/form-data">
								<div style="width: 550px; margin-top: 20px; float: left;">	
									<div>
										<table class="table">
											<tr>
												<td>사진</td>
												<td><input type="file" class="form-control" name="files"></td>
											</tr>
											<tr>
												<td>이름</td>
												<td><input type="text" name="animalName" class="form-control" id="animalName" placeholder="이름을 입력하세요."></td>
											</tr>
											<tr>
												<td>나이</td>
												<td><input type="text" name="age" class="form-control" id="age"></td>
											</tr>
											<tr>
												<td>성별</td>
												<td>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="gender" id="gender" value="male">
													<label class="form-check-label" for="flexRadioDefault1">
														남자
													</label>
													</div>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="gender" id="gender" value="female">
													<label class="form-check-label" for="flexRadioDefault2">
														여자
													</label>
													</div>
												</td>
											</tr>
											<tr>
												<td>중성화</td>
												<td>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="neutering" id="neutering" value="yes">
													<label class="form-check-label" for="flexRadioDefault1">
														YES
													</label>
													</div>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="neutering" id="neutering" value="no">
													<label class="form-check-label" for="flexRadioDefault2">
														NO
													</label>
													</div>
												</td>
											</tr>
											<tr>
												<td>몸무게</td>
												<td><input type="text" name="weight" class="form-control" id="weight"></td>
											</tr>
											<tr>
												<td>종류</td>
												<td>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="kind" id="kind" value="dog">
													<label class="form-check-label" for="flexRadioDefault1">
														강아지
													</label>
													</div>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="kind" id="kind" value="cat">
													<label class="form-check-label" for="flexRadioDefault2">
														고양이
													</label>
													</div>
													<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="kind" id="kind" value="etc">
													<label class="form-check-label" for="flexRadioDefault2">
														소동물
													</label>
													</div>
												</td>
											</tr>
								
											<tr>
												<td>보호자이름</td>
												<td><input type="text" name="name" class="form-control" id="name" placeholder="이름을 입력하세요."></td>
											</tr>
											<tr>
												<td>전화번호</td>
												<td><input type="text" name="phone" class="form-control" id="phone" placeholder="전화번호를 입력하세요."></td>
											</tr>
											<tr>
												<td>주소</td>
												<td>
													<div>      			
														<input type="text" name="address" class="form-control" id="postcode" placeholder="우편번호"
														readonly>
														<button type="button" class="btn btn-primary" id="addressSearch">우편번호찾기</button>
													</div> 
												<div class="field">       
													<div>
														<input type="text" name="address" class="form-control" id="address" placeholder="주소"
													readonly>
													</div>
													<div>
														<input type="text" name="address" class="form-control" id="detailAddress" placeholder="상세주소입력">                
													</div>
												</div>
												</td>
											</tr>
										</table>
										<button type="submit" class="btn btn-primary" style="float: right;">등록</button>
									</div>
								</div>
							</form>
						</div>
						<!-- / Content -->
						<div class="content-backdrop fade"></div>
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
	
	<!-- 카카오주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/js/customer/add.js"></script>

</body>
</html>
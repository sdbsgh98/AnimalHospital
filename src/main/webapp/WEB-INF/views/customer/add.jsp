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
							<form action="./add" method="POST" id="frm" enctype="multipart/form-data">
								<div style="width: 550px; margin-top: 50px;">	
									<div>
										<div class="mb-3 row">
											<label for="animalName" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">이름</label>
										    	<div class="col-sm-10">
										     		<input type="text" name="animalName" class="form-control animalName input" id="animalName" placeholder="이름을 입력하세요.">
										    	</div>
										    	<div id="anMsg" style="margin-left: 100px;"></div>
										</div>
										<div class="mb-3 row">
											<label for="age" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">나이</label>
										    	<div class="col-sm-10">
										     		<input type="text" name="age" class="form-control age input" id="age">
										    	</div>
										    	<div id="ageMsg" style="margin-left: 100px;"></div>
										</div>
										<div class="mb-3 row">
											<label for="gender" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">성별</label>
										    	<div class="col-sm-10">
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
										    	</div>
										</div>
										<div class="mb-3 row">
											<label for="neutering" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">중성화</label>
										    	<div class="col-sm-10">
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
										    	</div>
										</div>
										<div class="mb-3 row">
											<label for="weight" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">몸무게</label>
										    	<div class="col-sm-10">
										     		<input type="text" name="weight" class="form-control weight input" id="weight">
										    	</div>
										    	<div id="wMsg" style="margin-left: 100px;"></div>
										</div>
										<div class="mb-3 row">
											<label for="kind" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">종류</label>
										    	<div class="col-sm-10">
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
										    	</div>
										</div>
										<div class="mb-3 row">
											<label for="name" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">보호자</label>
										    	<div class="col-sm-10">
										     		<input type="text" name="name" class="form-control name input" id="name" placeholder="보호자이름을 입력하세요.">
										    	</div>
										    	<div id="nMsg" style="margin-left: 100px;"></div>
										</div>
										<div class="mb-3 row">
											<label for="phone" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">전화번호</label>
										    	<div class="col-sm-10">
										     		<input type="text" name="phone" class="form-control phone input" id="phone" placeholder="전화번호를 입력하세요." maxlength="11">
										    	</div>
										    	<div id="pMsg" style="margin-left: 100px;"></div>
										</div>
										<!-- <div class="mb-3 row">
											<label for="address" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">주소</label>
										    	<div class="col-sm-10">
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
										    	</div>
										</div> -->
										
										<div class="mb-3 row">
				                          <label for="address" class="col-md-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">주소</label>
				                          <div class="col-md-10">
				                            <input class="form-control address input" name="address" type="text" id="address"  placeholder="우편번호" value=""/>
				                            <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
				                            <input class="form-control" type="hidden" id="address"  placeholder="주소" />
				                            <input class="form-control" type="hidden" id="address"  placeholder="상세주소" value="" />
				                            <div id="aMsg"></div>
				                          </div>
				                        </div>
										
										<div class="mb-3 row">
											<label for="files" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">사진</label>
										    	<div class="col-sm-10">
										     		<input type="file" class="form-control" name="files">
										    	</div>
										</div>
										
										<button type="button" id="addBtn" class="btn btn-primary" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">등록</button>
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
    <!-- <script  text="text/javascript" src="/js/customer/add.js"></script> -->
    <script type="text/javascript" src="/js/customer/customerAdd.js"></script>

</body>
</html>
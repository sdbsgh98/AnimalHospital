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
	<title>지출내역서 작성</title>

</head>

<body>
	<!-- Layout wrapper -->
	<sec:authentication property="Principal" var="user"/>
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
					
						<div class="row">
				    		<form action="expenseAdd" id="addFrm" method="post">
				    		
				    			<div class="mb-3">
								  <label for="username" class="form-label"></label>
								  <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
								</div>
				    						    			
				    			<div class="mb-3">
								  <label for="positionName" class="form-label">부서</label>
								  <input type="text" class="form-control" id="positionName" name="positionName" value="${user.positionName}" readonly>
								</div>
								
				    			<div class="mb-3">
								  <label for="deptName" class="form-label">직급</label>
								  <input type="text" class="form-control" id="deptName" name="deptName" value="${user.deptName}" readonly>
								</div>
								
				    			<div class="mb-3">
								  <label for="empName" class="form-label">성명</label>
								  <input type="text" class="form-control" id="empName" name="empName" value="${user.empName}" readonly>
								</div>
								
				    			<div class="mb-3">
								  <label for="cDate" class="form-label">기안일자</label>
								  <input type="text" class="form-control" id="cDate" name="cDate" value="${date}" disabled>
								</div>
				    			
				    			<div class="mb-3">
								  <label for="apTitle" class="form-label">제목</label>
								  <input type="text" class="form-control" id="apTitle" name="apTitle" placeholder="제목을 입력하세요">
								</div>

			
			                    <div class="mb-1" style="margin:0 auto; width:fit-content;">
			                        <button type="button" class="btn btn-primary" id="expensePlusBtn">내역 추가</button>
			                    </div>
			        
			                    <!-- 지출결의서 폼이 추가되는 곳 -->
			                    <div id="addList" class="my-5">
									<div class="expense row g-3 mb-2" id="expense[0]" name="expense">
									    <input type="text" class="form-control me-2" id="expenseName0" name="expenseName" placeholder="항목" style="width:350px;">
									    <input type="text" class="form-control me-2" id="expenseAmount0" name="expenseAmount" placeholder="수량"
									    		style="width:100px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '');">
									    <input type="text" class="form-control me-2" id="expensePrice0" name="expensePrice" placeholder="금액"
									    		style="width:150px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '');">
									    <input type="text" class="form-control me-2" id="expenseBigo0" name="expenseBigo" placeholder="비고" style="width:200px;">
									</div> 
			                    </div>
								
					    		<div class="row">
									<div class="demo-inline-spacing">
										<button type="button" class="btn btn-primary" id="addBtn">작성</button>
										<button type="button" class="btn btn-primary" id="cancleBtn">취소</button>
									</div>
	                            </div>
								
				    		</form>
			    		</div>
					
					</div>
					<!-- / Content -->
					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
					<div class="content-backdrop fade"></div>
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
	
	<script src="/js/approval/apExpenseAdd.js"></script>

</body>
</html>
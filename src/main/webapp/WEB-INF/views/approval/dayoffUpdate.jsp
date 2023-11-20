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

	<!-- include summernote -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	  integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">	  
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
	
	<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>


	<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
	<meta charset="UTF-8">
	<title>휴가신청서 수정</title>
	
	<style>
	    .hidden {
	      display: none;
	    }
    </style>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
						<div class="card shadow mb-4" style="align-items: center;">
	                        <div class="card-body">
						<div class="row">
				    		<form action="update" id="updateFrm" method="post">
				    		
				    			<div class="mb-3">
								  <label for="username" class="form-label"></label>
								  <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
								</div>
								
								<input type="hidden" id="apKind" name="apKind" value="휴가신청서">
								
								<div class="firstApLineBox mb-2" style="display: flex; align-items: center;">
								  <!-- controller에 정보 전달하기 위함 -->
								  <div id="apLine[0]">
								  <input type="hidden" id="firstLineUsername" name="lineUsername" value="">
								  <input type="hidden" id="firstLineEmpName" name="lineEmpName" value="">
								  </div>
								  
								  <label for="firstApLineInfo" class="form-label"></label>
								  <input type="text" class="form-control firstApLineInfo" id="firstApLineInfo" readonly style="width:250px;">
								  <button type="button" class="btn btn-primary ms-2" id="firstApLineSelect" name="firstApLineSelect" data-bs-target="#staticBackdrop1">1차 결재선 설정</button>
			                   
								  <button type="button" class="btn btn-primary ms-3" id="deleteLineBtn" style="font-size: 20px; display: none;" onclick="toggleButtons2()">-</button>
			                      <button type="button" class="btn btn-primary ms-3" id="addLineBtn" style="font-size: 20px;" onclick="toggleButtons2()">+</button>
								</div>
								
			                    
								<div class="secondApLineBox hidden mb-4" id="secondApLineBox" style="align-items: center;">
								  <!-- controller에 정보 전달하기 위함 -->
								  <div id="apLine[1]">
								  <input type="hidden" id="secondLineUsername" name="lineUsername" value="">
								  <input type="hidden" id="secondLineEmpName" name="lineEmpName" value="">
								  </div>
								  
								  <label for="secondApLineSelect" class="form-label"></label>
								  <input type="text" class="form-control secondApLineInfo" id="secondApLineInfo" style="width:250px; display: inline-block;" value="" readonly>
								  <button type="button" class="btn btn-primary" id="secondApLineSelect" name="secondApLineSelect" data-bs-target="#staticBackdrop2" style="display: inline-block; margin-left: 5px;">2차 결재선 설정</button>
								</div>

								
 								<jsp:include page="/WEB-INF/views/approval/apLineSelect.jsp"></jsp:include>
 								
 								<div style="display: flex; flex-wrap: wrap; justify-content: space-between; max-width: 800px;">
				    						    			
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="positionName" class="form-label">부서</label>
								  <input type="text" class="form-control" id="positionName" name="positionName" value="${approvalVO.positionName}" readonly>
								</div>
								
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="deptName" class="form-label">직급</label>
								  <input type="text" class="form-control" id="deptName" name="deptName" value="${approvalVO.deptName}" readonly>
								</div>
								
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="empName" class="form-label">성명</label>
								  <input type="text" class="form-control" id="empName" name="empName" value="${approvalVO.empName}" readonly>
								</div>
								
				    			<div class="mb-3 inputGroup" style="width: 48%;">
								  <label for="apCDate" class="form-label">기안일자</label>
								  <input type="text" class="form-control" id="apCDate" name="apCDate" value="${approvalVO.apCDate}" readonly>
								</div>
				    			
				    			<div class="mb-3 inputGroup" style="width: 100%;">
								  <label for="apTitle" class="form-label">제목</label>
								  <input type="text" class="form-control" id="apTitle" name="apTitle" placeholder="제목을 입력하세요" value="${approvalVO.apTitle}">
								</div>
								
								
								<input type="hidden" id="dayoffValue" value="${approvalVO.dayoffKind}">
								
								<input type="hidden" id="offTime" value="${approvalVO.dayoffTime}">
								<input type="hidden" id="startDate" value="${dayoffStartDate}">
								<input type="hidden" id="endDate" value="${dayoffEndDate}">
								
								
								<div class="mb-3 inputGroup" style="width: 100%;">
								<label for="dayoffKind" class="form-label">구분</label>
								<div class="input-group-text mb-3" id="dayoffKind">
			                        <input type="radio" class="form-check-input mt-0" name="dayoffKind" value="반차" id="halfDay">&nbsp;반차
			                        <input type="radio" class="form-check-input ms-3" name="dayoffKind" value="연차" id="fullDay">&nbsp;연차
			                        <input type="radio" class="form-check-input ms-3" name="dayoffKind" value="병가" id="sickDay">&nbsp;병가
			                        <input type="radio" class="form-check-input ms-3" name="dayoffKind" value="경조사" id="familyDay">&nbsp;경조사
			                        <input type="radio" class="form-check-input ms-3" name="dayoffKind" value="기타" id="etcDay">&nbsp;기타
		                        </div>
		                        </div>
														
						        <div id="dateFields" class="mb-3">
						        
						        </div>
						        <div id="result">
						        
						        </div>

								<div class="mb-3 inputGroup" style="width: 100%;">
								  <label for="apContents" class="form-label">내용</label>
								  <textarea class="form-control" id="apContents" name="apContents" rows="3" placeholder="내용을 입력하세요">${approvalVO.apContents}</textarea>
								</div>
								

								
				    		</form>
			    		</div>
					
					</div>
					<!-- / Content -->
					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
					<div class="content-backdrop fade"></div>
					</div>
					</div>
		    		<div class="row">
						<div class="demo-inline-spacing">
							<button type="button" class="btn btn-primary" onclick="updateSubmitBtn()">작성</button>
							<button type="button" class="btn btn-primary" onclick="cancleBtn()">취소</button>
						</div>
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
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
	<!-- Vendors JS -->
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<!-- Page JS -->
	<script src="${pageContext.request.contextPath}/assets/js/dashboards-analytics.js"></script>
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	
	<!-- summernote -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
	
	<!-- language pack -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	 	 
	<script>
	$('#apContents').summernote({
	  tabsize: 2,
	  height: 400,
	  codemirror: { // codemirror options
		    theme: 'monokai'
		  },
	  lang: 'ko-KR', // default: 'en-US'
	});
	
	$("#apContents").summernote('code'); 
	</script>
	

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
    
	<script src="/js/approval/apDayoffAdd.js"></script>
	<script src="/js/approval/apLineSelect.js"></script>
	
	<script>
	    $(document).ready(function () {
	        $('#jstree').jstree();       
	        $("#jstree").jstree("open_all");
	        $('#jstree').on("changed.jstree", function (e, data) {
	            console.log(data.selected);
	        });
	    });
	</script>
	
	<script>
	    $(document).ready(function () {
	        $('#jstree2').jstree();       
	        $("#jstree2").jstree("open_all");
	        $('#jstree2').on("changed.jstree2", function (e, data) {
	            console.log(data.selected);
	        });
	    });
	</script>
	
	<script type="text/javascript">
	
		function toggleButtons() {
		  var addLineBtn = document.getElementById('addLineBtn');
		  var deleteLineBtn = document.getElementById('deleteLineBtn');
		  var secondApLineBox = document.getElementById('secondApLineBox');
		  var secondApLineInfo = document.getElementById('secondApLineInfo');
		  var secondLineUsername = document.getElementById('secondLineUsername');
		  var secondLineEmpName = document.getElementById('secondLineEmpName');
		  
		  if (addLineBtn.style.display !== 'none') {
			  	addLineBtn.style.display = 'none';
			  	secondApLineBox.style.display = 'inline-block';
			  	secondApLineInfo.value = "";
			  } else {
				addLineBtn.style.display = 'inline-block';
				secondApLineBox.style.display = 'none';
			  	secondLineUsername.value = "";
			  	secondLineEmpName.value = "";
			  }
		  
		}
		
		
	    function toggleButtons2() {
	        var addLineBtn = document.getElementById('addLineBtn');
	        var deleteLineBtn = document.getElementById('deleteLineBtn');
	        var secondApLineBox = document.getElementById('secondApLineBox');
	        var secondApLineInfo = document.getElementById('secondApLineInfo');
	        var secondLineUsername = document.getElementById('secondLineUsername');
	        var secondLineEmpName = document.getElementById('secondLineEmpName');

	        if (addLineBtn.style.display !== 'none') {
	            addLineBtn.style.display = 'none';
	            deleteLineBtn.style.display = 'inline-block';
	            secondApLineBox.style.display = 'inline-block';
	            secondApLineInfo.value = "";
	        } else {
	            addLineBtn.style.display = 'inline-block';
	            deleteLineBtn.style.display = 'none';
	            secondApLineBox.style.display = 'none';
	            secondLineUsername.value = "";
	            secondLineEmpName.value = "";
	        }
	    }	
	</script>
	
	<script type="text/javascript">
	

	$(document).ready(function(){
		let selectedValue = document.getElementById("dayoffValue").value;
	    $('input[name="dayoffKind"][value="' + selectedValue + '"]').prop('checked', true);
		

       if (selectedValue === '반차') {
            halfDay();
        } else if (selectedValue === '연차') {
        	fullDay();
        } else if (selectedValue === '병가') {
            sickDay();
        } else if (selectedValue === '경조사') {
        	familyDay();
        } else if (selectedValue === '기타') {
        	etcDay();
        }
    })


	</script>

</body>
</html>
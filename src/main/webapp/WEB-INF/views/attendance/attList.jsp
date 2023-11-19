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
</head>
<meta charset="UTF-8">
<title>근태관리</title>
  
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
.form-group {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>

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
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
	                        <div class="card-body">
						        <!-- 전체 페이지 수 -->
						        <input type="hidden" name="totalPage" id="totalPage" value="${pager.totalPage}">
						        
								<div class="">
									<div>
										<!-- 검색 -->
										<div class="input-group mb-3">
											<form onsubmit="return validateForm()" action="../list" method="get" class="" id="frm"
										style="width:100%;">
										<div style="
					    display: flex;
					    justify-content: center;
					    gap:70px;
					    width: 100%;
">
											
											<div class="form-group">
													
													<!-- Date Range Search -->
									                <label for="startDate" class="ms-2 me-1">시작일:</label>
									                <input type="date" id="startDate" name="startDate" class="form-control" style="width: 150px;">
									                <label for="endDate" class="ms-2 me-1">종료일:</label>
									                <input type="date" id="endDate" name="endDate" class="form-control" style="width: 150px;">
							                </div>
											
											<div class="form-group" style="gap:10px;">
												<div class="input-group" style="width: 120px;">
													<input type="hidden" value="${pager.page}" id="page" name="page">
													<select name="kind" id="k" class="form-select"
														data-kind="${pager.kind}" aria-label="Default select example" style="width: 50px;">
														<option class="kind" value="empName">사원명</option>
														<option class="kind" value="positionName">직급명</option>
														<option class="kind" value="deptName">부서명</option>
													</select>
												</div> 
												<input type="text" name="search" value="${pager.search}"
													class="form-control" aria-label="Amount (to the nearest dollar)" style="width: 150px;">
												
											</div>
							                
					                	</div>
									                
													<button type="submit" class="btn btn-primary" style="width:100px;display:block;margin:15px auto 0;">검색</button>
													
											</form>
										</div>
									</div>
								</div>
	                        </div>
	                    </div>
	                    <div class="card shadow mb-4">
	                        <div class="card-body">
	                            <div class="table-responsive">
                               		<input type="hidden" name="username" id="username" value="${user.username}">
                               		<input type="hidden" name="empName" id="empName" value="${user.empName}">

	                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
											<tr>
												<th>번호</th>
												<th>일자</th>
												<th>부서</th>
												<th>직급</th>
												<th>이름</th>
												<th>출근시간</th>
												<th>퇴근시간</th>
											</tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach items="${att}" var="att" varStatus="i">
		                                        <tr>
		                                        	<td>${i.index + 1}</td>
		                                        	<td>${att.attDate}</td>
		                                        	<td>${att.deptName}</td>
		                                            <td>${att.positionName}</td>
		                                        	<td>${att.empName}</td>
		                                            <td>${att.attIn}</td>
		                                            <td>${att.attOut}</td>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>  
				    			</div>
				    			
				    			<div>
			    						<!-- 페이징 -->
										<nav class="mt-4" aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<c:if test="${pager.pre}">
												<li class="page-item ${pager.pre?'':'disabled'}"><a
													class="page-link"
													href="../attendance/list?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
												</c:if>
												<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
													var="i">
													<li class="page-item"><a class="page-link"
														href="../attendance/list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
												</c:forEach>
												<c:if test="${pager.next}">
													<li class="page-item"><a class="page-link"
														href="./attendance/list?page=${pager.startNum + 1}&kind=${pager.kind}&search=${pager.search}"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													</a></li>
												</c:if>
											</ul>
										</nav>
			    					</div>
			    					
	    					</div>
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

	<!-- datepicker 사용하기 위함 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	
	<script type="text/javascript">
	    $('#searchStartDate').datepicker({
	        dateFormat: 'yy/mm/dd' // 날짜 형식 설정
	        })
	   
	    $('#searchEndDate').datepicker({
	        dateFormat: 'yy/mm/dd', // 날짜 형식 설정
	        beforeShow: function(input) {
	            let searchStartDate = $('#searchStartDate').datepicker('getDate');
	            if (searchStartDate) {
	                return { minDate: searchStartDate };
	            }
	        }
	    })
	</script>
	
	<script>
		function validateForm() {
		    var startDate = document.getElementById("startDate").value;
		    var endDate = document.getElementById("endDate").value;
		

		    if (startDate === "") {
		        document.getElementById("startDate").removeAttribute("name");
		    }
		
		    if (endDate === "") {
		        document.getElementById("endDate").removeAttribute("name");
		    }
		
		    return true;
		}
	</script>	
	
</body>
</html>
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

	<style type="text/css">
		.fc-event{
		    cursor: pointer;
		}
	</style>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<sec:authentication property="Principal" var="user"/>
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
					<div class="card shadow mb-4">
	                <div class="card-body">
	                <div class="table-responsive">
	                

				    <div id="calendarBox">
				        <div id="calendar"></div>
				    </div>
				    
				    <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">

			    
			    	<!-- 일정추가 모달창 -->
				    <!-- modal 추가 -->
				    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				        aria-hidden="true">
				        <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="exampleModalLabel">근무일정 등록</h5>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body">
				                    <div class="form-group">
				                        <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
				                        
				                        <label for="deptName" class="form-label">부서명</label>
				                        <input type="text" class="form-control" id="deptName" name="deptName" value="${user.deptName}" readonly>
				                        
				                        <label for="positionName" class="form-label">직급명</label>
				                        <input type="text" class="form-control" id="positionName" name="positionName" value="${user.positionName}" readonly>
				                        
				                        <label for="empName" class="form-label">직원명</label>
				                        <input type="text" class="form-control" id="empName" name="empName" value="${user.empName}" readonly>
				                        
				                        <label for="workDate" class="form-label">날짜</label>
				                        <input type="date" class="form-control" id="workDate" name="workDate">
				                        
				                        <label for="workTime" class="form-label">출근시간</label>
				                        <input type="time" class="form-control" id="workTime" name="workTime">
				                        
				                        <label for="homeTime" class="form-label">퇴근시간</label>
				                        <input type="time" class="form-control" id="homeTime" name="homeTime">
				                        
				                    	<input type="hidden" id="workNo" name="workNo">
				                    </div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
				                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
				                        id="sprintSettingModalClose">취소</button>
				                </div>
				    
				            </div>
				        </div>
				    </div>
				    
				    
					<!-- 상세보기 모달창 -->
					<div class="modal fade" id="detailModal" tabindex="-1" aria-hidden="true">
					    <div class="modal-dialog modal-lg" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h3 class="modal-title" id="exampleModalLabel3"><strong>일정 상세</strong></h3>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body">
					            	<div class="row">
 					                    <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
				                    	<input type="hidden" id="workNo" name="workNo">
				                    	
					            		<div class="row mb-3">
		                                	<label class="form-label">제목
		                                		<span class="form-control skdTitle">제목</span>
		                                	</label>
		                                </div>
			                            <div class="row mb-3">
		                                	<label class="form-label">부서명
			                                	<span class="form-control deptName" id="deptName">${scheduleVO.deptName}</span>
		                                	</label>
		                                </div>
			                            <div class="row mb-3">
		                                	<label class="form-label">직급명
			                                	<span class="form-control positionName" id="positionName">${scheduleVO.positionName}</span>
		                                	</label>
		                                </div>
			                            <div class="row mb-3">
		                                	<label class="form-label">직원명
			                                	<span class="form-control empName" id="empName">${scheduleVO.empName}</span>
		                                	</label>
		                                </div>
			                            <div class="row mb-3">
		                                	<label class="form-label">날짜
			                                	<span class="form-control workDate" id="workDate">${scheduleVO.workDate}</span>
		                                	</label>
		                                </div>
			                            <div class="row mb-3">
		                                	<label class="form-label"> 근무시간
			                                	<span class="form-control workTime" id="workTime">${scheduleVO.workTime}</span>
			                                	<span> ~ </span>
			                                	<span class="form-control homeTime" id="homeTime">${scheduleVO.homeTime}</span>
		                                	</label>
		                                </div>
					                </div>
					            </div>
					            <div class="modal-footer">
	                                <button type="button" class="btn btn-primary" id="updateBtn">수정</button>
	                                <button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>
						            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
					            </div>
					        </div>
					    </div>
					</div>
				    
				    
				    <!-- 일정 수정 모달창 -->
				    <div class="modal fade" id="updateModal" role="dialog" style="display: none;">
				        <div class="modal-dialog">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="workUpdateModal">일정상세</h5>
				                    <button type="button" class="cancleBtn" data-bs-dismiss="modal"></button>
				                </div>
				                <div class="modal-body">
				                    <div class="form-group" id="updateModal">
				                        <input type="hidden" class="form-control" id="username" name="username">
				                        
				                        <label for="deptName" class="form-label">부서명</label>
				                        <input type="text" class="form-control" id="deptName" name="deptName" value="${user.deptName}" readonly>
				                        
				                        <label for="positionName" class="form-label">직급명</label>
				                        <input type="text" class="form-control" id="positionName" name="positionName" value="${user.positionName}" readonly>
				                        
				                        <label for="empName" class="form-label">직원명</label>
				                        <input type="text" class="form-control" id="empName" name="empName" value="${user.empName}" readonly>
				                        
				                        <label for="workDate" class="form-label">날짜</label>
				                        <input type="date" class="form-control" id="workDate" name="workDate" value="${scheduleVO.workDate}">
				                        
				                        <label for="workTime" class="form-label">출근시간</label>
				                        <input type="time" class="form-control" id="workTime" name="workTime" value="${scheduleVO.workTime}">
				                        
				                        <label for="homeTime" class="form-label">퇴근시간</label>
				                        <input type="time" class="form-control" id="homeTime" name="homeTime" value="${scheduleVO.homeTime}">
				                        
				                    	<input type="hidden" id="workNo" name="workNo">
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				    
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
	<script src="/js/workSchedule/workSchedule.js"></script>
	
</body>
</html>
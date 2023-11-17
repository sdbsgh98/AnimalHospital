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
					
				    <input type="hidden" class="form-control" id="username" name="username" value="${user.username}">
				    
					<!-- <select name="deptNo" id="deptNo" class="form-select form-select-sm" aria-label="Small select example"> 	           	   
			           	   <option value="300">전체</option>
			               <option value="400">내과</option>
			               <option value="500">외과</option>
			               <option value="600">영상과</option>       
			          </select>  -->

					<div class="card shadow mb-4">
	                <div class="card-body">
	                <div class="table-responsive">
	                

				    <div id="calendarBox">
				        <div id="calendar"></div>
				    </div>

			    	<!-- 일정추가 모달창 -->
				    <!-- modal 추가 -->
				    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
			                        
				                        <label for="workStart" class="form-label">출근</label>
				                        <input type="datetime-local" class="form-control" id="workStart" name="workStart">
				                        
				                        <label for="workEnd" class="form-label">퇴근</label>
				                        <input type="datetime-local" class="form-control" id="workEnd" name="workEnd">
				                        
				                    </div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-warning" id="addBtn">추가</button>
				                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
				                        id="addclose">취소</button>
				                </div>
				    
				            </div>
				        </div>
				    </div>
				    
				    
				<!-- 상세보기 모달창 -->
                <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">근무일정 상세</h1>
                        <button type="button" id="closeBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                      
                      <input type="hidden" id="workNo" name="workNo">
                      <input type="hidden" id="getusername" name="username">
                      <table class="table align-items-center mb-0">								
                      	<tbody>
                      	
                        <tr>
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">부서명 : </span>
							</td>
	                        <td class="align-middle text-center text-sm">
	                            <span class="text-secondary text-xs font-weight-bold">
	                            	<input type="text" readonly class="form-control-plaintext" id="getDeptName" value="">
	                            </span>
	                        </td> 
                        </tr>
                        <tr>
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">직급명 : </span>
							</td> 
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">
								<input type="text" readonly class="form-control-plaintext" id="getPositionName" value="">
								</span>
							</td>                                                     
                        </tr>
                        <tr>
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">직원명 : </span>
							</td> 
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">
								<input type="text" readonly class="form-control-plaintext" id="getEmpName" value=""></div>
								</span>
							</td>                                                     
	                    </tr>
	                    <tr>
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">근무시간 : </span>
							</td> 
							<td class="align-middle text-center text-sm">
								<span class="text-secondary text-xs font-weight-bold">
								<input type="datetime-local" readonly class="form-control-plaintext" id="getWorkStart" value="">
								<input type="datetime-local" readonly class="form-control-plaintext" id="getWorkEnd" value="">
								</span>
							</td>                                                     
						</tr>               
                      </tbody>
                    </table>           
                    </div>                     
                    <div class="modal-footer">
                        <button type="button" id="modifyBtn"class="btn btn-secondary">수정</button>
                        <button type="button" id="deleteBtn" class="btn btn-primary">삭제</button>
                      </div>
                    </div>
                  </div>
                </div>				    
				    
			    <!-- 일정 수정 모달창 -->
			    <div class="modal fade" id="updateModal" role="dialog" style="display: none;">
			        <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <h5 class="modal-title" id="workUpdateModal">일정 수정</h5>
			                    <button type="button" class="cancleBtn" data-bs-dismiss="modal"></button>
			                </div>
			                <div class="modal-body">
			                    <div class="form-group" id="upModal">
			                        <input type="hidden" class="form-control" id="getUsername" name="username">
			                        <input type="hidden" class="form-control" id="getWorkNo" name="workNo">
			                        
			                        <label for="deptName" class="form-label">부서명</label>
			                        <input type="text" class="form-control" id="upDeptName" name="deptName" value="" readonly>
			                        
			                        <label for="positionName" class="form-label">직급명</label>
			                        <input type="text" class="form-control" id="upPositionName" name="positionName" value="" readonly>
			                        
			                        <label for="empName" class="form-label">직원명</label>
			                        <input type="text" class="form-control" id="upEmpName" name="empName" value="" readonly>
			                        
			                        <label for="upWorkStart" class="form-label">출근</label>
			                        <input type="datetime-local" class="form-control" id="upWorkStart" name="upWorkStart" value="">
			                        
			                        <label for="upWorkEnd" class="form-label">퇴근</label>
			                        <input type="datetime-local" class="form-control" id="upWorkEnd" name="upWorkEnd" value="">
			                        
			                    	<input type="hidden" id="workNo" name="workNo" value="">
			                    </div>
			                </div>
						      <div class="modal-footer">
		                        <button type="button" id="closeBtn"class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		                        <button type="button" id="updateBtn" class="btn btn-primary">수정</button>
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
	<script src="/js/work/workSchedule.js"></script>
	
</body>
</html>
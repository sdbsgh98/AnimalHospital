<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<body id="page-top">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	    	<div id="content-wrapper" class="d-flex flex-column">
	    		<div id="content">	    		
		    		<div class="container-fluid" style="margin-top: 50px;">
						<sec:authentication property="Principal" var="user"/>
						    <div class="container-xxl">
						      <div class="authentication-wrapper authentication-basic container-p-y">
						        <div class="authentication-inner">
						          <!-- Register -->
						          <div class="card" style="align-items: center; margin: auto; margin-top: 10px;">
						            <div class="card-body" style="width: 1000px;">
						              <!-- Logo -->
						              <div class="app-brand justify-content-center">
						                <a href="#" class="app-brand-link gap-2">
						                  <img alt="" src="/resources/images/jisun3.png" style="width: 40px;" height="40px;">
						                  <span class="app-brand-text demo text-body fw-bolder">Animal Hospital</span>
						                </a>
						              </div>
						              <br>
						              <!-- /Logo -->
						              <h4 style="text-align: center;">부서관리</h4>
										<div style="width: 100%;">
											<form action="deptUpdate" method="post">
												<div id="detail" style="width: 80%; height:75%; margin: auto;">
													<span>부서번호</span>
													<input type="text" class="form-control" name="deptNo" value="${vo.deptNo}">
													<span>이름</span>
													<input type="text" class="form-control" name="deptName" value="${vo.deptName}">
													<span>상위부서</span>
													<select class="form-control" name='parentNo' id="parentNoAdd" style="height: 35px;">										
														<c:forEach items="${select}" var="dept">
															<option value="${dept.deptNo}" selected>${dept.deptName}</option>
														</c:forEach>
													<option value=0>없음</option>
													</select>
													<span>직급</span>
	
													<%-- <select class="form-control" name='positionNo' id="positionNo" style="height: 35px;">
														<option value="${vo.positionNo}" selected="selected">${vo.positionName}</option>										
														<c:forEach items="${po}" var="po">
															<option value="${po.positionNo}">${po.positionName}</option>
														</c:forEach>
													</select> --%>
													<br>
													<button>완료</button>
													<a href="./deptDelete?deptNo=${vo.deptNo}" id="deleteBtn">삭제</a>
												</div>																																							
											</form>
											<a href="#" type="button" class="btn" id="positionBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 100px; background-color: rgb(255,255,222); font-size: 13px; margin-top: 5px; margin-left: 5px;">직급추가</a>
										
												<!-- 직급추가 modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										 <div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">직급 추가</h1>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
													<div class="modal-body">
										
															 <input type="hidden" id="deptNoAdd" name="deptNo">
															<div class="mb-3">
															    <label for="deptName" class="col-form-label">부서명:</label>
															   <input type="text" class="form-control" id="deptNameAdd" name="deptName">
															</div>
															<div class="mb-3">
															     <label for="parentNo" class="col-form-label">상위부서:</label>
																<select class="form-control" name='parentNo' id="parentNoAdd" style="height: 35px;">										
																		<c:forEach items="${dept}" var="dept">
																			<option value="${dept.deptNo}">${dept.deptName}</option>
																		</c:forEach>
																	<option value=0>없음</option>
																</select>
															</div>
															          
															<div class="modal-footer">
																 <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
																 <button class="btn btn-primary" id="addBtn">추가</button>
															</div>					
														</div>
													</div>
												 </div>
											</div>	
											
										</div>									
						            </div>
						          </div>
						          <!-- /Register -->
						        </div>
						      </div>
						    </div>
						
						    <!-- / Content -->
		    		</div>   		
	    		
	    		</div>	    		

	    	</div>
	    </div>  
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
	

	<script type="text/javascript">
	
	$('#deleteBtn').on("click", function(){
		confirm("삭제하시겠습니까?");
	})
	
	</script>
	
	<script type="text/javascript">
		$('#positionBtn').on("click", function(){
	
			let deptName = $("#deptNameAdd").val();
			let parentNo = $("#parentNoAdd").val();
	
		
			let data = {deptName:deptName, parentNo:parentNo};

	
			/* $.ajax({
				url:"/dept/deptList/deptAdd",
	            data: data,
				method:"post",												
				success : function(){
					console.log(data);
					alert("등록이 완료되었습니다!");
					location.href="/dept/deptList";		
				},
				error : function(data){
					console.log(data);
					alert("관리자에게 문의해주세요.");
				}
			}) */
	
		});
	</script>
	
</body>
</html>
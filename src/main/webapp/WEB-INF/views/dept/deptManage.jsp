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
													<input type="hidden" id="positionNohidden" value="${positionNo}">
													<span>부서번호</span>
													<input type="text" class="form-control" id="no" name="deptNo" value="${vo.deptNo}">
													<span>이름</span>
													<input type="text" class="form-control" id="name" name="deptName" value="${vo.deptName}">
													<span>상위부서</span>
													<select class="form-control" name='parentNo' id="parentNoAdd" style="height: 35px;">										
														<c:forEach items="${select}" var="dept">
															<option value="${dept.deptNo}" selected>${dept.deptName}</option>
														</c:forEach>
													<option value=0>없음</option>
													</select>
													<span>직급</span>
														<c:forEach items="${deptPosition}" var="position">
															<input type="text" class="form-control" id="position${position.positionNo}" name="positionName" value="${position.positionName}">
															<input type="hidden" id="positionNohidden" value="${positionNo}">
														</c:forEach>							
													<br>
													
												</div>																																							
													<button id="ok">완료</button>
											</form>
											<a href="#" type="button" class="btn" id="positionBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 100px; background-color: rgb(255,255,222); font-size: 13px; margin-top: 5px; margin-left: 5px;">직급추가</a>
										
												<!-- 직급추가 modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										 <div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">직급 관리</h1>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
													<div class="modal-body">
										
															 <input type="hidden" id="positionAdd" name="positionNo">
															<div class="mb-3">
															    <label for="deptName" class="col-form-label">부서 :</label>
															    <input type="text" class="form-control" id="deptName" name="deptName" value="${vo.deptName}" readonly="readonly">
															    <input type="hidden" class="form-control" id="deptNo2" name="deptNo" value="${vo.deptNo}" readonly="readonly">
															</div>
															<div class="addContainer">
															     <label for="positionName" class="col-form-label">직급명</label>
																<c:forEach items="${deptPosition}" var="position">
																	<input type="text" class="form-control" id="positionName2" name="positionName" value="${position.positionName}" readonly="readonly">
																</c:forEach>																
																<input type="button" class="btnRemove" value="X">
																 <button id="addInput">+</button>
															</div>
															          
															<div class="modal-footer">
																 <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
																 <button class="btn btn-primary" id="addBtn2">추가</button>
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
		$('#ok').on("click", function(){
	
			let deptNo = $("#no").val();
			let deptName = $('#name').val();
			let parentNo = $("#parentNoAdd").val();
			let positionName = $('#position${position.positionNo}').val();
			let positionNo = $('#positionNohidden').val();
			
			console.log("detpNo"+deptNo);
			console.log("deptName"+deptName);
			console.log("parentNo"+parentNo);
			console.log("positionName"+positionName);
			console.log("positionNo"+positionNo);
		
			alret("데이터 체크");

	
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
	
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('#addInput').click(function () {
	            $('.addContainer').append(
	                '<input type="text" class="form-control positionName" id="positionName2" name="positionName"> ' +
	                '<input type="button" class="btnRemove" value="X"><br>'
	            );
	
	            // Use event delegation to handle the click event for dynamically added elements
	            $('.addContainer').on('click', '.btnRemove', function () {
	                $(this).prev().remove();
	                $(this).next().remove();
	                $(this).remove();
	            });
	        });
	    });
	</script>
	<script type="text/javascript">
    	$('#addBtn2').on("click", function(){

    		let positionName = $("#positionName2").val();
        	let deptNo = $("#deptNo2").val();
    		
			let data = {positionName:positionName, deptNo:deptNo};
			
		    if(positionName == ""){
		        alert("사용하지 않는 입력칸은 삭제해주세요.");
		        positionName.focus();
		        return;
		    }
	
			 $.ajax({
				url:"/dept/positionAdd",
	            data: data,
				method:"post",												
				success : function(){
					console.log(data);
					alert("등록이 완료되었습니다!");
					location.href="/dept/deptManage?deptNo="+deptNo;		
				},
				error : function(data){
					console.log(data);
					alert("관리자에게 문의해주세요.");
				}
			}) 
	
		});    
	</script>
</body>
</html>
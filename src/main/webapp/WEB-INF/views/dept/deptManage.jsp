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
												<div id="detail" style="width: 80%; height:75%; margin: auto;">
											<form action="deptUpdate" method="post">
													<span>부서번호</span>
													<input type="text" class="form-control deptNo1" id="no" name="deptNo" value="${vo.deptNo}" readonly="readonly">
													<span>이름</span>
													<input type="text" class="form-control" id="name" name="deptName" value="${vo.deptName}">
													<span>상위부서</span>
													<select class="form-control" name='parentNo' id="parentNoAdd" style="height: 35px;">										
														<c:forEach items="${select}" var="dept">
															<option value="${dept.deptNo}" selected>${dept.deptName}</option>
														</c:forEach>
													<option value=0>없음</option>
													</select>
													<br><br>
													<span>직급</span>
														<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">+</button>
															<input type="hidden" class="form-control" id="no3" name="deptNo" value="${vo.deptNo}" readonly="readonly">
											
														<c:forEach items="${deptPosition}" var="position">
														    <div class="addContainer">
																<input type="hidden" class="positionNohidden2" value="${position.positionNo}">											
														        <input type="text" class="form-control" id="positionNameList" name="positionName" value="${position.positionName}" readonly="readonly">
														 		<a href="./positionDelete?positionNo=${position.positionNo}" type="button" class="btn btnRemove" style="width: 5%; float: right;">X</a>
														    </div>
													
														</c:forEach>	
																								
														       <br>		
														<a href="./deptList" class="btn btn-primary" type="button">목록</a>									        
														<button type="submit" class="btn btn-primary" id="ok2" style="">수정완료</button>														       
												</form> 	
														<!-- <div class="newContainer"></div> -->
														<!-- <button id="addInput" class="btn" type="button">+</button> -->					
												
												</div>																																							
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h1 class="modal-title fs-5" id="exampleModalLabel">직급 추가</h1>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
							
												         <form action="positionAdd" method="post" enctype="multipart/form-data">
												          <%-- <form:form modelAttribute="addVO" action="/emp/empList/empAdd" method="POST"> --%>
												          <input type="hidden" class="form-control" id="no2" name="deptNo" value="${vo.deptNo}" readonly="readonly">
															<div>
																<span>부서명</span>
																<input type="text" class="form-control" id="name" name="deptName" value="${vo.deptName}" readonly="readonly">
																<span>상위부서</span>
																<input type="text" class="form-control" id="parentNo" name="parentNo" value="${vo.parentNo}" readonly="readonly">
															</div>
															<div class="addContainer">
															  <input type="hidden" class="positionNohidden" value="${positionNo}">
															  <span>직급명</span>
															   <input type="text" class="form-control" id="positionName" name="positionName" placeholder="추가 할 직급명을 입력해주세요."/>
															</div>
															
											          	<br>
														      <div class="modal-footer">
														        <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
														        <button class="btn btn-primary" id="addBtn">추가</button>
														      </div>
															</form>
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
    $("#addBtn").on("click", function() {
        let positionNo = container.find('.positionNohidden2').val();
        let positionName = $('#positionName').val();
        let deptNo = $("#no2").val();

        let data = {positionName: positionName, deptNo: deptNo};

        $.ajax({
            type: "POST",
            url: "/dept/positionAdd",
            data: data,
            success: function(response) {
                console.log(data);
                location.href="./deptManage?deptNo="+$("#no2").val();
                alert("성공적으로 추가되었습니다.");
            },
            error: function(error) {
                alert("오류가 발생했습니다.");
            }
        });
    });
	</script>
<!-- 	<script type="text/javascript">
		$("#ok").on("click", function(){
	        let deptNo = $('.no3').val();
	        let positionName = $('#positionNameList').val();
	        let positionNo = $(".positionNohidden2").val();
	        
	        let data = {positionName: positionName, positionNo: positionNo};
	        
	        $.ajax({
	            type: "POST",
	            url: "/dept/positionUpdate",
	            data: data,
	            success: function(data) {
	            	console.log(data);
	                alert("성공적으로 업데이트되었습니다.");
	                location.href="/dept/deptManage?deptNo="+deptNo;
	            },
	            error: function(error) {
	                alert("오류가 발생했습니다.");
	            }
	        });
		})
		
	</script> -->
	
	<script type="text/javascript">
		$("#ok2").on("click", function(){
	        let deptNo = $('.deptNo1').val();
	        let deptName = $('#name').val();
	        let parentNo = $("#parentNoAdd").val();
	        
	        let data = {deptNo: deptNo, deptName: deptName, parentNo: parentNo};
	        
	        $.ajax({
	            type: "POST",
	            url: "/dept/deptUpdate",
	            contentType:"application/json",
	            data: data,
	            success: function(data) {
	            	console.log(data);
	                alert("성공적으로 업데이트되었습니다.");
	            },
	            error: function(error) {
	                alert("오류가 발생했습니다.");
	            }
	        });
		})
		
	</script>
	

	<script type="text/javascript">
	    $('.btnRemove').on("click", function (event) {
	    	let deptNo = $('#no3').val();
	    	let re = $('#no').val();
	    	
	        // confirm 대화상자에서 '확인'을 누르면 true, '취소'를 누르면 false를 반환
	        if (!confirm("삭제하시겠습니까?")) {
	            event.preventDefault(); 
	            /* 삭제 취소 */
	        }else{
				alert("삭제완료");	        	
	            console.log(re);
	            console.log(deptNo);
	            location.replace="redirect:./deptDetail?deptNo="+deptNo; 
	        }
	        
	    });
	</script>
	
</body>
</html>
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
														<button id="addInput" class="btn" type="button">+</button>
														<c:forEach items="${deptPosition}" var="position">
														    <div class="addContainer">
														        <input type="hidden" class="positionNohidden" value="${positionNo}">
														        <input type="text" class="form-control" id="position${position.positionNo}" name="positionName" value="${position.positionName}">
														        <input type="button" class="btn btnRemove" value="X" style="width: 5%; float: right;">
														    </div>
														</c:forEach>	
														<div class="newContainer"></div>
														<!-- <button id="addInput" class="btn" type="button">+</button> -->					
													<br>
													<br>
													<button type="submit" class="btn btn-primary" id="ok" style="float: right;">완료</button>
												</div>																																							
											</form>
											
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
	    $('#ok').on("click", function() {
	        let deptNo = $("#no").val();
	        let deptName = $('#name').val();
	        let parentNo = $("#parentNoAdd").val();
	
	        let positions = [];
	        $('.addContainer').each(function() {
	            let positionNo = $(this).find('.positionNohidden').val();
	            let positionName = $(this).find('input[name="positionName"]').val();
	            let deptNo = $('#no').val();
	            positions.push({positionNo, positionName, deptNo});
	        });
	
	        let data = {
	            deptNo: deptNo,
	            deptName: deptName,
	            parentNo: parentNo,
	            positions: positions
	        };
	
	        $.ajax({
	            type: "POST",
	            url: "/dept/deptUpdate",
	            contentType: "application/json",
	            data: JSON.stringify(data),
	            success: function(response) {
	            	console.log(data);
	                alert("데이터가 성공적으로 업데이트되었습니다.");
	                location.href="./deptList";
	            },
	            error: function(error) {
	                alert("데이터 업데이트 중 오류가 발생했습니다.");
	            }
	        });
	    });
	</script>
			
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('#addInput').click(function () {
	            $('.newContainer').html('');
	
	            $('.newContainer').append(
	                '<div class="positionItem">' +
	                '<input type="text" class="form-control positionName" name="positionName" id="position${position.positionNo}"> ' +
	                '<input type="button" class="btn btnRemove" value="X" style="width: 5%; float: right;">' +
	                '</div>'
	            );
	        });
	
	        $('.newContainer').on('click', '.btnRemove', function () {
	            $(this).parent().remove();
	        });
	        
	        $('.addContainer').on('click', '.btnRemove', function () {
	            $(this).parent().remove(); 
	        });
	    });
	</script>

</body>
</html>
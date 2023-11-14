<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
					
					<form>
					<h3>사원 목록</h3>
					<div class="card shadow mb-4">
								
							<!-- Content -->
							
							<table class="table" style="text-align: center; width:auto; margin: 20px; ">
								<thead style="height: 70px;">
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>부서</th>
										<th>직급</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>입사일</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody style="height: 35px;">
							<c:forEach items="${list}" var="vo">
									<tr>
										<td><a href="./empDetail?username=${vo.username}" style="color: #697a8d;">${vo.username}</a></td>
										<td><a href="./empDetail?username=${vo.username}" style="color: #697a8d;">${vo.empName}</a></td>
										<td>${vo.deptName}</td>
										<td>${vo.positionName}</td>
										<td>${vo.email}</td>
										<td>${vo.phone}</td>
										<td>${vo.hireDate}</td>
										<td>${vo.state}</td>
									</tr>
							</c:forEach>
								</tbody>
							
							</table>
							<div class="d-flex justify-content-between mb-3">
						<div>
							<!-- 검색 -->
							<div class="input-group mb-3">
								<form action="./empList" method="get" class="d-flex align-items-center" id="frm">
									<div class="input-group" style="width: 120px;">
										<input type="hidden" value="${pager.page}" id="page" name="page">
										<select name="kind" id="k" class="form-select"
											data-kind="${pager.kind}" aria-label="Default select example" style="width: 50px; margin-left: 20px; border-radius: 5px;">
											<option class="kind" value="empName">이름</option>
											<option class="kind" value="username">사원번호</option>
											<option class="kind" value="state">상태</option>
										</select>
									</div> 
									<input class="form-control me-2" type="text" name="search" value="${pager.search}" style="border-radius: 5px; margin-left: 7px; width: 150px;"> 
									<button class="btn" type="submit" style="border-radius: 5px; border-color: #d9dee3;"><img alt="" src="/resources/images/searchIcon.svg"></button>
								</form>
							</div>
						</div>
    					<div style="margin-right: 300px;">
    						<!-- 페이징 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pager.pre}">
									<li class="page-item ${pager.pre?'':'disabled'}"><a
										class="page-link"
										href="./empList?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="page-item"><a class="page-link"
											href="./empList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:if test="${pager.next}">
										<li class="page-item"><a class="page-link"
											href="./empList?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
    					</div>
    					<div>
							<!-- <a href="/emp/empAdd" class="btn btn-secondary">신규직원 등록</a> -->  
							<c:if test="${user.positionNo == 1}">
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-right: 20px;">추가</button>  						
							</c:if>
    					</div>
					</div>
							
						</div>
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">사원 등록</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">

					         <%-- <form action="empAdd" method="post" enctype="multipart/form-data" id="empForm"> --%>
					          <form:form modelAttribute="addVO" action="/emp/empList/empAdd" method="POST">
								<input type="hidden" class="form-control" name="username" id="username">
								<input type="hidden" class="form-control" name="password" id="password">
								   <div class="form-group">
							            <label for="empName">이름</label>
							            <input type="text" class="form-control" id="empName" name="empName" placeholder="ex) 홍길동">
							            <form:errors path="empName" cssStyle="color: red; font-size: 12px;"/>
							        </div>
							        <br>
								   <div class="form-group">
							            <label for="email">이메일</label>
							            <input type="email" class="form-control" id="email" name="email" placeholder="ex) example@gmail.com">
							            <input type="button" class="form-control" id="emailCheck" value="이메일 중복확인" style="background-color: rgb(255,239,222); margin-top: 5px;" onclick='btnActive()'>
							            <form:errors path="email" cssStyle="color: red; font-size: 12px;"/>
							        </div>
							        <br>
								   <div class="form-group">
							            <label for="phone">연락처</label>
							            <input type="text" class="form-control" id="phone" name="phone" placeholder="ex) 01012345678">
							            <form:errors path="phone" cssStyle="color: red; font-size: 12px;"/>
							        </div>
							        <br>
								   <div class="form-group">
							            <label for="birth">생년월일</label>
							            <input type="date" class="form-control" id="birth" name="birth" placeholder="ex) 1900-01-01">
							            <form:errors path="birth" cssStyle="color: red; font-size: 12px;"/>
							        </div>							        							        							        
									</form:form>
								<%-- </form> --%>
				          	<br>
							      <div class="modal-footer">
							        <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button class="btn btn-primary" id="addBtn" disabled="disabled">추가</button>
							      </div>
								</div>
							  </div>
							</div>
						</div>
						<!-- </form> -->
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
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
	
	<script type="text/javascript">
	
	$('#addBtn').on("click", function(){
		let empName = $("#empName").val();
		let email = $("#email").val();
		let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		let phone = $("#phone").val();
		let birth = $("#birth").val();
		let username = $("#username").val();
		
		let data = {username:username, empName:empName, email:email, phone:phone, birth:birth};
		
		if(empName == ""){
	        alert("이름은 필수입력사항입니다."); 
	        /* empName.focus(); */
	        return;
	    }
	    if(email == ""){
	        alert("이메일은 필수입력사항입니다."); 
	        email.focus(); 
	        return;
	    }
		if (!emailRegex.test(email)) {
		    alert("이메일 형식이 올바르지 않습니다.");
		    return;
		}
		
	    if(phone == ""){
	        alert("연락처는 필수입력사항입니다.");
	        phone.focus();
	        return;
	    }
	    if(birth == ""){
	        alert("생일은 필수입력사항입니다."); 
	        birth.focus();
	        return;
	    }

	    
	    $.ajax({
			url:"/emp/empList/empAdd",
            data: data,
			method:"post",	
			success : function(){
				console.log(data);
				alert("등록이 완료되었습니다.");
				location.href="/emp/empList";
			},
			error : function(data){
				console.log(data);
				alert("관리자에게 문의해주세요.");
			}
		});
	 
	   /*  $.ajax({
	        url: "/emp/sendMailAdd", 
	        type: "POST",
	        data: {email: $("#email").val(), username: $("#username").val(), phone : $("#phone").val()},  
	        success: function () {
	            alert("인증메일 발송완료"); 
	            console.log(data);
	        },
	        error: function () {
	            console.log("문제있음"); 
	        }
	    });  */ 
	    
		
	});
	</script>

	<script type="text/javascript">
	$('#emailCheck').on("click", function () {
		let target = document.getElementById('addBtn');
	    let email = $("#email").val();

	    
	    if (email === "") {
	        alert("이메일을 입력해주세요.");
	        email.focus();
	        return;
	    }	

	    
	     $.ajax({
		        url: "/emp/findEmail",
		        type: "POST",
		        data: {email: email},
		        success: function (data) {
		            if (data === "success") {	        	    
		                alert("사용할 수 없는 이메일입니다.");
		                target.disabled = true;
		                email.focus();
						return;
		            } else {
		                alert("사용가능한 이메일입니다.");
		                $("#email").prop("readonly", true);
		                target.disabled = false;
		            }
		        },
		        error: function () {
		        	alert("오류발생");
		        }
		    });
	 
	     
	});
	</script>

</body>
</html>
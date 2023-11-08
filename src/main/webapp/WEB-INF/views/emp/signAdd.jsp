<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
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
<body id="">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	    	<!-- sidebar -->
	    	<%-- <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import> --%>
	    	<sec:authentication property="Principal" var="user"/>
	    	<div id="content-wrapper" class="d-flex flex-column">
	    		<div id="content">
	    		
	    		<%-- <c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import> --%>
	    		
		    		<div class="container-fluid">
		    				<!-- Content -->

						    <div class="container-xxl">
						      <div class="authentication-wrapper authentication-basic container-p-y">
						        <div class="authentication-inner">
						          <!-- Register -->
						          <div class="card" style="width: 800px; align-items: center; margin: auto; margin-top: 60px;">
						            <div class="card-body">

										<div>
										
								         <form action="./signAdd" method="post" enctype="multipart/form-data" id="signAdd">
								         	<!-- <input type="hidden" class="form-control" name="username" id="username"> -->
												<table style="margin: auto;">
													<tr>
														<td>사원번호</td>
														<td><input type="text" class="form-control" name="username" id="username" value="${user.username}" readonly="readonly"></td>
													</tr>
													<tr>
														<td>별칭</td>
														<td><input type="text" class="form-control" name="signName" id="signName" placeholder="별칭을 입력해주세요."></td>
													</tr>
													<tr>
														<td>파일</td>
														<td><input type="file" class="form-control" name="files" id="files"></td>
													</tr>
																						
												</table>
												<br>
												<a class="btn btn-primary" href="../emp/mypage?username=${user.username}">이전</a>
												<button class="btn btn-primary" id="addBtn">등록</button>
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
	    		<%-- <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import> --%>
	    	</div>
	    </div> 
	    
	<script type="text/javascript">
	
	$('#addBtn').on("click", function(){
		let username = $("#username").val();
		let signName = $("#signName").val();
		let files = $("#files").val();
		
		if(signName == ""){
	        alert("파일이름은 필수입력사항입니다.");
	        signName.focus();
	        return;
	    }
	    if(files == ""){
	        alert("파일을 업로드해주세요.");
	        return;
	    }
	 
		
	});
	</script>
	     
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
</body>
</html>
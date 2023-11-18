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
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
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
					<div class="card shadow mb-4" style="align-items: center;">
						<div style="width:65%; margin-bottom: 30px; margin-top: 30px;">
							<input type="hidden" name="noticeNo" value="${vo.noticeNo}">
							<table class="table">						
							    <tr>
							        <th style="width:10%;">Title</th>
							        <td style="width:85%; text-align: center; font-size: 15px;">${vo.title}</td>
							    </tr>
							    <tr>
							        <th style="width:10%;">Writer</th>
							        <td style="width:85%; text-align: center; font-size: 15px;">${vo.empName}</td>
							    </tr>
							    <tr>
							        <th style="width:10%;">Date</th>
							        <td style="width:85%; text-align: center; font-size: 15px;">${vo.createDate}</td>
							    </tr>
							    <tr>
							        <th style="width:10%;">Hit</th>
							        <td style="width:85%; text-align: center; font-size: 15px;">${vo.hit+1}</td>
							    </tr>
						 		  <tr>
							        <th >Files</th>
									<td style="text-align: center;"> <c:forEach items="${vo.fileVO}" var="f">
									 	<input type="hidden" name="fileNo" value="${f.fileNo}">
										<a href="./fileDown?fileNo=${f.fileNo}" class="btn" style="font-size: 12px;">${f.originalName}</a><br>
									</c:forEach></td>
							    </tr>
							</table>
							<div class="mb-3">
								<label for="contents" class="form-label"></label>
								 <div class="card-text">${vo.contents}</div>
							 </div>	
						 					 
						</div>
					</div>
						<a class="btn btn-primary" href="./noticeUpdate?noticeNo=${vo.noticeNo}">수정</a>
						<a class="btn btn-danger" href="./noticeDelete?noticeNo=${vo.noticeNo}">삭제</a>    		
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
</div>	
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
	<script type="text/javascript">

	</script>
</body>
</html>
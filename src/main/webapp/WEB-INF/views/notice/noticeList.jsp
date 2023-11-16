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
					<h3>공지사항</h3>
					<div class="card shadow mb-4">
								
							<!-- Content -->
							
							<table class="table" style="text-align: center; width:auto; margin: 20px; ">
								<thead style="height: 70px;">
									<tr>
										<th style="width: 10%;">번호</th>
										<th style="width: 60%;">제목</th>
										<th style="width: 10%">작성자</th>
										<th style="width: 12%">작성일</th>
										<th style="width: 8%">조회수</th>
								</thead>
								<tbody style="height: 35px;">
							<c:forEach items="${list}" var="vo">
									<tr>
										<td><a href="./noticeDetail?noticeNo=${vo.noticeNo}" style="color: #697a8d;">${vo.noticeNo}</a></td>
										<td><a href="./noticeDetail?noticeNo=${vo.noticeNo}" style="color: #697a8d;">${vo.title}</a></td>
										<td>${vo.empName}</td>
										<td>${vo.createDate}</td>
										<td>${vo.hit}</td>
									</tr>
							</c:forEach>
								</tbody>

							</table>
						<div class="d-flex justify-content-between mb-3">
						<div>
							<!-- 검색 -->
							<div class="input-group mb-3">
								<form action="./noticeList" method="get" class="d-flex align-items-center" id="frm">
									<div class="input-group" style="width: 120px;">
										<input type="hidden" value="${pager.page}" id="page" name="page">
										<select name="kind" id="k" class="form-select"
											data-kind="${pager.kind}" aria-label="Default select example" style="width: 50px; margin-left: 20px; border-radius: 5px;">
											<option class="kind" value="title">제목</option>
											<option class="kind" value="contents">내용</option>
										</select>
									</div> 
									<input class="form-control me-2" type="text" name="search" value="${pager.search}" style="border-radius: 5px; margin-left: 7px; width: 150px;"> 
									<button class="btn" type="submit" style="border-radius: 5px; border-color: #d9dee3;"><img alt="" src="/resources/images/searchIcon.svg"></button>
								</form>
							</div>
						</div>
    					<div style="margin-right: 680px;">
    						<!-- 페이징 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pager.pre}">
									<li class="page-item ${pager.pre?'':'disabled'}"><a
										class="page-link"
										href="./noticeList?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="page-item"><a class="page-link"
											href="./noticeList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:if test="${pager.next}">
										<li class="page-item"><a class="page-link"
											href="./noticeList?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
    					</div>
					</div>													
				</div>
							<a href="./noticeAdd" class="btn btn-primary" style="float: right;">등록</a>	

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


</body>
</html>
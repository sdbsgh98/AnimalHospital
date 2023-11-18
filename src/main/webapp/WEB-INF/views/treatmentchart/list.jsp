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
<title>진료차트목록페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page" style="align-items:center;">
				<sec:authentication property="Principal" var="user"/>
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h3>진료차트목록</h3>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">			
								<!-- Content -->
									<table class="table table-bordered text-center"  style="text-align: center; width: 100%;">
										<thead>
											<tr>
												<th>No</th>
												<th>병명</th>
												<!-- <th>수술예약번호</th> -->
												<th>진료날짜</th>
											</tr>
										</thead>
										
										<c:forEach items="${list}" var="vo" varStatus="i">
											<tbody style="height: 35px;">
												<tr>
													<td>${i.index + 1}</td>
													<td><a href="./detail?chartNo=${vo.chartNo}&customerNo=${vo.customerNo}&username=${user.username}">${vo.disease}</a></td>
													<!-- <td></td> -->
													<td>${vo.date}</td>
												</tr>
											</tbody>
										</c:forEach>
										
									</table>
									
									<br>
							
									<div class="container text-center">
										<div class="row row-cols-3">
											<div class="col">
											<a href="javascript:window.history.back();" class="btn btn-primary" style="width: 150px; height: 40px; color: white; margin-right: 250px;">뒤로가기</a>
												<%-- <!-- 검색 -->
												<div class="input-group mb-3">
													<form action="./list" method="get" class="d-flex align-items-center" id="frm">
														<div class="input-group" style="width: 120px;">
															<input type="hidden" value="${pager.page}" id="page" name="page">
															<select name="kind" id="k" class="form-select"
																data-kind="${pager.kind}" aria-label="Default select example" style="width: 50px;">
																<option class="kind" value="name">이름</option>
															</select>
														</div> 
														<input type="text" name="search" value="${pager.search}"
															class="form-control" aria-label="Amount (to the nearest dollar)" style="width: 150px;">
															<button type="submit" class="btn btn-primary" style="width:100px;">검색</button>
													</form>
												</div> --%>
											</div>
											<div class="col">
												<!-- 페이징 -->
												<nav aria-label="Page navigation example">
													<ul class="pagination justify-content-center">
														<%-- <c:if test="${pager.pre}"> --%>
														<li class="page-item ${pager.pre?'':'disabled'}"><a
															class="page-link"
															href="./list?customerNo=${vo.customerNo}&page=${pager.startNum - 1}"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
														<%-- </c:if> --%>
														<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
															var="i">
															<li class="page-item"><a class="page-link"
																href="./list?customerNo=${vo.customerNo}&page=${i}">${i}</a></li>
														</c:forEach>
														<%-- <c:if test="${pager.next}"> --%>
															<li class="page-item ${pager.next?'':'disabled'}"><a class="page-link"
																href="./list?customerNo=${vo.customerNo}&page=${pager.lastNum + 1}"
																aria-label="Next"> <span aria-hidden="true">&raquo;</span>
															</a></li>
														<%-- </c:if> --%>
													</ul>
												</nav>
											</div>
											<div class="col">
												<a href="./add?customerNo=${vo.customerNo}&username=${user.username}" class="btn btn-primary" style="width: 150px; height: 40px; color: white; margin-left: 250px;">진료차트작성</a>
											</div>
										</div>
									</div>	
								</div>
							</div>
						</div>
					<!-- Content wrapper -->
					</div>
					<!-- Content wrapper -->
				</div>
			<!-- / Layout page -->
			</div>
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>

<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- jsTree Theme -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<!-- jsTree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

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
					<div class="container-xxl flex-grow-1 container-p-y">
					<h3>조직도 / 사원 목록</h3>
					<form>
					<div class="card shadow mb-4" style="width: 20%; float: left; height: 400px;">	
					<div>
					</div>
						<div id="jstree">
						    <ul>
						        <c:forEach items="${list}" var="vo">
						            <c:if test="${vo.deptNo == 0}">
						                <li id="rootNode${vo.deptNo}">
						                	<span>${vo.deptName}</span>
						                    <ul>
						                        <c:forEach items="${list}" var="childVo">
						                            <c:if test="${childVo.parentNo == vo.deptNo}">
						                                <li id="childNode${childVo.deptNo}">
						                                	<span>
						                                		${childVo.deptName}
						                                	</span>					                                    					                                    
						                                    <ul>
						                                        <c:forEach items="${list}" var="child2">
						                                            <c:if test="${child2.parentNo == childVo.deptNo}">
						                                                <li id="child2Node${child2.deptNo}">
						                                                	<span>${child2.deptName}</span>
						                                                </li>
						                                            </c:if>
						                                        </c:forEach>
						                                    </ul>
						                                </li>
						                            </c:if>
						                        </c:forEach>
						                    </ul>
						                </li>
						            </c:if>
						        </c:forEach>
						    </ul>
						</div>
					</div>
					<div class="card shadow mb-4" style="width: 78%; float: right; height: 400px;">
							<c:forEach items="${dept}" var="dept">
								<table class="table" id="deptNoList">
									<tr>
										<td>부서번호</td>
										<td>
											${dept.deptNo}
										</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>
											${dept.deptName}
										</td>
									</tr>
									<tr>
									<tr>
									    <td>상위부서 번호</td>
									    <td>
											${dept.parentNo}
									    </td>
									</tr>
									<tr>
									    <td>직급</td>
									    <td>
											${dept.positionName}
									    </td>
									</tr>
							</table>
						</c:forEach>								
					</div>
					
						<div class="card shadow mb-4" style="width:100%; height: 400px;">
						
							<table class="table" style="text-align: center;">
								<thead style="height: 70px;">
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>부서</th>
										<th>직급</th>
										<th>입사일</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody style="height: 35px;">
							<c:forEach items="${emp}" var="vo">
									<tr>
										<td><a href="/emp/empDetail?username=${vo.username}" style="color: #697a8d;">${vo.username}</a></td>
										<td><a href="/emp/empDetail?username=${vo.username}" style="color: #697a8d;">${vo.empName}</a></td>
										<td>${vo.deptName}</td>
										<td>${vo.positionName}</td>
										<td>${vo.hireDate}</td>
										<td>${vo.state}</td>
									</tr>
							</c:forEach>
								</tbody>
							
							</table>
						

						<div class="d-flex justify-content-between mb-3" style="margin-top: 20px;">
						<div>
							<!-- 검색 -->
							<div class="input-group mb-3">
								<form action="./deptList" method="get" class="d-flex align-items-center" id="frm">
									<div class="input-group" style="width: 120px;">
										<input type="hidden" value="${pager.page}" id="page" name="page">
										<select name="kind" id="k" class="form-select"
											data-kind="${pager.kind}" aria-label="Default select example" style="width: 50px;">
											<option class="kind" value="empName">이름</option>
											<option class="kind" value="deptName">부서</option>
											<option class="kind" value="positionName">직급</option>
										</select>
									</div> 
									<input type="text" name="search" value="${pager.search}"
										class="form-control" aria-label="Amount (to the nearest dollar)" style="width: 150px;">
										<button type="submit" class="btn btn-primary" style="width:100px;">검색</button>
								</form>
							</div>
						</div>
    					<div>
    						<!-- 페이징 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pager.pre}">
									<li class="page-item ${pager.pre?'':'disabled'}"><a
										class="page-link"
										href="./deptList?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="page-item"><a class="page-link"
											href="./deptList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:if test="${pager.next}">
										<li class="page-item"><a class="page-link"
											href="./deptList?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
    					</div>
    					<div> 						
    					</div>
					</div>
							
						</div>
						
						</form>
					</div>

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
	<%-- <c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import> --%>

	<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
	<!-- Vendors JS -->
	<script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<!-- Page JS -->
	<script src="${pageContext.request.contextPath}/assets/js/dashboards-analytics.js"></script>
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>



    <script>
        $(document).ready(function () {
            $('#jstree').jstree();       
            $("#jstree").jstree("open_all");
            $('#jstree').on("changed.jstree", function (e, data) {
                console.log(data.selected);
            });
            
        });
    </script>

</body>
</html>
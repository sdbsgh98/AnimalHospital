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

<meta charset="UTF-8">
<title>기안함</title>

<style type="text/css">
    .form-group {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .input-group {
        display: flex;
        align-items: center;
    }

    .form-control {
        margin-right: 10px;
    }
</style>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
			
			<sec:authentication property="Principal" var="user"/>
			
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">				
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<!-- DataTales Example -->
						
<!-- Existing card -->
<div class="card shadow mb-4">
    <div class="card-body">
        <!-- ... Existing content ... -->

        <!-- New row for small square cards -->
        <div class="row mt-4">
            <!-- First small square card -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <!-- Content of the first small card -->
                        Card 1
                    </div>
                </div>
            </div>

            <!-- Second small square card -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <!-- Content of the second small card -->
                        Card 2
                    </div>
                </div>
            </div>

            <!-- Third small square card -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <!-- Content of the third small card -->
                        Card 3
                    </div>
                </div>
            </div>

            <!-- Fourth small square card -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <!-- Content of the fourth small card -->
                        Card 4
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Existing card -->
<div class="card shadow mb-4">
    <div class="card-body" style="height:100px;">
        <!-- ... Existing content ... -->

        <!-- New row for small square cards -->
        <div class="row mt-2">
			<div>
				<!-- 검색 -->
				<div class="input-group">
					<form onsubmit="return validateForm()" action="../draftList/${user.username}" method="get" id="frm">
							
								<!-- Date Range Search -->
						<div class="form-group">
		                <label for="startDate">기간설정&nbsp;</label>
		                <input type="date" id="startDate" name="startDate" class="form-control" style="width: 200px;">
		                <label for="endDate">&nbsp;&nbsp;~&nbsp;&nbsp;</label>
		                <input type="date" id="endDate" name="endDate" class="form-control" style="width: 200px;">
						</div>
						
						
						<div class="form-group">
							<div class="input-group">
								<input type="hidden" value="${pager.page}" id="page" name="page">
								<select name="kind" id="k" class="form-select"
									data-kind="${pager.kind}" aria-label="Default select example" style="width:120px;">
									<option class="kind" value="apTitle">제목</option>
									<option class="kind" value="apContents">내용</option>
									<option class="kind" value="apKind">기안종류</option>
								</select>
							</div> 
							<input type="text" name="search" value="${pager.search}"
								class="form-control" aria-label="Amount (to the nearest dollar)" style="width: 150px;">
	
							<button type="submit" class="btn btn-primary" style="width:100px;">검색</button>
						</div>	
					</form>
				</div>
			</div>
        </div>
    </div>
</div>

	                    <div class="card shadow mb-4">
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>번호</th>
	                                            <th>종류</th>
	                                            <th>제목</th>
	                                            <th>작성자</th>
	                                            <th>부서</th>
	                                            <th>기안일</th>
	                                            <th>상태</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach items="${list}" var="ap" varStatus="i">
	                                    	
	                                    		<input type="hidden" name="apNo" id="apNo" value="${ap.apNo}">
	                                    		<input type="hidden" name="username" id="username" value="${user.username}">
	                                    		
		                                        <tr>
		                                        	<td>${i.index + 1}</td>
		                                        	<td>${ap.apKind}</td>
		                                            <td><a href="/approval/detail?apNo=${ap.apNo}">${ap.apTitle}</a></td>
		                                            <td>${ap.empName}</td>
		                                            <td>${ap.deptName}</td>
		                                            <td>${ap.apCDate}</td>
		                                            <c:choose>
			                                            <c:when test="${ap.apState eq '반려'}">
			                                            	<td>${ap.apState}</td>
			                                            </c:when>
			                                            <c:otherwise>
			                                            	<td>${ap.apState}</td>
			                                            </c:otherwise>
		                                            </c:choose>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>  
				    			</div>
				    			

						        <!-- 전체 페이지 수 -->
						        <input type="hidden" name="totalPage" id="totalPage" value="${pager.totalPage}">
						        
								<div class="d-flex justify-content-between mb-3">

		    					<div>
		    					

		    						<!-- 페이징 -->
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<c:if test="${pager.pre}">
											<li class="page-item ${pager.pre?'':'disabled'}"><a
												class="page-link"
												href="/approval/draftList/${user.username}?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
											</c:if>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
												var="i">
												<li class="page-item"><a class="page-link"
													href="/approval/draftList/${user.username}?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
											</c:forEach>
											<c:if test="${pager.next}">
												<li class="page-item"><a class="page-link"
													href="/approval/draftList/${user.username}?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:if>
										</ul>
									</nav>
		    					</div>
							</div>
						        
						        
	    					</div>
	    				</div>
					</div>
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
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

	<script>
		function validateForm() {
		    var startDate = document.getElementById("startDate").value;
		    var endDate = document.getElementById("endDate").value;
		

		    if (startDate === "") {
		        document.getElementById("startDate").removeAttribute("name");
		    }
		
		    if (endDate === "") {
		        document.getElementById("endDate").removeAttribute("name");
		    }
		
		    return true;
		}
	</script>	
	
</body>
</html>
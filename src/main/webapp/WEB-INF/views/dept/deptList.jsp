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
					<div class="card shadow mb-4" style="width: 20%; float: left; height: 650px;">	
					<div>
						<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 30px;">+</button>
						<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#updateModal" style="width: 100px; margin-right: 20px;">수정</button>
					</div>
						<div id="jstree">
						    <ul>
						        <c:forEach items="${list}" var="vo">
						            <c:if test="${vo.deptNo == 0}">
						                <li id="rootNode${vo.deptNo}">
						                	<span onclick="deptList(1)">${vo.deptName}</span>
						                    <ul>
						                        <c:forEach items="${list}" var="childVo">
						                            <c:if test="${childVo.parentNo == vo.deptNo}">
						                                <li id="childNode${childVo.deptNo}">
						                                	<span onclick="deptList(2)">
						                                		${childVo.deptName}
						                                	</span>					                                    					                                    
						                                    <ul>
						                                        <c:forEach items="${list}" var="child2">
						                                            <c:if test="${child2.parentNo == childVo.deptNo}">
						                                                <li id="child2Node${child2.deptNo}">
						                                                	<span onclick="deptList(3)">${child2.deptName}</span>
						                                                    <ul>
						                                                        <%-- <c:forEach items="${posi}" var="posi">
						                                                            <c:if test="${posi.deptNo == childVo.deptNo}">
						                                                                <li>
						                                                                	<span>${posi.positionName}</span>
						                                                                </li>
						                                                            </c:if>
						                                                        </c:forEach> --%>				                                                        
						                                                    </ul>
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
					<!-- 부서등록 modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">부서 등록</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">

					        <input type="hidden" id="deptNoAdd" name="deptNo">
					          <div class="mb-3">
					            <label for="deptName" class="col-form-label">부서명:</label>
					            <input type="text" class="form-control" id="deptNameAdd" name="deptName">
					          </div>
					          <div class="mb-3">
					            <label for="parentNo" class="col-form-label">상위부서:</label>
									<select class="form-control" name='parentNo' id="parentNoAdd" style="height: 35px;">										
											<c:forEach items="${dept}" var="dept">
												<option value="${dept.deptNo}">${dept.deptName}</option>
											</c:forEach>
											<option value=0>없음</option>
									</select>
					          </div>
					          
							      <div class="modal-footer">
							        <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button class="btn btn-primary" id="addBtn">추가</button>
							      </div>

					      </div>
					    </div>
					  </div>
					</div>
					<!-- 부서수정 modal -->
					<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h1 class="modal-title fs-5" id="exampleModalLabel">부서 수정</h1>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body">

					                <div id="jstree2">
					                    <ul>
					                        <c:forEach items="${list}" var="vo">
					                            <c:if test="${vo.deptNo == 0}">
					                                <li id="rootNode${vo.deptNo}">
					                                    <input type="text" id="deptNo" value="${vo.deptNo}" style="border: none; width: 30px;"/>
					                                    <input type="text" id="parentNo" value="${vo.parentNo}" style="border: none; width: 30px;"/>
					                                    <input type="text" id="deptName" value="${vo.deptName}" style="border: none; width: 100px;"/>
					                                    <ul>
					                                        <c:forEach items="${list}" var="childVo">
					                                            <c:if test="${childVo.parentNo == vo.deptNo}">
					                                                <li id="childNode${childVo.deptNo}">
					                                                    <input type="text" id="deptNo" value="${childVo.deptNo}" style="border: none; width: 35px;"/>
					                                                    <input type="text" id="parentNo" value="${childVo.parentNo}" style="border: none; width: 35px;"/>
					                                                    <input type="text" id="deptName" value="${childVo.deptName}" style="border: none; width: 100px;"/>
					                                                    <ul>
					                                                        <c:forEach items="${list}" var="child2">
					                                                            <c:if test="${child2.parentNo == childVo.deptNo}">
					                                                                <li id="child2Node${child2.deptNo}">
					                                                                    <input type="text" id="deptNo" value="${child2.deptNo}" style="border: none; width: 50px;"/>
					                                                                    <input type="text" id="parentNo" value="${child2.parentNo}" style="border: none; width: 50px;"/>
					                                                                    <input type="text" id="deptName" value="${child2.deptName}" style="border: none; width: 100px;"/>
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
					
					                <div class="modal-footer">
					                    <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					                    <button class="btn btn-primary" id="updateBtn">수정</button>
					                    <button class="btn btn-primary" id="delBtn">삭제</button>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					<div class="card shadow mb-4" style="width:78%; float: right; height: 650px;">			
							<!-- Content -->
							
							<table class="table" style="text-align: center; width:auto; margin: 20px;">
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
						<div class="d-flex justify-content-between mb-3">
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

	<script type="text/javascript">
	$('#addBtn').on("click", function(){

		let deptName = $("#deptNameAdd").val();
		let parentNo = $("#parentNoAdd").val();

	
		let data = {deptName:deptName, parentNo:parentNo};
		
	    if(deptName == ""){
	        alert("부서이름을 입력해주세요.");
	        deptName.focus();
	        return;
	    }

		$.ajax({
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
		})

	});
	</script>
	
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('#updateBtn').on("click", function () {
	            let deptNo0 = $("#deptNo0").val();
	            let deptName0 = $("#deptName0").val();
	            let parentNo0 = $("#parentNo0").val();
	            let deptNo1 = $("#deptNo1").val();
	            let deptName1 = $("#deptName1").val();
	            let parentNo1 = $("#parentNo1").val();
	            let deptNo2 = $("#deptNo2").val();
	            let deptName2 = $("#deptName2").val();
	            let parentNo2 = $("#parentNo2").val();
	
	            let data = {
	                deptNo0: deptNo0,
	                deptName0: deptName0,
	                parentNo0: parentNo0,
	                deptNo1: deptNo1,
	                deptName1: deptName1,
	                parentNo1: parentNo1,
	                deptNo2: deptNo2,
	                deptName2: deptName2,
	                parentNo2: parentNo2
	            };
	
	            $.ajax({
	                url: "/dept/deptList/deptUpdate",
	                data: data,
	                method: "post",
	                success: function () {
	                    console.log(data);
	                    alert("수정이 완료되었습니다!");
	                    location.href = "/dept/deptList";
	                },
	                error: function (data) {
	                    console.log(data);
	                    alert("관리자에게 문의해주세요.");
	                }
	            });
	        });
	    });
	</script>	
		<script type="text/javascript">
	    $(document).ready(function () {
	        $('#delBtn').on("click", function () {
	        	$("#jstree").jstree().delete_node( $("#"+ nodeId) );
	        	let data = $("#deptNo").val();
	    		$.ajax({
	    			url:"/dept/deptList/deptDelete",
	                data: data,
	    			method:"post",												
	    			success : function(){
	    				console.log(data);
	    				alert("삭제 완료");
	    				location.href="/dept/deptList";		
	    			},
	    			error : function(data){
	    				console.log(data);
	    				alert("관리자에게 문의해주세요.");
	    			}
	    		})
	        });
	    });
	</script>
    <script>
        $(document).ready(function () {
            $('#jstree').jstree();       
            $("#jstree").jstree("open_all");
            $('#jstree').on("changed.jstree", function (e, data) {
                console.log(data.selected);
            });
            
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#jstree2').jstree({
            	'core':{
            		'check_callback': true
            	},
	                'checkbox' : {
	                	'keep_selected_Style' : false,
	                	'three_state': false
	                },
	                'plugins' : ['checkbox']
            });
            $("#jstree2").jstree("open_all");
            $('#jstree2').on("changed.jstree2", function (e, data) {
            	
                console.log(data.selected);
            });
            
        });
    </script>
</body>
</html>
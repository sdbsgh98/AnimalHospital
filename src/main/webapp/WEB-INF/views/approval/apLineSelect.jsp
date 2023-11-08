<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 날짜포맷 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<!-- jsTree Theme -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<!-- jQuery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<!-- jsTree -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">결재선 설정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">

		<div class="card shadow mb-4" style="width: 250px; float: left; height: 450px;">
		<input type="hidden" id="deptNo" name="deptNo">

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
																<span id="${child2.deptName}">${child2.deptName}</span>
																<ul><%-- 
																	<c:forEach items="${posi}" var="posi">
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


	      <div class="modal-footer">
	        <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button class="btn btn-primary" id="addApLineBtn">추가</button>
	      </div>

		      </div>
		    </div>
		  </div>
		</div>
      </div>
    </div>
  </div>



<!-- / Layout wrapper -->
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
	        }) 
	        $("#jstree2").jstree("open_all");
	       	$('#jstree2').on("changed.jstree2", function (e, data) {
	        	
	            console.log(data.selected);
	        });
	    });
	</script>

	<script type="text/javascript">
	
    /* $('#jstree').on("changed.jstree", function (e, data) {
        console.log(data.selected);
        
        let deptName
        
		$.ajax({
			  type: 'POST',
			  url: path + '/approval/changeDep.do',
			  data: { deptName: value },
			  success: function(data) {
			    $("#people-box").empty(); // #people-box 밑에 자식요소들 모두삭제
			    for (let i = 0; i < data.length; i++) {
			      var a = [data[i].memberId, data[i].memberName, data[i].job.jobName, data[i].dept.deptName];
			      if (memberId !== data[i].memberId) {
			        $("#people-box").append($('<input/>', { type: 'checkbox', name: 'peopleBox', value: a, width: '30px' }));
			        $("#people-box").append($('<img/>', { src: path + '/resources/images/approve/circle_people.png', width: '20px', height: '20px' }));
			        $("#people-box").append(data[i].memberId, '&nbsp;', data[i].memberName, '&nbsp;', data[i].job.jobName, '&nbsp;', data[i].dept.deptName, '<br>');
			      }
			    }
			  },
			  error: function(xhr, status, error) {
			    // 에러 처리를 여기에 추가
			    console.error(error);
			  }
			});
    });	 */

	</script>


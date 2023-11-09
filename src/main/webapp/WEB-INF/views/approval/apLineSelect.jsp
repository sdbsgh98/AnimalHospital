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
    <div class="modal-content" style="position:fixed; width:950px; height:500px;">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">결재선 설정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">

		<div class="card shadow mb-4" style="width: 250px; float: left; height:300px;">
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
		</div>
		
		<div class="card shadow mb-4" style="width: 250px; float: left; height:300px; margin-left: 40px;">
			<div id="empList">
				
			</div> 
		
		</div>
		
		<div class="card shadow mb-4" style="width: 250px; float: left; height:300px; margin-left: 40px;">
			<div id="appList">
				
			</div> 
		</div>
		
		    </div>
	      <div class="modal-footer">
	        <!-- <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
	        <button class="btn btn-primary" id="addApLineBtn">결재선 등록</button>
	      </div>
		  </div>
		</div>
      </div>
    </div>
  </div>


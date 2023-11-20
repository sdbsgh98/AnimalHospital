<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<!DOCTYPE html>
				<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
					data-assets-path="/assets/" data-template="vertical-menu-template-free">

				<head>
					<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
					<link href='/fullcalendar/main.css' rel='stylesheet' />
					<script src='/fullcalendar/main.js'></script>

					<meta charset="UTF-8">
					<title>Insert title here</title>

					<style>
						.fc-button {
							color: #FE9A2E
						}

						.treat {
							background-color: #A9D0F5
						}
						
					  .mainApproveTbl th {
					    white-space: nowrap;
					    overflow: hidden;
					    text-overflow: ellipsis;
					  }
					  
					  .avatar-group {
					    display: flex;
					  }
					
					  .avatar-group li {
					    list-style-type: none;
					  }
					
					  .avatar {
					    overflow: hidden;
					    border-radius: 50%;
					    margin-right: 8px;
					  }
					</style>
				</head>

				<body>
				<sec:authentication property="Principal" var="user"/>
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
					    <p>
						<MARQUEE behavior="scroll" style="font-weight: bold;">${user.empName}님 좋은 하루되세요!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘도 화이팅 o_<  </MARQUEE>
					    </p>

						<div style="display: flex;">
						<input type="hidden" id="username" name="username" value="${user.username}">
						<input type="hidden" id="empName" name="empName" value="${user.empName}">
						<input type="hidden" id="hireDate" name="hireDate" value="${user.hireDate}">

							<div style="width: 70%;">
							    <div class="row">
							        <div class="col-md-6 mb-3">
							            <div class="card text-center">
							                <div class="card-body" style="height: 500px;">
			                                    <c:choose>
			                                        <c:when test="${empty user.originalFileName}">
			                                            <img alt="" src="/resources/images/default.jpeg" class=" rounded-circle" style="width: 200px; height: 200px; margin: 10px;">
			                                        </c:when>
			                                        <c:otherwise>
			                                            <img alt="" src="../files/emp/${user.fileName}"  class=" rounded-circle" style="width: 200px; height: 200px; margin: 10px;">
			                                        </c:otherwise>
			                                    </c:choose>
						                      <p class="card-text">[${user.empName}]님</p>
						                      <p class="card-title" id="deptName">내 부서 : ${user.deptName}</p>
						                      <p class="card-title" id="positionName">내 직급 : ${user.positionName}</p>
						                      <p class="card-title" id="hireDate">내 입사일 : ${user.hireDate}</p>
						                      <a class="btn btn-outline-primary" href="/emp/mypageUpdate?username=${user.username}">내 정보수정하기</a>
							                </div>
						                  </div>
						                </div>
									
							
							        <div class="col-md-5 mb-3" style="justify-content: center;">
							            <div class="card text-center">
							                <div class="card-header mt-3">
							                <span class="badge rounded-pill bg-label-primary text-center" id="date" style="width:130px; font-size:17px;"></span>
							                 <h1 class="mt-4 mb-2" style="font-size:50px;"></h1>
							                </div>
											<c:choose>
												<c:when test="${empty att}">
													<div class="text-center">
													<button type="button" class="btn btn-primary mb-3" onclick="attIn()" style="width:100px;">출근</button><br>
													<button type="button" class="btn btn-outline-primary" onclick="attOut()" style="width:100px;" disabled>퇴근</button>
													</div>
							                    </c:when>
							                    <c:when test="${att.attState eq 1 and att.attOut eq null}">
							                    	<div class="text-center">
													<button type="button" class="btn btn-outline-primary mb-3" onclick="attIn()" style="width:100px;" disabled>출근</button><br>
													<button type="button" class="btn btn-primary" onclick="attOut()" style="width:100px;">퇴근</button>
													</div>
								                </c:when>
								                <c:otherwise>
								                	<div class="text-center">
													<button type="button" class="btn btn-outline-primary mb-3" onclick="attIn()" style="width:100px;" disabled>출근</button><br>
													<button type="button" class="btn btn-outline-primary" onclick="attOut()" style="width:100px;" disabled>퇴근</button>
													</div>
								                </c:otherwise>
						                    </c:choose>
							                <div class="card-body" style="height:177px;">
											<hr class="mb-5">
								              <p class="card-text">[${user.empName}]님의 연차현황</p>
						                      <h3 class="card-title" id="dayoffCount">연차 ${dayoff} 개</h3>
							                </div>
						                    <div class="card-footer text-muted"></div>
						                  </div>
						                </div>
									</div>
								</div>	
								
										


										<div class="card" style="width:45%; margin-left: auto; height: 490px;">

											<div class="card-content">
												<div style="padding:10px">
													<button id="deptcal" class="btn btn-primary">부서출퇴근</button>
													<button id="treatmentcal" class="btn treat">진료일정</button>
													<img src="/resources/images/menu/pet2.png"
														style="width:50px; height:50px; text-align:right">
												</div>
												<div id="calendar" style="padding:30px; height: 400px;">
												</div>

											</div>
										</div>
									</div>

									<sec:authentication property="Principal" var="user" />
									<%-- <sec:authorize access="isAuthenticated()">
										<a href="/emp/logout" class="btn btn-danger" style="">로그아웃</a>
										<a href="/emp/pwUpdate?username=${user.username}" class="btn btn-danger"
											style="">비밀번호 변경</a>
										</sec:authorize>

										<br><br> --%>
										<input type="hidden" id="username" name="username" value="${user.username}">
										<input type="hidden" id="empName" name="empName" value="${user.empName}">
										<input type="hidden" id="hireDate" name="hireDate" value="${user.hireDate}">
										<input type="hidden" id="deptNo" value="${user.deptNo}">

										<br>
										

   									 <div style="display: flex; justify-content:space-between; width:100%;">
										<div class="card" style="width: 50rem;">
											<div class="card-body">
												<div class="row g-3">
													<div class="col-sm-7">
														<h3 style="margin-left: 20px">게시판</h3>
													</div>
													<div class="col-sm">

													</div>
													<div class="col-sm">
														<a href="notice/noticeList" class="btn btn-primary"
															type="button" style="margin-left: 40px;">더보기</a>
													</div>
												</div>
												<!-- <div class="d-grid gap-2 d-md-flex justify-content-md-end">

						  	<a href="notice/noticeList" class="btn btn-primary" type="button" style="margin-right: 20px;">더보기</a>
						  </div> -->
												<table class="table" style="text-align: center;">
													<thead style="height: 60px;">
														<tr>
															<th style="width: 10%;">번호</th>
															<th style="width: 10%;">분류</th>
															<th style="width: 40%;">제목</th>
															<th style="width: 15%">작성자</th>
															<th style="width: 10%">작성일</th>
															<th style="width: 15%">조회수</th>
													</thead>
													<tbody style="height: 35px;">
														<c:forEach items="${list}" var="vo">
															<c:if test="${vo.important eq '일반'}">
																<tr>
																	<td>${vo.noticeNo}</td>
																	<td>${vo.important}</td>
																	<td><a href="notice/noticeDetail?noticeNo=${vo.noticeNo}"
																			style="color: #697a8d;">${vo.title}</a></td>
																	<td>${vo.empName}</td>
																	<td>${vo.createDate}</td>
																	<td>${vo.hit}</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>

												</table>
											</div>
										</div>
									
									<div class="" style="text-align: left;">
									<div class="card" style="width: 550px;">
						                <h5 class="card-header">나의 기안함</h5>
						                <div class="table-responsive text-nowrap">
						                  <table class="table table-hover text-center" id="mainApproveTbl">
						                    <thead>
						                      <tr>
						                        <th>기안서</th>
						                        <th>결재자</th>
						                        <th>결재상태</th>
						                      </tr>
						                    </thead>
						                    <tbody class="table-border-bottom-0 text-center">
						                      <c:forEach items="${md}" var="md">
							                      <tr>
							                        <td><a href="/approval/detail?apNo=${md.apNo}" style="color: #697a8d;"><strong>${md.apTitle}</strong></a></td>
							                        <td>
							                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center" style="justify-content: center;">
							                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="${md.empName}">
							                              <img src="../files/emp/${md.fileName}" alt="Avatar" class="rounded-circle">
							                            </li>
							                            <c:forEach items="${ml}" var="ml">
							                            	<c:if test="${md.apNo eq ml.apNo}">
									                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="${ml.empName}">
									                              <img src="../files/emp/${ml.fileName}" alt="Avatar" class="rounded-circle">
									                            </li>
								                            </c:if>
							                            </c:forEach>
							                          </ul>
							                        </td>
							                        <td>
							                        <c:choose>
							                        	<c:when test="${md.apState eq '결재완료'}">
							                        		<span class="badge bg-label-primary me-1">결재완료</span>
							                        	</c:when>
							                        	<c:when test="${md.apState eq '결재대기중'}">
							                        		<span class="badge bg-label-secondary me-1">결재대기중</span>
							                        	</c:when>
							                        	<c:when test="${md.apState eq '결재진행중'}">
							                        		<span class="badge bg-label-dark me-1">결재진행중</span>
							                        	</c:when>
							                        	<c:when test="${md.apState eq '반려'}">
							                        		<span class="badge bg-label-warning me-1">반려</span>
							                        	</c:when>
	
							                        </c:choose>
							                        </td>
							                      </tr>
						                      </c:forEach>
						                    </tbody>
						                  </table>
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

					<script src="/js/attendance/attendance.js"></script>
					<script src="/js/main/schedule.js"></script>
					<script src="/js/attendance/clock.js"></script>

				</body>

				</html>
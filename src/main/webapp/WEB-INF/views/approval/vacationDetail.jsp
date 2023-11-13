<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 날짜포맷 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
                    <div class="card shadow mb-4">
                    <div class="card-body">
                    <div class="table-responsive">
                    
                 	<table class="table">
	
				    <tr>
				        <th class="text-center" style="width: 100px;">제목</th>
				        <td>${approvalVO.apTitle}</td>
				    </tr>
	
				    <tr>
				        <th class="text-center" style="width: 100px;">작성일</th>
				        <td>${approvalVO.apCDate}</td>
				    </tr>
			 
					</table>
					
					<form action="" id="frm">
						<input type="hidden" id="apNo" name="apNo" value="${approvalVO.apNo}">
						<input type="hidden" name="username" id="username" value="${user.username}">
						<input type="hidden" id="apKind" name="apKind" value="${approvalVO.apKind}">
					</form>
					
					<input type="hidden" id="apState" name="apState" value="${approvalVO.apState}">
					<input type="hidden" name="writeUsername" id="writeUsername" value="${approvalVO.username}">
					
					<c:forEach items="${line}" var="line" varStatus="status">
						<input type="hidden" class="approve" name="approve${status.index}" id="approve${status.index}" value="${line.username}">
					</c:forEach>
					
					<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border: none; width: 618px; height: 849px;" class="">
						<tbody>
							<tr style="">
								<td style="border: 1px solid black; padding: 0px 7px; height: 849px; width: 617px; vertical-align: top;">
									<p style="margin: 0px 0px 0px;text-align:justify;font-size:10pt;font-family:맑은 고딕;line-height: normal">
										<span style="font-family:나눔고딕">&nbsp;</span>
									</p>
									<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border: none; width: 602px; height: 131px;" class="">
										<tbody>
											<tr style="">
												<td rowspan="3" style="border-top: none; border-bottom: none; border-left: none; border-image: initial; border-right: 1px solid black; padding: 0px 7px; height: 131px; width: 264px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<b>
															<span style="font-size:22.0pt;font-family:맑은 고딕; font-family:맑은 고딕;font-family:맑은 고딕;bidi-font-family: 맑은 고딕">휴 직 신 청 서</span>
														</b>
														<b>
															<span style="font-size:22.0pt;font-family:나눔스퀘어_ac ExtraBold"></span>
														</b>
													</p>
												</td>
												<td rowspan="3" style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 131px; width: 30px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<b>
															<span style="bidi-font-size:10.0pt;font-family:나눔고딕">결</span>
														</b>
													</p>
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<b>
															<span style="bidi-font-size:10.0pt;font-family:나눔고딕">&nbsp;</span>
														</b>
													</p>
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<b>
															<span style="bidi-font-size:10.0pt;font-family:나눔고딕">재</span>
														</b>
													</p>
												</td>
												
												<!-- 기안자 표시, 결재자의 직급 표시 -->
												<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 25px; width: 94px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">기 안 자</span>
													</p>
												</td>
												<c:choose>
												    <c:when test="${fn:length(line) eq 1}">
												        <!-- 결재자가 한 명인 경우 -->
												        <c:forEach items="${line}" var="apl">
												            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 25px; width: 101px;">
												                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
												                    ${apl.positionName}<br>${apl.empName}
												                </p>
												            </td>
															<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 25px; width: 97px;">
																<p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
																	<span style="font-family:나눔고딕">&nbsp;</span>
																</p>
															</td>
												        </c:forEach>
												    </c:when>
												    <c:when test="${fn:length(line) eq 2}">
												        <!-- 결재자가 두 명인 경우 -->
												        <c:forEach items="${line}" var="apl">
												            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 25px; width: 101px;">
												                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
												                    ${apl.positionName}<br>${apl.empName}
												                </p>
												            </td>
												        </c:forEach>
												    </c:when>
												</c:choose>
											</tr>
											
											<!-- 기안자와 결재자의 도장 표시 -->
											<tr style="">
												<td style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; padding: 0px 7px; height: 80px; width: 94px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<img alt="" src="../files/sign/${approvalVO.uploadName}" style="width: 80px; height: 80px;">
													</p>
												</td>
												<c:choose>
												    <c:when test="${fn:length(line) eq 1}">
												        <!-- 결재자가 한 명인 경우 -->
												        <c:forEach items="${line}" var="apl" varStatus="aplStatus">
												        	<c:if test="${line.apConfirmState eq '1'}">
													            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 101px;">
													                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
													                    <img id="signImg${aplStatus.index}" src="../files/sign/${apl.uploadName}" style="width: 80px; height: 80px;">
													                </p>
													            </td>
												            </c:if>
												        	<c:if test="${line.apConfirmState eq '0'}">
													            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 101px;">
													                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
													                    <span style="font-family:나눔고딕">&nbsp;</span>
													                </p>
													            </td>
												            </c:if>
															<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 97px;">
																<p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
																	<span style="font-family:나눔고딕">&nbsp;</span>
																</p>
															</td>
												        </c:forEach>
												    </c:when>
												    <c:when test="${fn:length(line) eq 2}">
												        <!-- 결재자가 두 명인 경우 -->
												        <c:forEach items="${line}" var="apl" varStatus="aplStatus">
												        	<c:if test="${line[aplStatus.index].apConfirmState eq '1'}">
													            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 101px;">
													                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
													                    <img id="signImg${aplStatus.index}" src="../files/sign/${apl.uploadName}" style="width: 80px; height: 80px;">
													                </p>
													            </td>
												            </c:if>
												        	<c:if test="${line[aplStatus.index].apConfirmState eq '0'}">
													            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 101px;">
													                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
													                    <span style="font-family:나눔고딕">&nbsp;</span>
													                </p>
													            </td>
												            </c:if>
												        </c:forEach>
												    </c:when>
												</c:choose>
												<!-- <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 97px;">
													<p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
												</td>
												<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 97px;">
													<p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
												</td> -->
											</tr>
											
											<!-- 기안작성날짜와 결재날짜 표시 -->
											<tr style="">
												<td style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; padding: 0px 7px; height: 26px; width: 94px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
														<fmt:formatDate pattern="yyyy/MM/dd" value="${approvalVO.apCDate}"/>
													</p>
												</td>
												<c:choose>
												    <c:when test="${fn:length(line) eq 1}">
												        <!-- 결재자가 한 명인 경우 -->
												        <c:forEach items="${line}" var="apl">
												            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 101px;">
												                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
												                    ${apl.apConfirmDate}
												                </p>
												            </td>
															<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 97px;">
																<p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
																	<span style="font-family:나눔고딕">&nbsp;</span>
																</p>
															</td>
												        </c:forEach>
												    </c:when>
												    <c:when test="${fn:length(line) eq 2}">
												        <!-- 결재자가 두 명인 경우 -->
												        <c:forEach items="${line}" var="apl">
												            <td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 25px; width: 101px;">
												                <p class="poName" align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
												                    ${apl.apConfirmDate}
												                </p>
												            </td>
												        </c:forEach>
												    </c:when>
												</c:choose>
											</tr>
										</tbody>
									</table>
									<p style="margin: 0px 0px 0px;text-align:justify;font-size:10pt;font-family:맑은 고딕;line-height: normal">
										<span style="font-family:나눔고딕">&nbsp;</span>
									</p>
									<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border: none; width: 601px;">
										<tbody>
											<tr style="">
												<td style="border: 1px solid black; background: rgb(208, 206, 206); padding: 0px 7px; height: 29px; width: 95px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">부 
															<span style="spacerun:yes">&nbsp;</span>
															<span style="spacerun:yes">&nbsp;</span>서
														</span>
													</p>
												</td>
												<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 29px; width: 209px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span> ${approvalVO.deptName}
													</p>
												</td>
												<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 29px; width: 96px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">직 
															<span style="spacerun:yes">&nbsp;</span>
															<span style="spacerun:yes">&nbsp;</span>급
														</span>
													</p>
												</td>
												<td style="border-top: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-image: initial; border-left: none; padding: 0px 7px; height: 29px; width: 201px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span> ${approvalVO.positionName}
													</p>
												</td>
											</tr>
											<tr style="">
												<td style="border-right: 1px solid black; border-bottom: 1px solid black; border-left: 1px solid black; border-image: initial; border-top: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 29px; width: 95px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">성 
															<span style="spacerun:yes">&nbsp;</span>
															<span style="spacerun:yes">&nbsp;</span>명
														</span>
													</p>
												</td>
												<td style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; padding: 0px 7px; height: 29px; width: 209px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span> ${approvalVO.empName}
													</p>
												</td>
												<td style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; background: rgb(208, 206, 206); padding: 0px 7px; height: 29px; width: 96px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">기안일자</span>
													</p>
												</td>
												<td style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; padding: 0px 7px; height: 29px; width: 201px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span> ${approvalVO.apCDate}
													</p>
												</td>
											</tr>
											<tr style="">
												<td style="border-right: 1px solid black; border-bottom: 1px solid black; border-left: 1px solid black; border-image: initial; border-top: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 29px; width: 95px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">제 
															<span style="spacerun:yes">&nbsp;&nbsp;</span>목
														</span>
													</p>
												</td>
												<td colspan="3" style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; padding: 0px 7px; height: 29px; width: 505px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span> ${approvalVO.apTitle}
													</p>
												</td>
											</tr>
											<tr style="">
												<td style="border-right: 1px solid black; border-bottom: 1px solid black; border-left: 1px solid black; border-image: initial; border-top: none; background: rgb(208, 206, 206); padding: 0px 7px; height: 380px; width: 95px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">휴  직</span>
													</p>
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">희  망</span>
													</p>
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">사  유</span>
													</p>
												</td>
												<td colspan="3" style="border-top: none; border-left: none; border-bottom: 1px solid black; border-right: 1px solid black; padding: 0px 7px; height: 380px; width: 505px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
														${approvalVO.apContents}
													</p>
												</td>
											</tr>
										</tbody>
									</table>
									<p style="margin: 0px 0px 0px;text-align:justify;font-size:10pt;font-family:맑은 고딕;line-height: normal">
										<span style="font-family:나눔고딕">&nbsp;</span>
									</p>
									<p style="margin: 0px 0px 0px;text-align:justify;font-size:10pt;font-family:맑은 고딕;line-height: normal">
										<span style="font-family:나눔고딕">&nbsp;</span>
									</p>
									<table border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border: none; width: 599px; height: 97px;" class="">
										<tbody>
											<tr>
												<td style="padding: 0px 7px; width: 598px; height: 16px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">위와 같은 사유로 휴직을 신청 하오니 허가하여 주시기 바랍니다.</span>
													</p>
												</td>
											</tr>
											<tr>
												<td style="padding: 0px 7px; width: 598px; height: 16px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
												</td>
											</tr>
											<tr>
												<td style="padding: 0px 7px; width: 598px; height: 16px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕"><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${approvalVO.apCDate}"/></span>
													</p>
												</td>
											</tr>
											<tr>
												<td style="padding: 0px 7px; width: 598px; height: 16px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
												</td>
											</tr>
											<tr>
												<td style="padding: 0px 7px; width: 598px; height: 16px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">기 안 자 :
															<span style="spacerun:yes">&nbsp; ${approvalVO.empName} </span>
														</span>
													</p>
												</td>
											</tr>
											<tr>
												<td style="padding: 0px 7px; width: 598px; height: 16px;">
													<p align="center" style="margin: 0px 0px 0px;font-size:10pt;font-family:맑은 고딕;text-align:center;line-height: normal">
														<span style="font-family:나눔고딕">&nbsp;</span>
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<p>
						<br>
						</p>
						
					</div>
					</div>
					</div>
						<!-- 접속 아이디가 기안서 작성자와 같은 경우 -->
						<c:if test="${user.username eq approvalVO.username}">
							<div class="row" style="float:right;">
								<div class="demo-inline-spacing">
									<c:choose>
										<c:when test="${approvalVO.apState eq '결재진행중' or approvalVO.apState eq '결재완료' or approvalVO.apState eq '반려'}">
												<button type="button" class="btn btn-primary" id="draftListBtn">목록</button>
										</c:when>
										<c:when test="${approvalVO.apState eq '결재대기중'}">
												<button type="button" class="btn btn-primary" onclick="updateBtn()">수정</button>
												<button type="button" class="btn btn-danger" id="deleteBtn" data-url="delete" onclick="deleteBtn()">삭제</button>
												<button type="button" class="btn btn-primary" id="draftListBtn">목록</button>
										</c:when>
									</c:choose>
								</div>
                       		</div>
						</c:if>
						
						<!-- 접속 아이디가 결재자와 같은 경우 -->
						<!-- foreach로 배열을 뿌리는 것 뿐만이 아니라 조회만해서 비교할 수 있다. -->
						<c:forEach items="${line}" var="line">
							<c:if test="${user.username eq line.username}">
								<c:choose>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 0}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approveBtn">결재</button>
												<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 1}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 2}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '결재대기중'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '결재진행중'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approveBtn">결재</button>
												<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '반려'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 1 and approvalVO.apState eq '결재완료'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 1 and approvalVO.apState eq '반려'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
						        </c:choose>
								<!-- <div class="row" style="float:right;">
									<div class="demo-inline-spacing">
										<button type="button" class="btn btn-primary" id="approveBtn" data-url="update">결재</button>
										<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
			                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
									</div>
	                        	</div> -->
                       		</c:if>
                       	</c:forEach>
					</div>						<!-- 접속 아이디가 결재자와 같은 경우 -->
						<!-- foreach로 배열을 뿌리는 것 뿐만이 아니라 조회만해서 비교할 수 있다. -->
						<c:forEach items="${line}" var="line">
							<c:if test="${user.username eq line.username}">
								<c:choose>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 0}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approveBtn">결재</button>
												<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 1}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 2}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '결재대기중'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '결재진행중'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approveBtn">결재</button>
												<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '반려'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 1 and approvalVO.apState eq '결재완료'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 1 and approvalVO.apState eq '반려'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
						        </c:choose>
								<!-- <div class="row" style="float:right;">
									<div class="demo-inline-spacing">
										<button type="button" class="btn btn-primary" id="approveBtn" data-url="update">결재</button>
										<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
			                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
									</div>
	                        	</div> -->
                       		</c:if>
                       	</c:forEach>
					</div>						<!-- 접속 아이디가 결재자와 같은 경우 -->
						<!-- foreach로 배열을 뿌리는 것 뿐만이 아니라 조회만해서 비교할 수 있다. -->
						<c:forEach items="${line}" var="line">
							<c:if test="${user.username eq line.username}">
								<c:choose>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 0}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approveBtn">결재</button>
												<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 1}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
						            <c:when test="${line.aplStep eq 1 and line.apConfirmState eq 2}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
						            </c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '결재대기중'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '결재진행중'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approveBtn">결재</button>
												<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
					                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
			                        	</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 0 and approvalVO.apState eq '반려'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 1 and approvalVO.apState eq '결재완료'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
									<c:when test="${line.aplStep eq 2 and line.apConfirmState eq 1 and approvalVO.apState eq '반려'}">
										<div class="row" style="float:right;">
											<div class="demo-inline-spacing">
												<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
											</div>
										</div>
									</c:when>
						        </c:choose>
								<!-- <div class="row" style="float:right;">
									<div class="demo-inline-spacing">
										<button type="button" class="btn btn-primary" id="approveBtn" data-url="update">결재</button>
										<button type="button" class="btn btn-warning" id="rejectBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반려</button>
			                       		<button type="button" class="btn btn-primary" id="approverListBtn">목록</button>
									</div>
	                        	</div> -->
                       		</c:if>
                       	</c:forEach>
					</div>
					
					<jsp:include page="/WEB-INF/views/approval/rejectModal.jsp"></jsp:include>
					
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
	<script src="/js/approval/detail.js"></script>

</body>
</html>
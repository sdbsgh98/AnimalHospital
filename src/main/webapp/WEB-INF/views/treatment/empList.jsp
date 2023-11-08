<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">	
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
                        <div class="card-body px-0 pt-0 pb-2">
                            <div class="table-responsive p-0">					
							
                              <table class="table align-items-center mb-0">								
                                <thead>
                                  <tr>
									<th class="text-center text-secondary opacity-7">진료의번호</th>
                                    <th class="text-center text-secondary opacity-7">진료의이름</th>
									<th class="text-center text-secondary opacity-7">부서</th>
									<th class="text-center text-secondary opacity-7">직급</th>                                                             
			
                                  </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="a" varStatus="i"> 
                                  <tr>
									<td class="align-middle text-center text-sm">
										<span class="text-secondary text-xs font-weight-bold">${a.username}</span>
									</td>
                                    <td class="align-middle text-center text-sm">
                                      <span class="text-secondary text-xs font-weight-bold"><a href="./schedule?username=${a.username}&empName=${a.empName}&customerNo=${param.customerNo}&animalName=${param.animalName}">${a.empName}</a></span>
                                    </td> 
									<td class="align-middle text-center text-sm">
										<span class="text-secondary text-xs font-weight-bold">${a.deptName}</span>
									</td> 
									<td class="align-middle text-center text-sm">
										<span class="text-secondary text-xs font-weight-bold">${a.positionName}</span>
									</td>                                                     
                                  </tr>
                                  </c:forEach>
                                </tbody>
                              </table>							 
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

</body>
</html>
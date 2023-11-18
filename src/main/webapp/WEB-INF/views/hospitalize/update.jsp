<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <!DOCTYPE html>
        <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
          data-assets-path="/assets/" data-template="vertical-menu-template-free">

        <head>
          <c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
          <link href='/fullcalendar/main.css' rel='stylesheet' />
          <script src='/fullcalendar/main.js'></script>

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
                    <h3>입원동물 수정</h3>
                   
                    <table class="table align-items-center mb-0">
                      <tbody>
                      <input type="hidden" id="customerNo" value=${vo.customerNo}>
                      <input type="hidden" id="username" value=${vo.username}>
                      <input type="hidden" id="historyNo" name="historyNo" value=${param.historyNo}>
                        <tr>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">입원실번호 </span>
                          </td>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">
                                <select name="cageNo" id="cageNo" class="form-select form-select-sm" aria-label="Small select example">
                                <option value="${vo.cageNo}" selected="selected">${vo.cageNo}</option>
                                  <c:forEach var="i" begin="1" end="12">                                 
                                  <option value="${i}">${i}</option>
                                 </c:forEach>                                 
                            </span>
                          </td>                         
                        </tr>       

                        <tr>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">이름: </span>
                          </td>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">
                              <input type="text" readonly class="form-control" name="animalName" id="animalName" value=${vo.animalName}>
                            </span>
                          </td>
                          <td class="align-middle text-center text-sm">                           
                          </td>
                        </tr> 
                        
                        <tr>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">성별: </span>
                          </td>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">
                              <input type="text" readonly class="form-control-plaintext" name="gender" id="gender" value=${vo.gender}>
                            </span>
                          </td>
                          <td class="align-middle text-center text-sm">                            
                          </td>
                        </tr> 

                        <tr>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">몸무게 </span>
                          </td>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">
                              <input type="text" readonly class="form-control-plaintext" name="weight" id="weight" value=${vo.weight}>
                            </span>
                          </td>
                          <td class="align-middle text-center text-sm">                            
                          </td>
                        </tr> 

                        <tr>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">증상: </span>
                          </td>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">
                              <input type="text" class="form-control" name="disease" id="disease" value=${vo.disease}>
                            </span>
                          </td>
                          <td class="align-middle text-center text-sm">                            
                          </td>
                        </tr> 

                        <tr>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">입원기간 </span>
                          </td>
                          <td class="align-middle text-center text-sm">
                            <span class="text-secondary text-xs font-weight-bold">
                             입원시작일 <input type="date"  class="form-control" name="startDate" id="startDate" value=${vo.startDate}>
                            </span>
                            <span class="text-secondary text-xs font-weight-bold">
                             퇴원예정일 <input type="date"  class="form-control" name="lastDate" id="lastDate" value=${vo.lastDate}>
                             </span>
                          </td>
                          <td class="align-middle text-center text-sm">                            
                          </td>
                        </tr> 

                      </tbody>                      
                    </table> 
                    
                    <div style=" text-align: center; margin: 30px;">
                    	<button type="submit" id="updateHos" class="btn btn-primary">수정등록</button>             
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
         <script src="/js/hospitalize/hospitalize.js"></script>
        </body>

        </html>
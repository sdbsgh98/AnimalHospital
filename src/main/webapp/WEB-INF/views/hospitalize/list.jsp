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
        

          <style>
            .animal{
        	    padding: 5px;
        	    box-sizing: border-box;
        	    display: inline-flex;
        	}
        	.animal > div {
        	    display: inline-block;
        	    position: relative;        	    
        	    width: 250px;
        	    height: 280px;
        	    margin: 5px;
        	    border-radius: 4px;
        	    font-weight:bold;
        	    color:white;        	    
        	}
        
        	.r{
        		background-color:#F5A9BC;
        	}
        	.f{
        		background-color:#A9D0F5;
        	}
        	a{
        		text-decoration:none;
        		color:white;
        		font-weight:bold;
        	}
        	.right{
        		text-align:right;
        	}
        	.content{
        		padding:10px
        	}
        	.btn{
        		width:40px,
        		height:20px
        	}
          </style>
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
                  <div class="container-xxl flex-grow-1 container-p-y" style="padding-left: 12.625rem;">
                    <h3>입원실 현황</h3>
                     

                    <div class="animal">
	                    <div class="cage" id="1"><h3>1</h3></div>
	                    <div class="cage" id="2"><h3>2</h3></div>
	                    <div class="cage" id="3"><h3>3</h3></div>
	                    <div class="cage" id="4"><h3>4</h3></div>
	                 </div>
	                 <div class="animal">
		                <div class="cage" id="5"><h3>5</h3> </div>
		                <div class="cage" id="6"><h3>6</h3></div>
		                <div class="cage" id="7"><h3>7</h3></div>
		                <div class="cage" id="8"><h3>8</h3></div>
		             </div>
		             <div class="animal">
			            <div class="cage" id="9"><h3>9</h3></div>
			            <div class="cage" id="10"><h3>10</h3></div>
			            <div class="cage" id="11"><h3>11</h3></div>
			            <div class="cage" id="12"><h3>12</h3></div>
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
         <script src="/js/hospitalize/list.js"></script>
        </body>

        </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSP에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
    data-theme="theme-default" data-assets-path="/assets/"
    data-template="vertical-menu-template-free">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<body id="page-top">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	    	<div id="content-wrapper" class="d-flex flex-column">
	    		<div id="content">	    		
		    		<div class="container-fluid" style="margin-top: 50px;">
						<sec:authentication property="Principal" var="user"/>
						    <div class="container-xxl">
						      <div class="authentication-wrapper authentication-basic container-p-y">
						        <div class="authentication-inner">
						          <!-- Register -->
						          <div class="card" style="width: 800px; align-items: center; margin: auto; margin-top: 10px;">
						            <div class="card-body">
						              <!-- Logo -->
						              <div class="app-brand justify-content-center">
						                <a href="#" class="app-brand-link gap-2">
						                  <img alt="" src="/resources/images/jisun3.png" style="width: 40px;" height="40px;">
						                  <span class="app-brand-text demo text-body fw-bolder">Animal Hospital</span>
						                </a>
						              </div>
						              
						              <br><br>
									<div >
										<!-- <input type="radio" class="" id="search_username" name="search_total" onclick="search_check(1)" checked="checked">
										<label class=""	for="search_username">사원번호 찾기</label>
										&nbsp;&nbsp; -->
										<!-- <input type="radio" class="custom-control-input" id="search_password" name="search_total" onclick="search_check(2)">  -->
										<label class="" for="search_password">비밀번호 찾기</label>
									</div>
						              <br>
						              <!-- /Logo -->

										<%-- <div id="searchI">
							              <h4 class="mb-2">사원번호 찾기🔐</h4><br>
											<form method="post" class="form-signin" action="findUsername" name="findform">

											 	<table>
													<tr>
														<td>이름</td>
													 	<td>
													 		<input type="text" class="form-control" id="empName" name="empName" placeholder="ex) 홍길동">
													 	</td>
												 	</tr>

												 	<tr>
														<td>이메일</td>
													 	<td>
													 		<input type="email" class="form-control" id="email" name="email" placeholder="ex) animal@hospital.com">
													 	</td>
												 	</tr>
											 	</table>
											  <br>	
												  <input class="btn btn-secondary btn-block text-uppercase" type="submit" onclick="idSearch_click()" value="확인">
												  <button class="btn btn-secondary btn-block text-uppercase"> <a href="./login" style="color: white;">로그인</a> </button>
											  <br><br>			  			  				  				          													  	  				  			  				  				          		

								                 <!-- 이름과 비밀번호가 일치하지 않을 때 -->
					                            <c:if test="${check == 1}">                        
					                                <label>일치하는 정보가 존재하지 않습니다.</label>
					                            </c:if>
					                            
					                            <c:if test="${check == 0}">
					                                <label>찾으시는 사원번호는 '${username}' 입니다.</label>
					                                <br>
					                                <a href="./findPw">비밀번호 찾기</a>
					                            </c:if>				        		
							        		</form>
										</div> --%>
						
										<div id="searchP">
										<h4 class="mb-2">비밀번호 찾기🔐</h4><br>
											<%-- <form method="post" class="form-signin" action="findUser" name="findform"> --%>
											<div>
											
												<form:form modelAttribute="empVO" action="/emp/findUser" method="POST">
												  <div class="form-group">
												  	<form:label path="username">사원번호</form:label>
													<input id="username" Class="form-control" name="username" placeholder="ex) 2023000"/>
													<form:errors path="username"></form:errors>					
												 
												  </div>
												  <div class="form-group">
												  	<form:label path="empName">이름</form:label>
												    <input type="text" class="form-control" id="empName" name="empName" placeholder="ex) 홍길동"/>
												  	<form:errors path="empName"></form:errors>
												  </div>
												  <div class="form-group">
												  	<form:label path="email">이메일</form:label>
												    <input type="email" class="form-control" id="email" name="email" placeholder="ex) animal@hospital.com">
												  	<form:errors path="email"></form:errors>
												  	<button class="btn form-control" id="sendMail">이메일 전송</button>
												  </div>
													<input class="btn btn-secondary btn-block text-uppercase" id="searchBtn" type="button" value="확인">

												  <!-- <button type="submit" class="btn btn-primary" style="margin-top: 30px;">로그인</button> -->
	
								        		</form:form>	
								        		
											</div>
											 	<!-- <table>
													<tr>
														<td>사원번호</td>
													 	<td>
													 		<input type="text" class="form-control" id="empNo" name="empNo" placeholder="ex) 2023000">
													 	</td>
												 	</tr>											 	
													<tr>
														<td>이름</td>
													 	<td>
													 		<input type="text" class="form-control" id="empName" name="empName" placeholder="ex) 홍길동">
													 	</td>
												 	</tr>

												 	<tr>
														<td>이메일</td>
													 	<td>
													 		<input type="email" class="form-control" id="email" name="email" placeholder="ex) animal@hospital.com">
													 	</td>
												 	<tr>
													 	<td>
													 		<button class="btn form-control" id="sendMail">이메일 전송</button>
													 	</td>
												 	</tr>												 	
											 	</table> -->
											 <!--  <br>	
												  <input class="btn btn-secondary btn-block text-uppercase" type="submit" value="확인">
												  <button class="btn btn-secondary btn-block text-uppercase"> <a href="./login" style="color: white;">로그인</a> </button>
											  <br><br>	 -->		  			  				  				          													  	  				  			  				  				          		

								                 <!-- 이름과 비밀번호가 일치하지 않을 때 -->
					                            <%-- <c:if test="${check == 1}">                        
					                                <label>일치하는 정보가 존재하지 않습니다.</label>
					                            </c:if>
					                            
					                            <c:if test="${check == 0}">
					                                <label>찾으시는 아이디는 '${username}' 입니다.</label>
					                                <br>
					                                <a href="./findPw">비밀번호 찾기</a>
					                            </c:if>	 --%>			        		
							        		<%-- </form> --%>
										</div>
						            </div>
						          </div>
						          <!-- /Register -->
						        </div>
						      </div>
						    </div>
						
						    <!-- / Content -->
		    		</div>   		
	    		
	    		</div>	    		

	    	</div>
	    </div>  
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
    <script type="text/javascript">
        $('#searchBtn').on("click", function () {
        	let username = $("#username").val();
            let empName = $("#empName").val();
            let email = $("#email").val();

            if (username === "") {
                alert("사원번호는 필수입력사항입니다.");
                $("#username").focus();
                return;
            }
            
            if (empName === "") {
                alert("이름은 필수입력사항입니다.");
                $("#empName").focus();
                return;
            }
            if (email === "") {
                alert("이메일은 필수입력사항입니다.");
                $("#email").focus();
                return;
            }
        });
    </script>
    
    <!-- <script type="text/javascript">
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
    </script> -->

	<script type="text/javascript">
		$('#sendMail').on("click", function(){
			alret("이메일 발송이 완료되었습니다.");
		});
	</script>

</body>
</html>
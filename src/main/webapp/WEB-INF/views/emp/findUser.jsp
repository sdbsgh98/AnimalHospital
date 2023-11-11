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

						              <br>
						
										<div id="searchP">
										<h4 class="mb-2">비밀번호 찾기🔐</h4><br>
											<div>
											
												<form:form modelAttribute="findVO" action="/emp/findUser" method="POST" id="findform">
												  <div class="form-group">
												  	<form:label path="username">사원번호</form:label>
													<form:input  id="username" path="username" cssClass="form-control"/>
													<form:errors path="username" cssStyle="error"/>					
												 
												  </div>
												  <div class="form-group">
												  	<form:label path="empName">이름</form:label>
												    <form:input  id="empName" path="empName" cssClass="form-control"/>
												  	<form:errors path="empName" cssStyle="error"/>
												  </div>
												  <div class="form-group">
												  	<form:label path="email">이메일</form:label>
												    <form:input  id="email" path="email" cssClass="form-control"/>					  
												  	<form:errors path="email" cssStyle="error"/>
												  	<div id="checkBtnDiv">
													  	<a class="btn" id="checkBtn" onclick="btn_check(1)" style="background-color: rgb(255,239,222); margin-top: 10px;">사원조회</a>
													  	<a class="btn" href="./login" style="background-color: rgb(255,255,222); margin-top: 10px; margin-right: 10px; float: left;">로그인</a>
												  	</div>
													 <div id="mailBtn" style="display: none;">
													 	<div id="mailBtnDiv">
														  	<a class="btn form-control" id="sendBtn" style="background-color: rgb(255,239,222); margin-top: 10px; margin-bottom: 10px;" onclick="btn_mail(1)">인증번호 전송</a>
													 	</div>
														<div id="mailDiv" name="mail_number">
										                	<input type="text" class="form-control" name="number" id="number" style="margin-top: 10px;width: 73%;float: left;" placeholder="인증번호 입력">
										                	<button type="button" class="form-control" style="width: 25%; background-color: rgb(255,239,222); margin-top: 10px; float: right;" name="confirmBtn" id="confirmBtn" >확인</button>
									        			</div>
														
													 </div>
												  </div>
								        		
								        		</form:form>	

	
											</div>		  			  				  				          													  	  				  			  				  				          		

					                         			        		
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
            
      $(document).ready(function () {
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
            
        });
    </script>

	<script type="text/javascript">
	$('#checkBtn').on("click", function () {
	    let username = $("#username").val();
	    let empName = $("#empName").val();
	    let email = $("#email").val();

	    if (username === "" || empName === "" || email === "") {
	        alert("필수 입력 항목을 작성해주세요.");
	        return;
	    }
	    
	    function btn_check(num){
	    	if(num == '1'){
	    		document.getElementById("mailBtn").style.display = "";
	    		document.getElementById("checkBtnDiv").style.display = "none";
	    	}else{
	    		document.getElementById("mailBtn").style.display = "none";
	    		document.getElementById("checkBtnDiv").style.display = "";
	    	}
	    } 	
	    
	     $.ajax({
		        url: "/emp/find",
		        type: "POST",
		        data: { username: username, empName: empName, email: email },
		        success: function (data) {
		            if (data === "success") {	        	    
		                alert("사용자가 확인되었습니다. 이메일 인증을 진행해주세요.");
		                btn_check(1);
		            } else {
		                alert("일치하는 사용자가 없습니다.");
		                btn_check(0);
		            }
		        },
		        error: function () {
		            console.log("오류발생");
		        }
		    });
	     
		    $("#username").prop("readonly", true);
		    $("#empName").prop("readonly", true);
		    $("#email").prop("readonly", true);
	});
	</script>

	<script type="text/javascript">
 
	$('#sendBtn').on("click", function(){	
		document.getElementById("sendBtn").style.display = "none";
		
	    let username = $("#username").val();
	    let empName = $("#empName").val();
	    let email = $("#email").val();
        
	    $.ajax({
	        url: "/emp/sendMail", 
	        type: "POST",
	        data: { email: $("#email").val() },  
	        success: function () {
	            alert("인증메일 발송완료"); 
	        },
	        error: function () {
	            console.log("문제있음"); 
	        }
	    });  
	  
	    
	});
		
	</script>
	<script type="text/javascript">
    $('#confirmBtn').on("click", function () {
        let code = $("#number").val();
		let username = $("#username").val();
        
        if (!code || isNaN(code)) {
          alert("인증번호를 입력헤주세요.");
          $("#number").focus();
          return;
        }

        $.ajax({
          url: "/code",
          type: "POST",
          data: { code: code },
          success: function (data) {
            if (data === "success") {
              alert("인증이 완료되었습니다.");
			  location.href="/emp/pwUpdate?username="+username;
            } else {

              alert("인증에 실패하셨습니다.");
            }
          },
          error: function () {
        	  alert("관리자에게 문의해주세요.");
          }
        });
      });


	</script>
</body>
</html>
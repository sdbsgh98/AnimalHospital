<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
body {
    background: rgb(231, 231, 255);
}

.container {
    margin: auto;
    width: 650px;
    height: 550px;
    position: relative;
}

.welcome {
    background: #f6f6f6;
    width: 650px;
    height: 415px;
    position: absolute;
    top: 25%;
    border-radius: 5px;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, .1);
}

.pinkbox {
    position: absolute;
    top: -10%;
    left: 5%;
    background: rgb(166, 166, 255);
    width: 320px;
    height: 500px;
    border-radius: 5px;
    box-shadow: 2px 0 10px rgba(0, 0, 0, .1);
    transition: all .5s ease-in-out;
    z-index: 2;
}

.nodisplay {
    display: none;
    transition: all .5s ease;
}

.leftbox, .rightbox {
    position: absolute;
    width: 50%;
    transition: 1s all ease;
}

.leftbox {
    left: -2%;
}

.rightbox {
    right: -2%;
}

h1 {
    font-family: 'Open Sans', sans-serif;
    text-align: center;
    margin-top: 95px;
    text-transform: uppercase;
    color: #f6f6f6;
    font-size: 2em;
    letter-spacing: 8px;
}

.title {
    font-family: 'Lora', serif;
    color: #8E9AAF;
    font-size: 1.8em;
    line-height: 1.1em;
    letter-spacing: 3px;
    text-align: center;
    font-weight: 300;
    margin-top: 20%;
}

.desc {
    margin-top: -8px;
}

.account {
    margin-top: 45%;
    font-size: 10px;
}

p {
    font-family: sans-serif;
    font-size: .7em;
    letter-spacing: 2px;
    color: gray;
    text-align: center;
}


.flower {
    position: absolute;
    width: 120px;
    height: 120px;
    top: 46%;
    left: 29%;
    opacity: .7;
}

.smaller {
    width: 90px;
    height: 100px;
    top: 48%;
    left: 38%;
    opacity: .9;
}

button {
    padding: 12px;
    font-family: sans-serif;
    text-transform: uppercase;
    letter-spacing: 3px;
    font-size: 11px;
    border-radius: 10px;
    margin: auto;
    outline: none;
    display: block;
}

.button {
    margin-top: 3%;
    background: white;
    color: rgb(166, 166, 255);
    border: solid 1px rgb(231, 231, 255);
}

/* form styling */

form {
    display: flex;
    align-items: center;
    flex-direction: column;
    padding-top: 7px;
}

.more-padding {
    padding-top: 35px;
}

input {
    background: rgb(166, 166, 255);
    width: 65%;
    color: white;
    border: none;
    border-bottom: 1px solid rgba(255, 255, 255, 0.5);
    padding: 9px;
    margin: 7px;
}

input::placeholder {
    color: rgba(255, 255, 255, 1);
    letter-spacing: 2px;
    font-size: 0.8em;
    font-weight: 100;
}

input:focus {
    color: white;
    outline: none;
    border-bottom: 1.2px solid rgba(236, 89, 144, 0.7);
    font-size: 1em;
    transition: .8s all ease;
}

label {
    font-family: sans-serif;
    color: white;
    font-size: 0.8em;
    letter-spacing: 1px;
}

.checkbox {
    display: inline;
    white-space: nowrap;
    position: relative;
    left: -62px;
    top: 5px;
}

input[type=checkbox] {
    width: 7px;
    background: #EAC7CC;
}

.checkbox input[type="checkbox"]:checked + label {
    color: grey;
    transition: .5s all ease;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="">

<div class="container">
  <div class="welcome">
    <div class="pinkbox">
      <div class="signup nodisplay">
        <h1>find password</h1>
		<form action="findUser" method="get" autocomplete="off">

			<input type="text" id="username" name="username" class="" placeholder="사원번호를 입력하세요."/>					

			<input type="text" id="empName" name="empName" class="" placeholder="이름을 입력하세요."/>

			<input type="email" id="email" name="email" class="" placeholder="이메일을 입력해주세요"/>					  
				<div id="checkBtnDiv">
					<button class="button" type="button" id="checkBtn" onclick="btn_check(1)" style="margin-top: 15px;">사원조회</button>
					<!-- <button class="btn" href="./login" style="background-color: rgb(255,255,222); margin-top: 10px; margin-right: 10px; float: left;">로그인</button> -->
				</div>
				<div id="mailBtn" style="display: none;">
					<div id="mailBtnDiv">
						<button type="button" class="button" id="sendBtn" style="margin: auto;" onclick="btn_mail(1)">인증번호 전송</button>
					</div>
					<div id="mailDiv" name="mail_number">
						<input type="text" class="" name="number" id="number"  placeholder="인증번호 입력">
						<button type="button" class="button" name="confirmBtn" id="confirmBtn" >확인</button>
					</div>									
				</div>								        		
		</form>		
      </div>
      <div class="signin">
        <h1>sign in</h1>
         			<div>
        				<spring:message code="${param.message}" var="msg"></spring:message>
        				<p style="color: red;">${msg}</p>
        			</div> 
<%--   		<form action="login" method="post" class="more-padding" autocomplete="off"> --%>
		<form:form modelAttribute="empVO" action="/emp/login" method="POST">
			<input type="text" id="username2" name="username" placeholder="사원번호를 입력하세요." value=""/>					
			<div id="usernameError" style="font-size: 12px; color:red;"></div>
			<input type="password" id="password2" name="password" placeholder="비밀번호를 입력하세요." value=""/>
			<div id="passwordError" style="font-size: 12px; color:red;"></div>
			<div class="checkbox">
				<input type="checkbox" class="form-check-input" id="remember-me" name="remember-me" checked="checked"/><label for="remember">remember me</label>
			</div>			
			 <button type="submit" class="btn button" style="margin-top: 80px;" id="login">login</button>

		</form:form>
<%-- 		</form> --%>
      </div>
    </div>
    <div class="leftbox">
      <h2 class="title">보&nbsp;&nbsp;듬</h2>
      <p class="desc">Animal Hospital</p>
      <img class="flower smaller" src="/resources/images/foot.png" style="margin-right: 20px;">
      <p class="account">have an account?</p>
      <button class="button" id="signin">login</button>
      
      
    </div>
    <div class="rightbox">
      <h2 class="title">보&nbsp;&nbsp;듬</h2>
      <p class="desc">Animal Hospital</p>
      <img class="flower" src="/resources/images/logo1.png" style="margin-left: 10px;"/>
      <p class="account">Forgot your password?</p>
      <button class="button" id="signup" name="findUser"><!-- <a href="/emp/findUser" style="text-decoration: none; te">Find Password</a> -->find password</button>
    </div>
  </div>
 </div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#login').on("click", function () {
            let username = $("#username2").val();
            let password = $("#password2").val();

            if (username === "") {
                alert("사원번호를 입력해주세요.");
                event.preventDefault();
                $("#username2").focus();
                return;
            }

            if (password === "") {
                alert("비밀번호를 입력해주세요.");
                event.preventDefault();
                $("#password2").focus();
                return;
            }

        });
    });
</script>
 <script type="text/javascript">
     $('#signup').click(function() {
         $('.pinkbox').css('transform', 'translateX(80%)');
         $('.signin').addClass('nodisplay');
         $('.signup').removeClass('nodisplay');
     });

     $('#signin').click(function() {
         $('.pinkbox').css('transform', 'translateX(0%)');
         $('.signup').addClass('nodisplay');
         $('.signin').removeClass('nodisplay');
     });
 </script>     
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
		                btn_check(1)
		                
		    		    $("#username").prop("readonly", true);
		    		    $("#empName").prop("readonly", true);
		    		    $("#email").prop("readonly", true);
		                
		            } else {
		                alert("일치하는 사용자가 없습니다.");
		               	console.log(data)
		                btn_check(0);
		            }
		        },
		        error: function () {
		            console.log("오류발생");
		        }
		    });
	     

	});
	</script>

	<script type="text/javascript">

	
	$('#sendBtn').on("click", function(event) {
	    event.preventDefault();  // 이벤트 기본 동작 막기

	    /* ("#sendBtn").style.display = "none"; */
	    $(this).hide();

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
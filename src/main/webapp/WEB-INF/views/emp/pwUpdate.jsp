<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
<style type="text/css">

body {
    background: rgb(231, 231, 255);
    height: 82vh;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
}
.container {
    margin: auto;
    width: 800px;
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
    background: rgb(166, 166, 255);
    width: 400px;
    height: 500px;
    border-radius: 5px;
    box-shadow: 2px 0 10px rgba(0, 0, 0, .1);
    transition: all .5s ease-in-out;
    margin: auto;
    z-index: 2;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
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
</head>
<body id="page-top">
<div class="container">
    <div class="pinkbox">

        <h1>update<br> password</h1>
			<sec:authentication property="Principal" var="user"/>
				<div>
										
					<form id="pwUpdateForm" action="pwUpdate" method="post" onsubmit="return validateForm()">
									
						<input type="hidden" name="randomPw" value="${vo.randomPw}">

						<input type="text" name="username" value="${vo.username}" readonly="readonly">
						<input type="password" class="" id="password" name="password" placeholder="변경 할 비밀번호를 입력하세요." required>
							<div id="passwordError" style="font-size: 12px; color:red;"></div>
								<div id="passwordSuccess"style="float: right;"></div>
									 <br>

						<input type="password" class="" id="passwordCheck" name="passwordCheck" placeholder="변경 할 비밀번호를 한번 더 입력하세요." required>
							<div id="passwordCheckError" style="font-size: 12px; color:red;"></div>
							<div id="passwordCheckSuccess" style="float: right;"></div>
							<br>			  			  				  				          													  	  				  			  				  				          		
						<button type="submit" class="btn btn-primary" id="updateBtn" style="margin-top: 30px;">완료</button>
					</form>					
		</div>
	</div>
</div>

	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

<script type="text/javascript">
    $(document).ready(function () {
        $('#pwUpdateForm').on('submit', function (event) {
            if (!validateForm()) {
                event.preventDefault();
            }
        });

        $('#password, #passwordCheck').on('keyup', function () {
            validatePassword();
        });

        function validateForm() {
            const password = $("#password").val();
            const passwordCheck = $("#passwordCheck").val();

            if (password !== passwordCheck) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            } else {
                alert("비밀번호가 정상적으로 변경되었습니다.");
                return true;
            }
        }

        function validatePassword() {
            const reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
            const password = $("#password").val();
            const passwordCheck = $("#passwordCheck").val();
            
            if (!reg.test(password)) {
                $('#passwordError').text('비밀번호는 영어소문자+숫자 포함 8자리 이상입니다.');
            } else if (password === passwordCheck && reg.test(password)) {
                $('#passwordError').html('<img src="/resources/images/accept.png" style="width: 20px; height: 20px; float: right;">');
            } else {
            	$('#passwordError').text('');
            }
            
            if (!reg.test(passwordCheck)) {
                $('#passwordCheckError').text('비밀번호는 영어소문자+숫자 포함 8자리 이상입니다.');
            } else if (password === passwordCheck && reg.test(password)) {
                $('#passwordCheckError').html('<img src="/resources/images/accept.png" style="width: 20px; height: 20px; float: right;">');
            } else {
            	$('#passwordCheckError').text('');
            }
        }                   
    });
</script>

</body>
</html>
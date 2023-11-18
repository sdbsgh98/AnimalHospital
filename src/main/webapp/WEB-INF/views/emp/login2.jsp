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
    background: #CBC0D3;
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
    background: #EAC7CC;
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
  font-family: $sans-serif;
  font-size: .7em;
  letter-spacing: 2px;
  color: $gray;
  text-align: center;
}

span {
  color: $pale;
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
  font-family: $sans-serif;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 11px;
  border-radius: 10px;
  margin: auto;
  outline: none;
  display: block;
  &:hover {
    background: $pale;
    color: $white;
    transition: background-color 1s ease-out;
  }
}

.button {
  margin-top: 3%;
  background: $white;
  color: $pink;
  border: solid 1px $pale;
}

/* form styling */

form {
  display: flex;
  align-items: center;
  flex-direction: column;
  padding-top: 7px;
}
.more-padding{
  padding-top: 35px;
  input {
    padding: 12px;
  }
  .submit {
    margin-top: 45px;
  }
}
.submit {
  margin-top: 25px;
  padding: 12px;
  border-color: $pink;
  &:hover {
    background: $lavender;
    border-color: darken($lavender, 5%);
  }
}

input {
  background: $pale;
  width: 65%;
  color: $pink;
  border: none;
  border-bottom: 1px solid rgba($white, 0.5);
  padding: 9px;
  margin: 7px;
  &::placeholder {
    color: rgba($white, 1);
    letter-spacing: 2px;
    font-size: 1.3em;
    font-weight: 100;
  }
  &:focus {
    color: $pink;
    outline: none;
    border-bottom: 1.2px solid rgba($pink, 0.7);
    font-size: 1em;
    transition: .8s all ease;
    &::placeholder {
      opacity: 0;
    }
  }
}

label {
  font-family: $sans-serif;
  color: $pink;
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
  background: $pink;
}

.checkbox input[type="checkbox"]:checked + label {
  color: $pink;
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
        <h1>register</h1>
        <form autocomplete="off">
          <input type="text" placeholder="username">
          <input type="email" placeholder="email">
          <input type="password" placeholder="password">
          <input type="password" placeholder="confirm password">
          <button class="button submit">create account </button>
        </form>
      </div>
      <div class="signin">
        <h1>sign in</h1>
		<form:form modelAttribute="empVO" action="/emp/login" method="POST">
			<div class="form-group">
				<form:label path="username">사원번호</form:label>
				<form:input  id="username" path="username" value="2023089" cssClass="form-control"/>					
			 </div>
			<div class="form-group">
				<form:label path="password">비밀번호</form:label>
				<form:password id="password" path="password" value="123456" cssClass="form-control"/>
			</div>
			 <button type="submit" class="btn btn-primary" style="margin-top: 30px;">login</button>

		</form:form>
      </div>
    </div>
    <div class="leftbox">
      <h2 class="title"><span>FIND</span><br>PASSWORD</h2>
      <p class="desc">pick your perfect <span>bouquet</span></p>
      <img class="flower smaller" src="https://image.ibb.co/d5X6pn/1357d638624297b.jpg" alt="1357d638624297b" border="0">
      <p class="account">have an account?</p>
      <button class="button" id="signin">login</button>
      
      
    </div>
    <div class="rightbox">
      <h2 class="title"><span>Animal</span><br>Hospital</h2>
      <img class="flower" src="resourcs/images/findPassword.png"/>
      <p class="account">Forgot your password?</p>
      <button class="button" id="signup" name="findUser"><!-- <a href="/emp/findUser" style="text-decoration: none; te">Find Password</a> -->cc</button>
    </div>
  </div>
 </div>


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

</body>
</html>
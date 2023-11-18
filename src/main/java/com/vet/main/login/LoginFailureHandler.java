package com.vet.main.login;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class LoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		log.info("========Exception : {}=========", exception);
		String message = "로그인 실패";
		
		if(exception instanceof AuthenticationException) {
			message = "휴먼 계정";
		}
		if(exception instanceof InternalAuthenticationServiceException) {
			//message = "존재하지 않는 사원번호입니다.";
			message="login.fail.nouser";
		}
		if(exception instanceof BadCredentialsException) {
			//message = "비밀번호를 확인해주세요";
			message="login.fail.notpassword";
		}
		if(exception instanceof LockedException) {
			message = "잠긴 계정입니다. 관리자에게 문의해주세요.";
		}
		
		message = URLEncoder.encode(message, "UTF-8");
		response.sendRedirect("/emp/login?message="+message);
		
	}
}

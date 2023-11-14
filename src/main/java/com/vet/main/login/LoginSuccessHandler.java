package com.vet.main.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		for (GrantedAuthority authority : authentication.getAuthorities()) {
            if ("ROLE_USER".equals(authority.getAuthority())) {
                if (authentication.getPrincipal() instanceof EmpVO) {
                    EmpVO empVO = (EmpVO) authentication.getPrincipal();
                    if (empVO.getRandomPw() == 0) {
                        response.sendRedirect("/emp/pwUpdate?username="+empVO.getUsername()); 
                    } else {
                        response.sendRedirect("/");
                    }
                    return ; 
                }
            }
        }
		response.sendRedirect("/");
    }
	
}

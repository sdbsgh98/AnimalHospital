package com.vet.main.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;

import org.springframework.security.web.SecurityFilterChain;

import com.vet.main.emp.EmpService;


@Configuration //스프링 환경 세팅을 돕는 어노테이션
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private LoginSuccessHandler successHandler;
	
	@Autowired
	private EmpService empService;
	
	
	
	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		
		return web -> web
				.ignoring()
				.antMatchers("/assets/**")
				.antMatchers("/fonts/**")
				.antMatchers("/html/**")
				.antMatchers("/js/**")
				.antMatchers("/libs/**")
				.antMatchers("/scss/**")
				.antMatchers("/tasks/**")
				;
	}
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		httpSecurity
			.cors()
			.and()
			.csrf()
			.disable()
			.authorizeHttpRequests()
				.antMatchers("/resources/images/*").permitAll()
				.antMatchers("/emp/findUser").permitAll() 
				.antMatchers("/emp/pwUpdate").permitAll() 
				.antMatchers("/emp/empUpdate").hasRole("ADMIN")
				.antMatchers("/dept/deptManage").hasRole("ADMIN")
				.antMatchers("/dept/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/notice/*").hasAnyRole("ADMIN", "USER")
				.antMatchers("/notice/noticeAdd").hasRole("ADMIN")
				.antMatchers("/notice/noticeUpdate").hasRole("ADMIN")
				.antMatchers("/notice/noticeDelete").hasRole("ADMIN")
				.antMatchers("/customer/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/treatmentchart/*").hasAnyRole("ADMIN", "USER")
				.antMatchers("/medicine/*").hasAnyRole("ADMIN", "USER")
				.antMatchers("/treatment/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/surgery/*").hasAnyRole("ADMIN", "USER")
				.antMatchers("/hospitalize/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/approval/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/attendance/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/work/*").hasAnyRole("ADMIN", "USER") 
				.antMatchers("/apFormat/*").hasRole("ADMIN")
				.antMatchers("/").hasAnyRole("ADMIN", "USER") 
				.and()
			.formLogin()
				.loginPage("/emp/login")
				.successHandler(successHandler)
				.failureHandler(getFailHandler())
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/emp/logout")
				.logoutSuccessUrl("/emp/login")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.permitAll()
				.and()
				.rememberMe()
					.rememberMeParameter("remember-me")
					.tokenValiditySeconds(3600) // 쿠키의 만료시간 설정(초), default: 14일
					.key("rememberKey")
					.userDetailsService(empService)
					.authenticationSuccessHandler(successHandler)
					.and()
					
				.sessionManagement();
				
		return httpSecurity.build();
					
	}
	
	private LoginFailureHandler getFailHandler() {
		return new LoginFailureHandler();
	}
	
}

	

	

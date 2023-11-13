package com.vet.main.emp;

import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PwVO {

	private String username;
	
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()-_+=]).{6,12}$", message = "비밀번호는 소문자+숫자+특수문자 포함 6~12 자리입니다.")
	private String password;

	private String passwordCheck;
	
	private boolean randomPw;
}

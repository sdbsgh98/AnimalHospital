package com.vet.main.emp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PwVO {

	private String username;
	
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[*@#$%^&+=])(?=\\S+$).{6,12}$", message = "비밀번호는 소문자+숫자 포함 6~12 자리입니다.")
	@NotBlank(message = "비밀번호를 입력해주세요.")
	private String password;
	
	@NotBlank(message = "비밀번호를 입력해주세요.")
	private String passwordCheck;
	
	private int randomPw;
}

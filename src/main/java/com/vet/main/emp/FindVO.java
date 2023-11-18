package com.vet.main.emp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindVO {

	@NotBlank(message = "사원번호는 필수 입력 값입니다.")
    private String username;
	
    @NotBlank(message = "이름은 필수 입력 값입니다.")
    private String empName;
    
    @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")
    @NotBlank(message = "이메일은 필수 입력 값입니다.")
    private String email;
    
	private int randomPw;

	private String password;
	
}

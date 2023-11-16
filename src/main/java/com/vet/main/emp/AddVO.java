package com.vet.main.emp;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AddVO {

    private String username;
	private String password;
    
	@NotBlank(message = "이름은 필수 입력 값입니다.")
    private String empName;
    
    @Email(message = "올바른 이메일 주소를 입력해주세요.")
    @NotBlank(message = "이메일은 필수 입력 사항입니다.")
    private String email;
	
    @NotBlank(message = "연락처는 필수 입력 사항입니다.")
	@Pattern(regexp = "(01[016789])(\\d{3,4})(\\d{4})", message = "올바른 휴대폰 번호를 입력해주세요.")
	private String phone;
	
	@Past(message = "생년월일을 확인해주세요.")
	private Date birth;
	
	private Date hireDate;
	private int randomPw;
	private String fileName;
	private String originalFileName;
	private Long positionNo;
	private String deptNo;
	private String state;
	
	private List<RoleVO> roleVOs;
}

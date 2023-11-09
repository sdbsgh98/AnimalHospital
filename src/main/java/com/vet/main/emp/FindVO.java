package com.vet.main.emp;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindVO {

	//@NotBlank(message = "사원번호는 필수 입력 값입니다.")
	private String username;
	//@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\\\W)(?=\\\\S+$).{6,12}", message = "비밀번호를 확인해주세요.")
	private String password;
	//@NotBlank(message = "이름은 필수 입력 값입니다.")
	private String empName;
	//@Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")
	//@NotBlank(message = "이메일은 필수 입력 값입니다.")
	private String email;
	//@NotBlank(message = "연락처는 필수 입력 값입니다.")
	private String phone;
	private Date hireDate;
	private int randomPw;
	private String fileName;
	private String originalFileName;
	private Long positionNo;
	private String deptNo;
	private String state;
	private Date birth;
	
	//position
	private String positionName;
	
	//department
	private String deptName;
	private Long parentNo;
	private Long depth;
	
	//@NotBlank
	private String passwordCheck;
	
	private Boolean enabled;
	private List<RoleVO> roleVOs;
	
	//file
	public List<EmpVO> fileVO;
	
}

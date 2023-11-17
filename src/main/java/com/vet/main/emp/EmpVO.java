package com.vet.main.emp;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EmpVO implements UserDetails{

	//emp

    private String username;
	private String password;
    
//	@NotBlank(message = "이름은 필수 입력 값입니다.")
    private String empName;
    
//    @Email(message = "올바른 이메일 주소를 입력해주세요.")
//    @NotBlank(message = "이메일은 필수 입력 사항입니다.")
    private String email;
	
//    @NotBlank(message = "연락처는 필수 입력 사항입니다.")
//	@Pattern(regexp = "(01[016789])(\\d{3,4})(\\d{4})", message = "올바른 휴대폰 번호를 입력해주세요.")
	private String phone;
	private Date hireDate;
	private int randomPw;
	private String fileName;
	private String originalFileName;
	private Long positionNo;
	private String deptNo;
	private String state;
	
//	@Past(message = "생년월일을 확인해주세요.")
	private Date birth;
	
	//position
	private String positionName;
	
	//department
	private String deptName;
	private Long parentNo;
	private Long depth;
	
	private String passwordCheck;
	
	private Boolean enabled;
	private List<RoleVO> roleVOs;
	
	//file
	public List<EmpVO> fileVO;
	
	//sign
	private String signName;
	private String uploadName;
	private String originalSignName;
	private Date addDate;

	public List<EmpVO> fileVO2;
	
	// 결재선
	public List<EmpVO> selectList;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		if (roleVOs!=null) {
			for(RoleVO roleVO: roleVOs) {
				authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
			}
		}
		
		return authorities;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return username;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		// 계정의 만료 여부 
		// true 만료 안됨, 
		// false 만료됨, 로그인 안됨
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// 계정 잠김 여부
		// true     : 계정 잠기지 않음
		// false    : 계정 잠김, 로그인 안됨
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// 비밀번호 만료 여부
		// true     : 만료 안됨
		// false    : 만료 됨, 로그인 안됨
		return true;
	}

	@Override
	public boolean isEnabled() {
		// 계정 잠김 여부
		// true     : 계정 잠기지 않음
		// false    : 계정 잠김, 로그인 안됨
		return true;
	}
	
	private Double dayoffCount;
}
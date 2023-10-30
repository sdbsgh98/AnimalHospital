package com.vet.main.emp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmpService implements UserDetailsService{

	@Autowired
	private EmpDAO empDAO;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
		log.info("=========로그인 시도 중==========");
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		try {
			empVO = empDAO.getLogin(empNo);
		} catch (Exception e) {
			e.printStackTrace();
			empVO=null;
		}
		
		return empVO;

	}

	// 마이페이지
	public EmpVO mypage(EmpVO empVO) throws Exception{
		return empDAO.mypage(empVO);
	}
	
	//마이페이지 수정
	public int mypageUpdate(EmpVO empVO)throws Exception{
		empVO.setEmail(empVO.getEmail());
		empVO.setPhone(empVO.getPhone());
		
		int result = empDAO.mypageUpdate(empVO);
		
		return result;
	}
	
	// 비밀번호 변경
	public int pwUpdate(EmpVO empVO)throws Exception{
		empVO.setPassword(passwordEncoder.encode(empVO.getPassword()));
		int result = empDAO.pwUpdate(empVO);
		
		return result;
	}

	
	// 사원 관리(직원 목록)
	public List<EmpVO> empList()throws Exception{
		return empDAO.empList();
	}
	
	// 신규직원 등록
	@Transactional(rollbackFor = Exception.class)
	public int empAdd(EmpVO empVO) throws Exception{
		empVO.setPassword(passwordEncoder.encode("animal"));
		int result = empDAO.empAdd(empVO);
		Map<String, Object> map = new HashMap<>();
		map.put("roleNum", 2);
		map.put("username", empVO.getUsername());
		result = empDAO.empRole(map);
		
		return result;
	}
	
	// 직원 상세
	public EmpVO empDetail(EmpVO empVO) throws Exception{
		
		return empDAO.empDetail(empVO);
	}
	
	// 직원 수정
	public int empUpdate(EmpVO empVO) throws Exception{
		empVO.setName(empVO.getName());
		empVO.setDeptNo(empVO.getDeptNo());
		empVO.setPositionNo(empVO.getPositionNo());
		empVO.setState(empVO.getState());
		
		int result = empDAO.empUpdate(empVO);
		
		return result;
		
		
	}
	
}

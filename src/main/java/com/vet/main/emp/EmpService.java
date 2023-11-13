package com.vet.main.emp;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.FileManager;
import com.vet.main.commons.Pager;
import com.vet.main.dept.DeptVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmpService implements UserDetailsService{

	@Value("${app.upload}")
	private String uploadPath;
	
	@Value("${app.emp}")
	private String username;
	
	@Value("${app.sign}")
	private String signNo;
	
	@Autowired
	private FileManager fileManger;
	
	@Autowired
	private EmpDAO empDAO;

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("=========로그인 시도 중==========");
		EmpVO empVO = new EmpVO();
		empVO.setUsername(username);
		try {
			empVO = empDAO.getLogin(username);
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
	public int mypageUpdate(EmpVO empVO, MultipartFile[] files)throws Exception{
		
		int result = empDAO.mypageUpdate(empVO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManger.save(this.uploadPath+this.username, multipartFile);
			empVO.setEmail(empVO.getEmail());
			empVO.setPhone(empVO.getPhone());
			empVO.setFileName(fileName);
			empVO.setOriginalFileName(multipartFile.getOriginalFilename());
			
			result = empDAO.mypageUpdate(empVO);
			
			
		}
		
		return result;
	}
	
	// 비밀번호 변경
	public int pwUpdate(PwVO pwVO) throws Exception {
	    pwVO.setPassword(passwordEncoder.encode(pwVO.getPassword()));
	    int result = empDAO.pwUpdate(pwVO);

	    return result;
	}
	
	// 비밀번호 찾기
	public FindVO findUser(FindVO findVO)throws Exception{
	
		return empDAO.findUser(findVO);
	}

	// db에 존재하는지 확인
	public boolean checkUser(String username, String empName, String email)throws Exception{
		return empDAO.checkUser(username, empName, email);
	}
	
	// 이메일 중복확인	
	// db에 email 존재하는지 확인 (이메일 중복확인)
	public boolean checkEmail(String email)throws Exception{
		return empDAO.checkEmail(email);
	}
	
	// 사원 관리(직원 목록)
	public List<EmpVO> empList(Pager pager)throws Exception{
		pager.setPerPage(10L);
		pager.makeRowNum();
		Long totalCount = empDAO.getTotal(pager);
		pager.makePageNum(totalCount);
//		pager.makeNum(totalCount);
//		pager.makeStartRow();
		return empDAO.empList(pager);
	}
	
	// 신규직원 등록
	@Transactional(rollbackFor = Exception.class)
	public int empAdd(AddVO addVO) throws Exception{
		String pw = addVO.getPhone();
		
		addVO.setPassword(passwordEncoder.encode(pw));
		int result = empDAO.empAdd(addVO);
		Map<String, Object> map = new HashMap<>();
		map.put("roleNum", 2);
		map.put("username", addVO.getUsername());
		result = empDAO.empRole(map);
		
		return result;
	}
	
	public void sendMailAdd(String email, String username, String phone) {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("[동물병원] 로그인 관련 안내입니다.");
		simpleMailMessage.setText("안녕하세요. 사원번호는 " + username + "이며 비밀번호는 " + phone + "입니다.");
		
		javaMailSender.send(simpleMailMessage);
	}
	
    public void sendMailUser(String email, String username, String phone) {
        sendMailAdd(email, username, phone);
    }
	
	//비밀번호 오류 
	public boolean getPwError(PwVO pwVO ,BindingResult bindingResult)throws Exception{
		boolean check = bindingResult.hasErrors(); // false면 error 없음, true면 error 있음 (검증실패)
		
		//password 일치여부 검증
		if(!pwVO.getPassword().equals(pwVO.getPasswordCheck())) {
			check = true;
			
			bindingResult.rejectValue("passwordCheck", "비밀번호가 일치하지 않습니다.");
			
		}else if(pwVO.getPassword().isBlank() || pwVO.getPasswordCheck().isBlank()){
			check = true;
		}else if(pwVO.getPassword().length()<6 || pwVO.getPassword().length()>12) {
			check = true;
		}else {
			check = false;
		}
			
		log.info("============= check : {}", check);
		
		return check;
	}
	
	// 사원등록 오류
	public boolean getEmpError(AddVO addVO ,BindingResult bindingResult)throws Exception{
	    boolean check = bindingResult.hasErrors();

	    Date currentDate = new Date();

	    if (addVO.getEmpName().isBlank()) {
	        check = true;
	        bindingResult.rejectValue("empName", "이름은 필수 입력 항목입니다."); // 에러 메시지 추가
	    } else if (addVO.getEmail().isBlank()) {
	        check = true;
	    } else if (addVO.getPhone().isBlank()) {
	        check = true;
	    } else if (!addVO.getBirth().before(currentDate)) {
	        check = true;
	    } else {
	        check = false;
	    }

	    log.error("에러 발생: {}", bindingResult.getAllErrors()); // 에러 로깅 추가

	    return check;
	}
	
	// 직원 상세
	public EmpVO empDetail(EmpVO empVO) throws Exception{
		
		return empDAO.empDetail(empVO);
	}
	
	// 직원 수정
	public int empUpdate(EmpVO empVO) throws Exception{
		empVO.setEmpName(empVO.getEmpName());
		empVO.setDeptNo(empVO.getDeptNo());
		empVO.setPositionNo(empVO.getPositionNo());
		empVO.setState(empVO.getState());
		
		int result = empDAO.empUpdate(empVO);
		
		return result;
		
	}
	
	public List<DeptVO> getPositionNo(String deptNo)throws Exception{
		return empDAO.getPositionNo(deptNo);
	}
	
	public List<DeptVO> getDeptNo(DeptVO deptVO)throws Exception{
		return empDAO.getDeptNo();
	}

	// sign 
	
	// sign List
	
	public EmpVO signList(EmpVO empVO)throws Exception{
		
		return empDAO.signList(empVO);
	}
	
	public int signAdd(EmpVO empVO, MultipartFile[] files) throws Exception{
		int result = 0;
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManger.save(this.uploadPath+this.signNo, multipartFile);
			empVO.setUploadName(fileName);
			empVO.setOriginalSignName(multipartFile.getOriginalFilename());
			empVO.setUsername(empVO.getUsername());

	        int insertResult = empDAO.signAdd(empVO);

	        if (insertResult > 0) {
	            // 각 파일에 대한 삽입이 성공한 경우에만 결과 누적
	            result += insertResult;
	        }
	    }
		
		return result;
	}
}

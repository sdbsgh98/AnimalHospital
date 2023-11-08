package com.vet.main.emp;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.Pager;
import com.vet.main.dept.DeptVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/emp/*")
public class EmpController {

	@Autowired
	private EmpService empService;

	// 로그인 페이지
	
	@GetMapping("login")
	public String getLogin(@ModelAttribute EmpVO empVO)throws Exception{
		//SecurityContext context = SecurityContextHolder.getContext();

		return "emp/login";
	}
	
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception {

		session.invalidate();
		
		return "redirect:../";
	}
	
	// 비밀번호 수정페이지
	@GetMapping("pwUpdate")
	public String pwUpdate(EmpVO empVO, Model model) throws Exception{
		empVO = empService.empDetail(empVO);
		model.addAttribute("vo", empVO);
		return "emp/pwUpdate";
	}
	
	@PostMapping("pwUpdate")
	public String pwUpdate(EmpVO empVO) throws Exception{
		int result = empService.pwUpdate(empVO);
		return "emp/login";
	}
	
	@GetMapping("/sendMail")
	public String sendMail(EmpVO empVO)throws Exception{
		return "emp/sendMail";
	}
	
	
	@GetMapping("findUsername")
	public String findUsername(EmpVO empVO)throws Exception{
		return "emp/findUsername";
	}
	
	// 사원번호 찾기
	@PostMapping("findUsername")
	public String findUsername(EmpVO empVO, Model model)throws Exception{
		EmpVO user = empService.findUsername(empVO);
		
		if(user == null) {
			model.addAttribute("check", 1);

		}else {
			model.addAttribute("check", 0);
			model.addAttribute("username", user.getUsername());

		}
		
		return "emp/findUsername";
	}
	
	// 마이페이지
	
	@GetMapping("mypage")
	public String mypage (EmpVO empVO, Model model) throws Exception{
		
	    empVO = empService.mypage(empVO);
	    model.addAttribute("vo", empVO);

	    empVO = empService.signList(empVO);
	    model.addAttribute("sign", empVO);
	    
		return "emp/mypage";
	}

	// 마이페이지 수정
	@GetMapping("mypageUpdate")
	public String mypageUpdate(EmpVO empVO, Model model)throws Exception{
		empVO = empService.mypage(empVO);
		model.addAttribute("vo", empVO);
		return "emp/mypageUpdate";
		
	}
	
	@PostMapping("mypageUpdate")
	public String mypageUpdate(EmpVO empVO, MultipartFile[] files)throws Exception{
		int result = empService.mypageUpdate(empVO, files);
		return "redirect:./mypage?username="+empVO.getUsername();
		
	}
		
	// 직원 목록
	
	@GetMapping("empList")
	public String empList(Pager pager,Model model)throws Exception{
		List<EmpVO> ar = empService.empList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "emp/empList";
	}
	
	// 신규직원 추가 페이지
	
//	@GetMapping("empAdd2")
//	public void empAdd(@ModelAttribute EmpVO empVO)throws Exception{
//
//	}
	
	@ResponseBody
	@RequestMapping(value = "/empList/empAdd", method = RequestMethod.POST)
	public String empAdd(@Valid EmpVO empVO, BindingResult bindingResult) throws Exception{
//		boolean check = empService.getEmpError(empVO, bindingResult);
//		
//		if(bindingResult.hasErrors() || check) {
//			return "emp/empList";
//		}
//		
		int result = empService.empAdd(empVO);
		return "redirect:./empList";
	}
	
	// 직원 상세
	@GetMapping("empDetail")
	public String empDetail (EmpVO empVO, Model model) throws Exception{
		empVO = empService.empDetail(empVO);
		model.addAttribute("vo",empVO);
		
		return "emp/empDetail";
	}
	
	// 직원 수정(부서, 직급 수정)
	@GetMapping("empUpdate")
	public String empUpdate(EmpVO empVO, DeptVO deptVO, Model model) throws Exception{
		List<DeptVO> ar = empService.getDeptNo(deptVO);
		List<DeptVO> po = empService.getPositionNo(deptVO);
		empVO = empService.empDetail(empVO);
		
		model.addAttribute("po", po);
		model.addAttribute("dept", ar);
		model.addAttribute("vo", empVO);
		return "emp/empUpdate";
	}
	
	@PostMapping("empUpdate")
	public String empUpdate(EmpVO empVO) throws Exception{
		int result = empService.empUpdate(empVO);
		return "redirect:./empList";
	}
	
	
	// 비밀번호 찾기
	@GetMapping("findPw")
	public String findPw(EmpVO empVO, Model model) throws Exception{
		
		return "emp/findPw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emp/login/findPassword", method = RequestMethod.POST)
	public String findPw(HttpServletRequest request, Model model, @RequestParam String username, 
			@RequestParam String empName, @RequestParam String email, EmpVO empVO) throws Exception {
//		try {
//			empVO.setUsername(username);
//			empVO.setEmpName(empName);
//			empVO.setEmail(email);
//			
//			int search = empService.pwdCheck(empVO);
//			
//			if(search == 0) {
//				model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.")
//			}
//			
//			String newPw = Randoms
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		return "redirect: ./login";
	}

	// sign
	
	@GetMapping("signAdd")
	public String signAdd(EmpVO empVO, Model model)throws Exception{
		
		return "emp/signAdd";
	}
	
	@PostMapping("signAdd")
	public String signAdd(EmpVO empVO, MultipartFile[] files) throws Exception{
		int result = empService.signAdd(empVO, files);
		
		return "redirect:./mypage?username="+empVO.getUsername();
	}

//	@ResponseBody
//	@RequestMapping(value = "/emp/signAdd", method = RequestMethod.POST)
//	public String signAdd(EmpVO empVO, MultipartFile[] files) throws Exception{
//		int result = empService.signAdd(empVO, files);
//		
//		return "redirect:./mypage?username="+empVO.getUsername();
//	}
}

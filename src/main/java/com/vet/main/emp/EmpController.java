package com.vet.main.emp;

import java.util.List;

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
	public String pwUpdate(EmpVO empVO, Model model) throws Exception {
		empVO = empService.mypage(empVO);
		model.addAttribute("vo",empVO);
	    model.addAttribute("pwVO", new PwVO());
	    return "emp/pwUpdate";
	}

	@PostMapping("pwUpdate")
	public String pwUpdate(@Valid PwVO pwVO, BindingResult bindingResult) throws Exception {
	    boolean check = empService.getPwError(pwVO, bindingResult);
	    int result = empService.pwUpdate(pwVO);

	    if (check == false) {
	        pwVO.setRandomPw(1);
	        return "redirect:/emp/login"; 
	    } else {
	        return "emp/pwUpdate";
	    }
	}
	
	// 비밀번호 찾기
	@GetMapping("findUser")
	public String findUser(FindVO findVO, Model model) throws Exception{
				
		return "emp/findUser";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emp/find", method = RequestMethod.POST)
	public String checkUser(FindVO findVO, @RequestParam String username, @RequestParam String empName, @RequestParam String email,Model model) throws Exception {
		model.addAttribute("username", findVO.getUsername());
		model.addAttribute("email", findVO.getEmail());
		model.addAttribute("empName", findVO.getEmpName());
		
		findVO = empService.findUser(findVO);
		
		if(findVO == null) {
			model.addAttribute("check", 1);

		}else {
			model.addAttribute("check", 0);
		}
		
		boolean userExists = empService.checkUser(username, empName, email);

	    return userExists ? "success" : "failure";
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
	
	@ResponseBody
	@RequestMapping(value = "/empList/empAdd", method = RequestMethod.POST)
	public String empAdd(@Valid AddVO addVO, BindingResult bindingResult, Model model) throws Exception{
		boolean check = empService.getEmpError(addVO, bindingResult);
		    

		    if (check) {
		    	model.addAttribute("vo", addVO);
		        return "emp/empList/empAdd"; 
		    } 
		    int result = empService.empAdd(addVO);
		
		    return "redirect:./empList";
//		if (bindingResult.hasErrors()) {
//	        return "error"; // 폼 유효성 검사 실패 시 "error" 반환
//	    }
//		int result = empService.empAdd(empVO);
//		
//	    if (result > 0) {
//	        return "success"; // 등록 성공 시 "success" 반환
//	    } else {
//	        return "fail"; // 등록 실패 시 "fail" 반환
//	    }
	}
	
	@RequestMapping(value = "/emp/sendMailAdd", method = RequestMethod.POST)
	@ResponseBody
	public void sendMailAdd(@RequestParam String email,@RequestParam String username,@RequestParam String phone) throws Exception {
	    empService.sendMailUser(email,username,phone);
	}
	
	// 직원 상세
	@GetMapping("empDetail")
	public String empDetail (EmpVO empVO, Model model) throws Exception{
		empVO = empService.empDetail(empVO);
		model.addAttribute("vo",empVO);
		
		return "emp/empDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emp/findEmail", method = RequestMethod.POST)
	public String checkEmail(FindVO findVO, @RequestParam String email,Model model) throws Exception {
		model.addAttribute("email", findVO.getEmail());
		
		findVO = empService.findUser(findVO);
		
		if(findVO == null) {
			model.addAttribute("check", 1);

		}else {
			model.addAttribute("check", 0);
		}
		
		boolean userExists = empService.checkEmail(email);

	    return userExists ? "success" : "failure";
	}
	
	// 직원 수정(부서, 직급 수정)
	@GetMapping("empUpdate")
	public String empUpdate(EmpVO empVO, DeptVO deptVO, Model model) throws Exception{
		List<DeptVO> ar = empService.getDeptNo(deptVO);
		empVO = empService.empDetail(empVO);
		
		model.addAttribute("dept", ar);
		model.addAttribute("vo", empVO);
		return "emp/empUpdate";
	}
	
	@PostMapping("empUpdate")
	public String empUpdate(EmpVO empVO) throws Exception{
		int result = empService.empUpdate(empVO);
		return "redirect:./empList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emp/getPositionsByDept", method = RequestMethod.GET)
	public List<DeptVO> getPositionsByDept(@RequestParam("deptNo") String deptNo) throws Exception {
	    List<DeptVO> positions = empService.getPositionNo(deptNo);
	    return positions;
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

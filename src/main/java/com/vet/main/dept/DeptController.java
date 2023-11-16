package com.vet.main.dept;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vet.main.commons.DeptPager;
import com.vet.main.commons.DeptPager2;
import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpService;
import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/dept/*")
@Slf4j
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	@Autowired
	private EmpService empService;
	
	@GetMapping("deptList")
	public String deptList(Model model, DeptPager deptPager, DeptVO deptVO)throws Exception{
		List<DeptVO> ar = deptService.deptList();
		List<DeptVO> emp = deptService.getEmpList(deptPager);
		List<DeptVO> dept = deptService.selectDept();
		
		deptVO = deptService.deptDetail(deptVO);
		model.addAttribute("dept", dept);
		model.addAttribute("emp", emp);
		model.addAttribute("list", ar);
		model.addAttribute("vo", deptVO);
		model.addAttribute("pager", deptPager);
		
		return "dept/deptList";
	} 
	
	
	//부서 등록 (modal)
	
	@ResponseBody
	@RequestMapping(value = "/deptList/deptAdd", method = RequestMethod.POST)
	public String deptAdd(DeptVO deptVO)throws Exception{
		int result = deptService.deptAdd(deptVO);
		return "redirect:./deptList";
	}
	
	//부서 수정

	@RequestMapping(value = "/dept/deptUpdate", method = RequestMethod.POST)
	public String deptUpdate(DeptVO deptVO)throws Exception{
		log.info("==================={}", deptVO);
		int result = deptService.deptUpdate(deptVO);
//		return "redirect:./deptManage?deptNo="+deptVO.getDeptNo();
		return "redirect:./deptList";
	}
	
//	@RequestMapping(value = "/dept/positionUpdate", method = RequestMethod.POST)
//	public String positionUpdate(DeptVO deptVO)throws Exception{
//		int result = deptService.positionUpdate(deptVO);
//		return "redirect:./deptDetail?deptNo="+deptVO.getDeptNo();
//	}
	
	// 부서 삭제
	
	@GetMapping("deptDelete")
	public String deptDelete(DeptVO deptVO)throws Exception{
		int result = deptService.deptDelete(deptVO);
		
		return "redirect:./deptList";
	}

	// 직급 삭제
	
	@GetMapping("positionDelete")
	public String positionDelete(DeptVO deptVO) throws Exception {
	    int result = deptService.positionDelete(deptVO);

	    return "redirect:./deptManage?deptNo=" + deptVO.getDeptNo();
	}
	
	//부서 관리 페이지
	
	@GetMapping("deptManage")
	public String deptManage(DeptVO deptVO, Model model) throws Exception{
		List<DeptVO> ar = empService.getDeptNo(deptVO);
		List<DeptVO> select = deptService.selectDept();
		List<DeptVO> deptPosition = deptService.getDeptPosition(deptVO);

		deptVO = deptService.deptDetail(deptVO);
		model.addAttribute("dept", ar);
		model.addAttribute("select", select);
		model.addAttribute("vo", deptVO);
		model.addAttribute("deptPosition", deptPosition);
		return "dept/deptManage";
	}

	@GetMapping("deptDetail")
	public String deptDetail(DeptVO deptVO, Model model, DeptPager2 deptPager2)throws Exception{
		List<DeptVO> ar = deptService.deptList(); //조직도
		List<DeptVO> emp = deptService.detailEmp(deptPager2); //사원list
		List<DeptVO> dept = deptService.selectDept();
		List<DeptVO> deptPosition = deptService.getDeptPosition(deptVO);
		
		deptVO = deptService.deptDetail(deptVO);
		model.addAttribute("dept", dept);
		model.addAttribute("emp", emp);
		model.addAttribute("list", ar);
		model.addAttribute("vo", deptVO);
		model.addAttribute("deptPosition", deptPosition);
		model.addAttribute("pager", deptPager2);
		return "dept/deptDetail";
	}

	// 직급추가
	
	@RequestMapping(value = "/dept/positionAdd", method = RequestMethod.POST)
	public String positionAdd(DeptVO deptVO)throws Exception{
		int result = deptService.positionAdd(deptVO);
	
		return "redirect:./deptManage?deptNo="+deptVO.getDeptNo();
	}

	

	
}


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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vet.main.commons.Pager;

@Controller
@RequestMapping("/dept/*")
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	@GetMapping("deptList")
	public String deptList(Model model, Pager pager)throws Exception{
		List<DeptVO> ar = deptService.deptList();
		List<DeptVO> emp = deptService.getEmpList(pager);
		List<DeptVO> dept = deptService.selectDept();
		
		model.addAttribute("dept", dept);
		model.addAttribute("emp", emp);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "dept/deptList";
	} 
	
//	@GetMapping("deptList")
//	public ModelAndView deptList(ModelAndView mv) {
//		mv.setViewName("dept/deptList");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/dept/deptList", method = RequestMethod.POST)
//	@ResponseBody
//	public List<DeptVO> deptList(DeptVO deptVO, Model model)throws Exception{
//		List<DeptVO> ar = deptService.deptList();
//		return ar;
//	}
	
	//부서 등록 (modal)
	
	@ResponseBody
	@RequestMapping(value = "/deptList/deptAdd", method = RequestMethod.POST)
	public String deptAdd(DeptVO deptVO)throws Exception{
		int result = deptService.deptAdd(deptVO);
		return "redirect: ./deptList";
	}
	
	//부서 수정 (modal)
	
	@ResponseBody
	@RequestMapping(value = "/deptList/deptUpdate", method = RequestMethod.POST)
	public String deptUpdate(DeptVO deptVO)throws Exception{
		int result = deptService.deptUpdate(deptVO);
		return "redirect: ./deptList";
	}
	
	// 부서 삭제
	
	@ResponseBody
	@RequestMapping(value = "/deptList/deptDelete", method = RequestMethod.GET)
	public String deptDelete(DeptVO deptVO)throws Exception{
		int result = deptService.deptDelete(deptVO);
		return "redirect: ./deptList";
	}
}
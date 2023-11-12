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
import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpService;
import com.vet.main.emp.EmpVO;

@Controller
@RequestMapping("/dept/*")
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
		return "redirect: ./deptList";
	}
	
	//부서 수정
	
	@PostMapping("deptUpdate")
	public String deptUpdate(DeptVO deptVO)throws Exception{
		int result = deptService.deptUpdate(deptVO);
		return "redirect:./deptDetail?deptNo="+deptVO.getDeptNo();
	}
	
	// 부서 삭제
	
//	@ResponseBody
//	@RequestMapping(value = "/deptList/deptDelete", method = RequestMethod.GET)
//	public String deptDelete(DeptVO deptVO)throws Exception{
//		int result = deptService.deptDelete(deptVO);
//		return "redirect:./deptList";
//	}
	
	@GetMapping("deptDelete")
	public String deptDelete(DeptVO deptVO)throws Exception{
		int result = deptService.deptDelete(deptVO);
		
		return "redirect:./deptList";
	}
	
	//부서 관리 페이지
	
	@GetMapping("deptManage")
	public String deptManage(DeptVO deptVO, Model model, DeptPager deptPager) throws Exception{
		List<DeptVO> ar = empService.getDeptNo(deptVO);
		List<DeptVO> emp = deptService.getEmpList(deptPager);
		List<DeptVO> select = deptService.selectDept();
		List<DeptVO> position = deptService.deptPosition();
		
		deptVO = deptService.deptDetail(deptVO);
		model.addAttribute("dept", ar);
		model.addAttribute("emp", emp);
		model.addAttribute("select", select);
		model.addAttribute("vo", deptVO);
		model.addAttribute("po", position);
		return "dept/deptManage";
	}
	
//	@ResponseBody
//    @RequestMapping(value = "/getPositionNo", method = RequestMethod.GET)
//    public List<DeptVO> getPositionNo(@RequestParam("deptNo") int deptNo) throws Exception{
//
//        List<DeptVO> positions = deptService.getPositionNo(deptNo);
//        
//        return positions;
//	}
	
	@GetMapping("deptDetail")
	public String deptDetail(DeptVO deptVO, Model model, DeptPager deptPager)throws Exception{
		List<DeptVO> ar = deptService.deptList(); //조직도
		List<DeptVO> emp = deptService.detailEmp(deptPager); //사원list
		List<DeptVO> dept = deptService.selectDept();
		List<DeptVO> position = deptService.deptPosition();
		
		deptVO = deptService.deptDetail(deptVO);
		model.addAttribute("dept", dept);
		model.addAttribute("emp", emp);
		model.addAttribute("list", ar);
		model.addAttribute("vo", deptVO);
		model.addAttribute("po", position);
		model.addAttribute("pager", deptPager);
		return "dept/deptDetail";
	}

	// 부서 상세

	
//    @GetMapping("dept/deptDetail")
//    @ResponseBody
//    public String getDeptDetails(@RequestParam("deptNo") String deptNo) {
//        try {
//            DeptVO deptVO = deptService.getDeptDetails(deptNo);        	
//            return "<div>"+"<table>"
//            		+ "<th>부서번호<th>"+ "<tr>"+"<td>" + deptVO.getDeptNo() + "</td>"+"</tr>"+
//            		"<th>부서명</th>"+ "<tr>"+ "<td>" +deptVO.getDeptName()+ "</td>" +"</tr>"+
//            		"<th>상위부서번호</th>"+ "<tr>"+ "<td>" + deptVO.getParentNo()+ "</td>" +"</tr>"+
//            		"</table>"+"</div>";
//        } catch (Exception e) {
//            // Handle exception
//            return "에러";
//        }
//    }
	
}

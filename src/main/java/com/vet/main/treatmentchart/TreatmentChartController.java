package com.vet.main.treatmentchart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vet.main.commons.Pager;
import com.vet.main.customer.CustomerService;
import com.vet.main.customer.CustomerVO;

@Controller
@RequestMapping("/treatmentchart/*")
public class TreatmentChartController {
	
	@Autowired
	private TreatmentChartService treatmentChartService;
	
	@Autowired
	private CustomerService customerService;
	
	//진료차트목록
	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception {
		List<TreatmentChartVO> ar = treatmentChartService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "treatmentchart/list";
	}
	
	//진료차트추가
	@GetMapping("add")
	public String setAdd(CustomerVO customerVO, Model model) throws Exception {
		customerVO = customerService.getDetail(customerVO);
		model.addAttribute("vo", customerVO);
		return "treatmentchart/add";
	}
	
	@PostMapping("add")
	public String setAdd(TreatmentChartVO treatmentChartVO) throws Exception {
		int result = treatmentChartService.setAdd(treatmentChartVO);
		
		return "redirect:./list";
	}
	
	//진료차트상세
	@GetMapping("detail")
	public String getDetail(TreatmentChartVO treatmentChartVO, Model model) throws Exception {
		treatmentChartVO = treatmentChartService.getDetail(treatmentChartVO);
		model.addAttribute("vo", treatmentChartVO);
		
		return "treatmentchart/detail";
	}
	
	//진료차트수정
	@GetMapping("update")
	public String setUpdate(TreatmentChartVO treatmentChartVO, Model model) throws Exception {
		treatmentChartVO = treatmentChartService.getDetail(treatmentChartVO);
		model.addAttribute("vo", treatmentChartVO);
		
		return "treatmentchart/update";
	}
	
	@PostMapping("update")
	public String setUpdate(TreatmentChartVO treatmentChartVO) throws Exception {
		int result = treatmentChartService.setUpdate(treatmentChartVO);
		
		return "redirect:./list";
	}
	
}
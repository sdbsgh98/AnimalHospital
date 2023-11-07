package com.vet.main.treatmentchart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.Pager;
import com.vet.main.customer.CustomerService;
import com.vet.main.customer.CustomerVO;
import com.vet.main.emp.EmpService;
import com.vet.main.emp.EmpVO;
import com.vet.main.medicine.MedicineVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/treatmentchart/*")
@Slf4j
public class TreatmentChartController {
	
	@Autowired
	private TreatmentChartService treatmentChartService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private EmpService empService;
	
	//진료차트목록
	@GetMapping("list")
	public String getList(Pager pager, Model model, CustomerVO customerVO, EmpVO empVO) throws Exception {
		List<TreatmentChartVO> ar = treatmentChartService.getList(pager);
		customerVO = customerService.getDetail(customerVO);
		empVO = empService.empDetail(empVO);
		model.addAttribute("vo", customerVO);
		model.addAttribute("emp", empVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "treatmentchart/list";
	}
	
	//진료차트추가
	@GetMapping("add")
	public String setAdd(CustomerVO customerVO, EmpVO empVO, Model model) throws Exception {
		customerVO = customerService.getDetail(customerVO);
		empVO = empService.empDetail(empVO);
		model.addAttribute("emp", empVO);
		model.addAttribute("vo", customerVO);
		return "treatmentchart/add";
	}
	
	@PostMapping("add")
	public String setAdd(TreatmentChartVO treatmentChartVO, MultipartFile[] files) throws Exception {
		int result = treatmentChartService.setAdd(treatmentChartVO, files);
		
		return "redirect:./list?customerNo="+treatmentChartVO.getCustomerNo();
	}
	
	//진료차트상세
	@GetMapping("detail")
	public String getDetail(TreatmentChartVO treatmentChartVO, CustomerVO customerVO, EmpVO empVO, Model model) throws Exception {
		treatmentChartVO = treatmentChartService.getDetail(treatmentChartVO);
		customerVO = customerService.getDetail(customerVO);
		empVO = empService.empDetail(empVO);
		
		model.addAttribute("cus", customerVO);
		model.addAttribute("emp", empVO);
		model.addAttribute("vo", treatmentChartVO);
		
		return "treatmentchart/detail";
	}
	
	//진료차트수정
	@GetMapping("update")
	public String setUpdate(TreatmentChartVO treatmentChartVO, CustomerVO customerVO, EmpVO empVO, Model model) throws Exception {
		treatmentChartVO = treatmentChartService.getDetail(treatmentChartVO);
		customerVO = customerService.getDetail(customerVO);
		empVO = empService.empDetail(empVO);
		
		model.addAttribute("cus", customerVO);
		model.addAttribute("emp", empVO);
		model.addAttribute("vo", treatmentChartVO);
		
		return "treatmentchart/update";
	}
	
	@PostMapping("update")
	public String setUpdate(TreatmentChartVO treatmentChartVO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = treatmentChartService.setUpdate(treatmentChartVO, files, session);
		
		return "redirect:./list?customerNo="+treatmentChartVO.getCustomerNo();
	}
	
	//파일삭제
	@GetMapping("fileDelete")
	public String setFileDelete(TreatmentChartFileVO treatmentChartFileVO, Model model) throws Exception {
		int result = treatmentChartService.setFileDelete(treatmentChartFileVO);
		
		if(result > 0) {
			log.info("파일삭제 성공");
		}else {
			log.info("파일삭제 실패");
		}
		
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("medicineList")
	public String getMedicineList(Model model) throws Exception {
		List<MedicineVO> list = treatmentChartService.getMedicineList();
		model.addAttribute("list", list);
		
		return "treatmentchart/empList";
	}
	
}

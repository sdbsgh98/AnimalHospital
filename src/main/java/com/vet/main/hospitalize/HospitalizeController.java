package com.vet.main.hospitalize;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vet.main.customer.CustomerVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hospitalize/*")
@Slf4j
public class HospitalizeController {
	
	@Autowired
	private HospitalizeService hospitalizeService;

	@GetMapping
	public String setHospitalize1()throws Exception{
		
		return "/hospitalize/add";
	}
	
	@PostMapping("add")
	@ResponseBody
	public int setHospitalize(HospitalizeVO hospitalizeVO)throws Exception{
		int result = hospitalizeService.searchReserved(hospitalizeVO);
		int rst = 0;
		if(result==0) {
			rst = hospitalizeService.setHospitalize(hospitalizeVO);			
		}		
		return rst;
			
	}
	
	@PostMapping("customerList")
	@ResponseBody
	public List<CustomerVO> getCustomerList(String animalName)throws Exception{
		List<CustomerVO> list =hospitalizeService.getCustomerList(animalName);
		
		return list;
	}
	
	@PostMapping("customer")
	@ResponseBody
	public CustomerVO getCustomer(CustomerVO customerVO)throws Exception{
		customerVO = hospitalizeService.getCustomer(customerVO);
		
		return customerVO;
	}
	
	@GetMapping("list")
	public String getHosList() {
		return "/hospitalize/list";
	}
	
	
	@PostMapping("list")
	@ResponseBody
	public List<HospitalizeVO> getHospitalize()throws Exception{
		List<HospitalizeVO> list = hospitalizeService.getHospitalize();
		
		return list;
	}
	
	@GetMapping("update")
	public String setUpdate(Model model,Long historyNo)throws Exception {
		HospitalizeVO hospitalizeVO =  hospitalizeService.getDetail(historyNo);
		log.info("**** detail vo확인{}******", hospitalizeVO);
		
		model.addAttribute("vo", hospitalizeVO);

		return "/hospitalize/update";
	}
	
	@PostMapping("update")
	@ResponseBody
	public int setUpdate(Model model,HospitalizeVO hospitalizeVO)throws Exception {
		log.info("$$$$VO확인$$$$$${}", hospitalizeVO);
		int rst=0;
		int result = hospitalizeService.searchReserved(hospitalizeVO);
		
		if(result ==0) {
			rst= hospitalizeService.setUpdate(hospitalizeVO);
		}else {
			rst=0;
		}				

		return rst;
	}
	
	@GetMapping("delete")
	public String setDelete(HospitalizeVO hospitalizeVO)throws Exception{
		hospitalizeService.setDelete(hospitalizeVO);
		
		return "redirect:./list";
	}
	
	

	
	
}

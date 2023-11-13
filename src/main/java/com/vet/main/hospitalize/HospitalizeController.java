package com.vet.main.hospitalize;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String setHospitalize()throws Exception{
		
		return "/hospitalize/add";
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

	
	
}

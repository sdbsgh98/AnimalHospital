package com.vet.main.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.vet.main.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/customer/*")
@Slf4j
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	//고객목록
	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception {
		List<CustomerVO> ar = customerService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "customer/list";
	}
	
	//고객추가
	@GetMapping("add")
	public String setAdd() throws Exception {
		
		return "customer/add";
	}
	
	@PostMapping("add")
	public String setAdd(CustomerVO customerVO, MultipartFile[] files) throws Exception {
		int result = customerService.setAdd(customerVO, files);
		
		return "redirect:./list";
	}
	
	//고객상세
	@GetMapping("detail")
	public String getDetail(CustomerVO customerVO, Model model) throws Exception {
		customerVO = customerService.getDetail(customerVO);
		model.addAttribute("vo", customerVO);
		
		return "customer/detail";
	}
	
//	@GetMapping("detail")  
//	public ModelAndView getDetail(CustomerVO customerVO, ModelAndView mv) throws Exception {
//		customerVO = customerService.getDetail(customerVO);
//		mv.addObject("vo", customerVO);
//		mv.addObject("customer", );
//		mv.setViewName("customer/detail");
//		
//		return mv;
//	}
	
	//고객수정
	@GetMapping("update")
	public String setUpdate(CustomerVO customerVO, Model model) throws Exception {
		customerVO = customerService.getDetail(customerVO);
		model.addAttribute("vo", customerVO);
		
		return "customer/update";
	}
	
	@PostMapping("update")
	public String setUpdate(CustomerVO customerVO, MultipartFile[] files, HttpSession session, Model model) throws Exception {
		int result = customerService.setUpdate(customerVO, files, session);
		
		return "redirect:./list?customerNo="+customerVO.getCustomerNo();
	}
	
	//고객삭제
	@GetMapping("delete")
	public String setDelete(CustomerVO customerVO) throws Exception {
		int result = customerService.setDelete(customerVO);
		
		return "redirect:./list";
	}
	
	//사진삭제
	@PostMapping("fileDelete")
	public String updateFileDelete(CustomerFileVO customerFileVO, Model model) throws Exception {
		int result = customerService.fileUpdateDelete(customerFileVO);
		
		if(result>0){
			log.info("파일삭제 성공");
		}else {
			log.info("파일삭제 실패");
		}
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
}

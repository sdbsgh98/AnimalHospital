package com.vet.main.emp;

import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmailController {

	private final EmailService emailService;

//	@RequestMapping("emp/sendMail")
//	public String sendMail() {
//		emailService.sendMailTest();
//		
//		return "emp/sendMail";
//	}
	
}

package com.vet.main.emp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmailController {

	private final EmailService emailService;


	@RequestMapping("/sendMail")
	public String sendMail() {
		emailService.sendMailTest();
		
		return "/sendMail";

	}
	
}

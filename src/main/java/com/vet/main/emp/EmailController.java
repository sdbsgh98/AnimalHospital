package com.vet.main.emp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmailController {

	private final EmailService emailService;

//    @ResponseBody
//    @PostMapping("/sendMail")
//    public String MailSend(@RequestParam String email){
//
//        int number = emailService.sendMail(email);
//
//        String num = "" + number;
//
//        return num;
//    }
	

	@RequestMapping(value = "/emp/sendMail", method = RequestMethod.POST)
	@ResponseBody
	public void sendMail(@RequestParam String email) throws Exception {
	    emailService.sendMailTest(email);
	}
	
	
	
}

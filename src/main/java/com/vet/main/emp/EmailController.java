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
	

	@RequestMapping(value = "/emp/sendMail", method = RequestMethod.POST)
	@ResponseBody
	public void sendMail(@RequestParam String email) throws Exception {
	    emailService.sendMailTest(email);
	}
	
	@RequestMapping(value = "/emp/sendMailAdd", method = RequestMethod.POST)
	@ResponseBody
	public void sendMailAdd(@RequestParam String email,@RequestParam String username,@RequestParam String phone) throws Exception {
	    emailService.sendMailUser(email,username,phone);
	}
	
	@ResponseBody
    @RequestMapping(value = "/code", method = RequestMethod.POST)
    public String verifyCode(@RequestParam int code) {
        if (emailService.code(code)) {
            return "success"; 
        } else {
            return "failure";
        }
    }
	
	
}

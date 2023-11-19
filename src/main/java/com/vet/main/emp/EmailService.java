package com.vet.main.emp;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender javaMailSender;
    private int number;
    
    private String username;
    private String phone;
    
    public void getEmp(EmpVO empVO) throws Exception {
    	username = empVO.getUsername();
    	phone = empVO.getPhone();
    	
    }
    
    public void createNumber(){
        number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }

	public void sendMailTest(String email) {
		createNumber();
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("[보듬 동물병원] 인증번호 발송");
		simpleMailMessage.setText("안녕하세요. 보듬 동물병원입니다 :) 인증번호는 "+number+" 입니다.");
		
		javaMailSender.send(simpleMailMessage);
	}
	
    public boolean code(int code) {
        return code == number;
    }

    public void sendMail(String email) {
        sendMailTest(email);
    }
	
//	public void sendMailAdd(String email, String username, String phone) {
//		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
//		
//		simpleMailMessage.setTo(email);
//		simpleMailMessage.setSubject("[동물병원] 로그인 관련 안내입니다.");
//		simpleMailMessage.setText("안녕하세요. 사원번호는 " + username + "이며 비밀번호는 " + phone + "입니다.");
//		
//		javaMailSender.send(simpleMailMessage);
//	}
//	
//    public void sendMailUser(String email, String username, String phone) {
//        sendMailAdd(email, username, phone);
//    }
    
}


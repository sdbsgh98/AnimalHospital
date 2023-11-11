package com.vet.main.emp;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

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

    public void createNumber(){
        number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }

	public void sendMailTest(String email) {
		createNumber();
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("[동물병원] 인증번호 발송");
		simpleMailMessage.setText("안녕하세요, 동물병원입니다. 인증번호는 "+number+" 입니다.");
		
		javaMailSender.send(simpleMailMessage);
	}
	
    public boolean code(int code) {
        return code == number;
    }

    public void sendMail(String email) {
        sendMailTest(email);
    }
	
}


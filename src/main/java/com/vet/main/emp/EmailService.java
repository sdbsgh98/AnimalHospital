package com.vet.main.emp;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class EmailService {

	private final JavaMailSender javaMailSender;
	
	public void sendMailTest() {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		
		simpleMailMessage.setTo("tpdms981@naver.com");
		simpleMailMessage.setSubject("[동물병원] 임시비밀번호 발급");
		simpleMailMessage.setText("안녕하세요, 임시비밀번호는 animal입니다. 로그인 후 변경해주세요.");
		
		javaMailSender.send(simpleMailMessage);
	}
}

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
//
//    public MimeMessage CreateMail(String email){
//        createNumber();
//        MimeMessage message = javaMailSender.createMimeMessage();
//
//        try {
//            message.setFrom(senderEmail);
//            message.setRecipients(MimeMessage.RecipientType.TO, email);
//            message.setSubject("이메일 인증");
//            String body = "";
//            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
//            body += "<h1>" + number + "</h1>";
//            body += "<h3>" + "감사합니다." + "</h3>";
//            message.setText(body,"UTF-8", "html");
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//
//        return message;
//    }
//
//    public int sendMail(String email){
//        MimeMessage message = CreateMail(email);
//        javaMailSender.send(message);
//
//        return number;
//    }
//}
   
	public void sendMailTest(String email) {
		createNumber();
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("[동물병원] 인증번호 발송");
		simpleMailMessage.setText("안녕하세요, 동물병원입니다. 인증번호는 "+number+" 입니다.");
		
		javaMailSender.send(simpleMailMessage);
	}
}


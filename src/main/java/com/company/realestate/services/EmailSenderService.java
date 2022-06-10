package com.company.realestate.services;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailSenderService {
    @Autowired
    private JavaMailSender mailSender;

    @Getter
    @Value("${spring.mail.username}")
    private String username;

    //TODO На google больше не работает автоизация через логин и пароль
    public boolean send(String emailTo, String subject, String message) {
        return true;
//        try {
//            MimeMessage mailMessage = mailSender.createMimeMessage();
//            mailMessage.setSubject(subject);
//            MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);
//            helper.setFrom(username);
//            helper.setTo(emailTo);
//            mailMessage.setContent(message, "text/html; charset=UTF-8");
//            mailSender.send(mailMessage);
//            return true;
//        } catch (MessagingException e) {
//            e.printStackTrace();
//            return false;
//        }
    }
}

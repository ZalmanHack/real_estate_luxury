package com.company.realestate.services;

import com.company.realestate.assets.requestDtos.RequestFeedbackDto;
import com.company.realestate.domains.RegistryFeedback;
import com.company.realestate.repos.RegistryFeedbackRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class RegistryFeedbackService {

    @Autowired
    RegistryFeedbackRepo registryFeedbackRepo;

    @Autowired
    EmailSenderService emailSenderService;

    @Value("${server.ssl.enabled}")
    private boolean isSsl;

    @Value("${host.name}")
    private String hostName;

    public boolean register(RequestFeedbackDto body) {

        RegistryFeedback registryFeedback = new RegistryFeedback();
        registryFeedback.setEmail(body.getEmail());
        registryFeedback.setName(body.getName());
        registryFeedback.setQuestion(body.getQuestion());
        registryFeedback.setSentDate(LocalDate.now());
        registryFeedbackRepo.save(registryFeedback);


        String message = String.format(
                "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "<meta charset=\"UTF-8\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<p><b>User Name:</b> %s</p>\n" +
                        "<p><b>User email:</b> %s</p>\n" +
                        "<p><b>Question:</b> %s</p>\n" +
                        "</html>",
                body.getName(), body.getEmail(), body.getQuestion());

        if(!emailSenderService.send(emailSenderService.getUsername(),
                "Question from " + body.getEmail(), message)) {
            return false;
        }

        message = String.format(
                "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "<meta charset=\"UTF-8\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<p>Hello, %s!</p>\n" +
                        "<p>Your question has been accepted for consideration.</p>\n" +
                        "<p>Expect a response to the specified email address.</p>\n" +
                        "<p>Best regards, administration of %s.</p>" +
                        "</body>\n" +
                        "</html>",
                body.getName(), hostName);

        return emailSenderService.send(body.getEmail(), "Info", message);
    }
}

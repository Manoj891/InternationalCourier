package com.ms.ware.online.solution.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;

@Component
public class EmailService {

    private final String sender = "worldwidecargoc@gmail.com";
    private final String password = "luqs pdjy tvmn ggbc";


    public Res sendmail(String receiver, String subject, String body) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        String smtpPort = "587";
        props.put("mail.smtp.port", smtpPort);
        String smtpHost = "smtp.gmail.com";
        props.put("mail.smtp.host", smtpHost);

        Res res = new Res();
        try {
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(sender, password);
                }
            });

            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(sender, false));

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
            msg.setSubject(subject);
            msg.setContent(body, "text/html");
            msg.setSentDate(new Date());
            Transport.send(msg);
            res.setStatus(true);
            res.setMessage("Successfully sent email");
        } catch (Exception e) {
            res.setMessage(e.getMessage());
            res.setStatus(false);
        }
        return res;
    }

    @Getter
    @Setter
    public static class Res {
        private String message = "Sent";
        private boolean status;
    }


}

package com.example.demo.ServiciosExternos.Notifcaciones;


import jakarta.persistence.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;


@Service
public class ServicioDeNotificacionJavaMail  {
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  public ServicioDeNotificacionJavaMail() {

  }


  //Importante hacer la inyección de dependencia de JavaMailSender:
  @Autowired
  private JavaMailSender mailSender;
  @Autowired
  private ThreadPoolTaskExecutor taskExecutor;
  //Pasamos por parametro: destinatario, asunto y el mensaje
  @Async
  public void notificar(String to, String subject, String content) {
    taskExecutor.execute(() -> {
      SimpleMailMessage email = new SimpleMailMessage();

      email.setTo(to);
      email.setSubject(subject);
      email.setText(content);

      mailSender.send(email);
    });

  }

}

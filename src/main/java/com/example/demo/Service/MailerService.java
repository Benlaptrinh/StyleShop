package com.example.demo.Service;

import com.example.demo.utils.Mail;

import jakarta.mail.MessagingException;

public interface MailerService {
    void send(Mail mail) throws MessagingException;

    void send(String to, String subject, String body) throws MessagingException;

    void queue(Mail mail);

    void queue(String to, String subject, String body);
}

package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Dao.accountDao;
import com.example.demo.model.Account;
import com.example.demo.utils.Bcryptor;
import com.example.demo.utils.Mail;

@Service
public class ForgotPassService {
    @Autowired
    accountDao dao;

    @Autowired
    MailerService mailer;

    public void updateResetPasswordToken(String token, String email) throws Exception {
        Account account = dao.findByEmail(email);
        if (account != null) {
            account.setResetPasswordToken(token);
            dao.save(account);
            System.out.println(account);
        } else {
            throw new Exception("Could not find any account with the email " + email);
        }
    }

    public Account getByResetPasswordToken(String token) {
        System.out.println("getByResetPasswordToken" + token);
        return dao.findByResetPasswordToken(token);
    }

    public void sendEmail(String recipientEmail, String link) {
        Mail mailInfo = new Mail();
        mailInfo.setTo(recipientEmail);
        System.out.println(" mailInfo.setTo(recipientEmail);" + recipientEmail);
        mailInfo.setSubject("Đổi Mk");
        String content = "<p>Hello,</p>"
                + "<p>Bạn đã yêu cầu đặt lại mật khẩu của mình.</p>"
                + "<p>Nhấn vào liên kết dưới đây để thay đổi mật khẩu của bạn:</p>"
                + "<p><a href=\"" + link + "\">Đổi mật khẩu của tôi</a></p>"
                + "<br>"
                + "<p>Nếu bạn không yêu cầu đặt lại mật khẩu hoặc đã nhớ mật khẩu của mình, vui lòng bỏ qua email này.</p>";

        mailInfo.setBody(content);

        try {
            mailer.send(mailInfo);
            System.out.println("Email sent successfully!");
        } catch (Exception e) {
            System.out.println("Failed to send email: " + e.getMessage());
        }
    }

    public void updatePassword(Account account, String newPass) {
        String encodedPass = Bcryptor.encrypt(newPass);
        account.setPassword(encodedPass);
        account.setResetPasswordToken(null);
        dao.save(account);
    }
}

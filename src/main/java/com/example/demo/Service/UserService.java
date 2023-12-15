package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Dao.accountDao;
import com.example.demo.model.Account;
import com.example.demo.utils.Bcryptor;
import com.example.demo.utils.Mail;

import jakarta.mail.MessagingException;
import net.bytebuddy.utility.RandomString;

@Service
public class UserService {
    @Autowired
    accountDao accountDao;

    @Autowired
    MailerService mailer;

    public void register(Account acc, String url) throws MessagingException {
        String encodedPassword = Bcryptor.encrypt(acc.getPassword());
        String randomCode = RandomString.make(10);
        System.out.println("randomCode" + randomCode);
        acc.setPassword(encodedPassword);
        acc.setVerifycode(randomCode);
        acc.setActivated(false);
        acc.setAdmin(false);
        accountDao.save(acc);
        sendVerifyEmail(acc, url);
    }

    public void sendVerifyEmail(Account acc, String url) throws MessagingException {
        Mail mail = new Mail();
        mail.setTo(acc.getEmail());
        mail.setSubject("Xác MinhMail");
        String content = "Chào bạn [[name]],<br>"
                + "Vui lòng nhấp vào liên kết dưới đây để xác nhận việc đăng ký của bạn:<br>"
                + "<h3><a href=\"[[URL]]\" target=\"_self\">XÁC NHẬN</a></h3>"
                + "Cảm ơn bạn,<br>";

        content = content.replace("[[name]]", acc.getId());
        String verifyURL = url + "/verify?code=" + acc.getVerifycode();
        content = content.replace("[[URL]]", verifyURL);
        mail.setBody(content);
        mailer.send(mail);

    }

    public boolean verify(String verifyCode) {
        Account acc = accountDao.findByVerifyCode(verifyCode);
        if (acc == null || acc.getActivated()) {
            return false;
        } else {
            acc.setVerifycode(("0"));
            acc.setActivated(true);
            accountDao.save(acc);
            return true;
        }
    }

    public void save(Account acc) {
        // encode the password with Bcrypt algorithm
        String encodedPassword = Bcryptor.encrypt(acc.getPassword());
        acc.setPassword(encodedPassword);
        acc.setActivated(true);
        accountDao.save(acc);
    }

}

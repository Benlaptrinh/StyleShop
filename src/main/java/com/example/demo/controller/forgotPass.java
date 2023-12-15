package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Dao.accountDao;
import com.example.demo.Service.ForgotPassService;
import com.example.demo.Service.MailerService;
import com.example.demo.model.Account;
import com.example.demo.utils.CommonService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import net.bytebuddy.utility.RandomString;

@Controller
@RequestMapping("mk")
public class forgotPass {
    @Autowired
    accountDao dao;

    @Autowired
    MailerService mailer;

    @Autowired
    ForgotPassService forgotPass;

    @PostMapping("/quenmk")
    public String postsend(ModelMap model, HttpServletRequest req) throws MessagingException {
        String email = req.getParameter("forgotEmail");
        String token = RandomString.make(10);

        if (!dao.existsAccountByEmail(email)) {
            model.addAttribute("message", "Email not existed!!");
            return "redirect:/";
        }
        try {
            forgotPass.updateResetPasswordToken(token, email);
            String resetPasswordLink = CommonService.getSiteURL(req) +
                    "/mk/resetpass?token=" + token;
            forgotPass.sendEmail(email, resetPasswordLink);
            System.out.println("resetPasswordLink" + resetPasswordLink);
            model.addAttribute("message", "We have sent a reset password link to your email. Please check.");

        } catch (Exception e) {
            model.addAttribute("message", "Something went wrong. Please try again later.");
        }
        return "redirect:/";

    }

    @GetMapping("/resetpass")
    public String showResetPasswordForm(@RequestParam String token, ModelMap model) {
        Account account = forgotPass.getByResetPasswordToken(token);

        model.addAttribute("token", token);
        System.out.println(token);
        if (account == null) {
            model.addAttribute("message", "Invalid Token");
            return "message";
        }
        return "/user/doimk";
    }

    @PostMapping("/resetpass")
    public String processResetPassword(HttpServletRequest request, ModelMap model) {
        String token = request.getParameter("token");

        String password = request.getParameter("password");
        Account account = forgotPass.getByResetPasswordToken(token);
        if (account == null) {
            model.addAttribute("message", "Invalid Token");
            return "redirect:/";
        } else {
            forgotPass.updatePassword(account, password);
            model.addAttribute("message", "You have successfully changed your password.");
        }
        return "redirect:/";
    }

}

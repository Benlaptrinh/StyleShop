package com.example.demo.controller;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Dao.accountDao;
import com.example.demo.Service.UserService;
import com.example.demo.model.Account;
import com.example.demo.utils.AccountForm;
import com.example.demo.utils.Bcryptor;
import com.example.demo.utils.CommonService;
import com.example.demo.utils.CookieService;
import com.example.demo.utils.SessionService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class AccountController {

    @Autowired
    accountDao accountDao;

    @Autowired
    CommonService common;

    @Autowired
    UserService UserService;

    @Autowired
    SessionService session;

    @Autowired
    CookieService cookie;

    @Autowired
    UserService userService;

    @GetMapping("/account/login")
    public String getLogin(@RequestParam(required = false) String message,
            @RequestParam(required = false) String error) {
        System.out.println("ne");
        return "user/login";
    }

    @PostMapping("/account/login")
    public ModelAndView postLogin(ModelMap model,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam(required = false) String remember,
            @RequestParam(required = false) String sessionUsername) {

        try {
            Account user = accountDao.findById(username).get();
            if (user != null && Bcryptor.matches(password, user.getPassword())) {
                if (user.getActivated()) {
                    session.set("user", user);
                    session.set("username", username);
                    String uri = session.get("security-uri");
                    if (uri != null) {
                        model.addAttribute("sessionUsername", user.getId());
                        return new ModelAndView("redirect:" + uri, model);
                    } else {
                        if (remember != null) {
                            cookie.add("username", user.getId(), 24);
                            cookie.add("password", user.getPassword(), 24);
                        } else {
                            cookie.remove("username");
                            cookie.remove("password");
                        }
                        CommonService.isLogin = true;
                        model.addAttribute("sessionUsername", user.getId());
                        model.addAttribute("isLogin", true);
                        if (user.getAdmin()) {
                            System.out.println("admin");
                            return new ModelAndView("/admin/index", model);
                        }
                        System.out.println("maneger");
                        return new ModelAndView("/user/index", model);
                    }
                } else {
                    model.addAttribute("message", "Account Của Bạn Đã Bị Khoá");
                    return new ModelAndView("/user/login", model);
                }

            } else {
                model.addAttribute("message", " username Goặc password Sai");
                return new ModelAndView("/user/login", model);

            }
        } catch (Exception e) {
            model.addAttribute("message", "username Không Tồn Tại");
            return new ModelAndView("/user/login", model);
        }
    }

    @GetMapping("/account/signup")
    public String signup(Model Model, @RequestParam(required = false) Optional<AccountForm> form) {
        Model.addAttribute("accForm", new AccountForm());
        return "/user/Dangky";
    }

    @PostMapping("/account/signup")
    public String postSignup(Model Model, @RequestParam MultipartFile image,
            @Valid @ModelAttribute AccountForm accForm, Errors result, HttpServletRequest req)
            throws IOException, MessagingException {

        if (result.hasErrors()) {
            Model.addAttribute("accForm", new AccountForm());
            System.out.println("lỗi");
            return "/user/Dangky";
        } else {
            Account account = new Account();
            BeanUtils.copyProperties(accForm, account);
            // check if account already existed
            if (accountDao.existsAccountById(account.getId())) {
                Model.addAttribute("error", "Account:" + account.getId() + " already exists!!");
                return "redirect:/";
            }
            // check if image name is null
            if (!image.getOriginalFilename().equals("")) {
                account.setImage(image.getOriginalFilename());
            } else {

                if (image.getOriginalFilename() == null) {
                    account.setImage("default.jpg");
                } else {
                    account.setImage(accountDao.getById(account.getId()).getImage());
                    common.saveFile(image, "user");
                }
            }

            userService.register(account, CommonService.getSiteURL(req));

            Model.addAttribute("message", "Please check your email to verify your account");
            return "redirect:/account/Dangky";
        }

    }

    @GetMapping("/verify")
    public String verifyAcc(@RequestParam String code) {
        if (userService.verify(code)) {
            return "/user/Mailthanhcong";
        } else {
            return "/user/Mailthatbai";
        }
    }

    @RequestMapping("/account/changePassword")
    public ModelAndView PostchangePassword(
            @RequestParam String oldPassword, @RequestParam String newPassword,
            @RequestParam String retypePassword, ModelMap modelMap) {
        modelMap.addAttribute("isLogin", true);
        modelMap.addAttribute("sessionUsername", ((Account) session.get("user")).getId());

        try {
            Account user = accountDao.findById(session.get("username")).get();
            System.out.println(user);
            if (user != null) {
                if (!Bcryptor.matches(oldPassword, user.getPassword())) {
                    modelMap.addAttribute("message", "Old password is incorrect!!");
                    return new ModelAndView("redirect:/sanpham", modelMap);
                }
                if (!newPassword.equals(retypePassword)) {
                    modelMap.addAttribute("error", "New password and confirm password didn't matched!!");
                    return new ModelAndView("redirect:/sanpham", modelMap);
                } else if (newPassword.equals("")
                        || retypePassword.equals("")) {
                    modelMap.addAttribute("error", "New password or confirm can't be empty!!");
                    return new ModelAndView("redirect:/sanpham", modelMap);
                } else {
                    user.setPassword(newPassword);
                    userService.save(user);
                    modelMap.addAttribute("message", "User password updated!!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "Invalid password");
        }
        System.out.println(oldPassword);
        System.out.println(newPassword);
        System.out.println(retypePassword);
        return new ModelAndView("redirect:/", modelMap);
    }

    @GetMapping("/account/update")
    public ModelAndView getEditprofile(@RequestParam(required = false) String message,
            @RequestParam(required = false) String error, ModelMap modelMap) {
        Account account = accountDao.getById((String) session.get("username"));
        if (account.getAdmin()) {
            modelMap.addAttribute("message", "Access denied!! Can't edit private account");
            return new ModelAndView("redirect:/account/logout", modelMap);
        }
        modelMap.addAttribute("account", account);
        modelMap.addAttribute("isLogin", CommonService.isLogin);
        return new ModelAndView("user/editprofile", modelMap);
    }

    @PostMapping("/account/update")
    public String postEditprofile(ModelMap modelMap, @RequestParam MultipartFile image,
            @ModelAttribute("account") AccountForm form) {
        Account oldAcc = accountDao.getById((String) session.get("username"));
        Account newAcc = new Account();
        BeanUtils.copyProperties(form, newAcc);

        // check if username is not existed then show error
        if (!accountDao.existsAccountById(newAcc.getId())) {
            modelMap.addAttribute("message", "Username is not existed!!");
            return "redirect:/account/update";
        }

        // check if image name is null
        if (!image.getOriginalFilename().equals("")) {
            newAcc.setImage(image.getOriginalFilename());
        } else {
            if (image.getOriginalFilename() == null) {
                newAcc.setImage("default.jpg");
            } else {
                newAcc.setImage(accountDao.getById(newAcc.getId()).getImage());
            }
        }
        newAcc.setActivated(oldAcc.getActivated());
        newAcc.setAdmin(oldAcc.getAdmin());
        newAcc.setVerifycode(oldAcc.getVerifycode());
        System.out.println("Edit profile: " + newAcc.toString());
        userService.save(newAcc);
        common.saveFile(image, "user");
        return "redirect:/account/update";
    }

    @RequestMapping("/account/logout")
    public ModelAndView logout(ModelMap model, @RequestParam(required = false) String message) {
        CommonService.isLogin = false;
        session.remove("user");
        session.remove("username");
        session.remove("security-uri");
        model.addAttribute("isLogin", false);
        model.addAttribute("message", message);
        return new ModelAndView("redirect:/", model);
    }

}

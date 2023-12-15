package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Dao.productDao;
import com.example.demo.Service.MailerService;
import com.example.demo.Service.ShoppingCartService;
import com.example.demo.model.Account;
import com.example.demo.model.Product;
import com.example.demo.utils.AccountForm;
import com.example.demo.utils.Check;
import com.example.demo.utils.CommonService;
import com.example.demo.utils.Mail;
import com.example.demo.utils.SessionService;

@Controller
public class HomeController {
    @Autowired
    productDao productDao;

    @Autowired
    SessionService sessionService;

    @Autowired
    ShoppingCartService ShoppingCartService;

    @Autowired
    SessionService session;

    @Autowired
    MailerService mailer;

    @GetMapping(value = "/")
    public String getMethodName() {
        return "/user/index";
    }

    @GetMapping("/admin/index")
    public String getAdmin1(Model model, @RequestParam(required = false) Optional<String> sessionUsername) {
        model.addAttribute("sessionUsername", sessionUsername.orElse(((Account) session.get("user")).getId()));
        return "/admin/index";
    }

}

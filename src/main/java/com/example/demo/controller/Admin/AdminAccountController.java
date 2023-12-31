package com.example.demo.controller.Admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Dao.accountDao;
import com.example.demo.Service.ParamService;
import com.example.demo.Service.UserService;
import com.example.demo.controller.report;
import com.example.demo.model.Account;
import com.example.demo.utils.AccountForm;
import com.example.demo.utils.CommonService;
import com.example.demo.utils.CookieService;
import com.example.demo.utils.ExcelExporter;
import com.example.demo.utils.SessionService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminAccountController {
    @Autowired
    accountDao dao;

    @Autowired
    SessionService session;

    @Autowired
    ParamService param;

    @Autowired
    CookieService cookie;

    @Autowired
    CommonService common;

    @Autowired
    UserService userService;

    @GetMapping("/admin/account")
    public String index(@RequestParam(required = false) String message, ModelMap model) {
        model.addAttribute("account", new Account());
        List<Account> accounts = dao.findAll();
        model.addAttribute("accounts", accounts);
        return "/admin/account";
    }

    @RequestMapping("/admin/account/edit/{id}")
    public String edit(@PathVariable String id, ModelMap model) {
        Account account = dao.findById(id).get();
        model.addAttribute("account", account);
        List<Account> accounts = dao.findAll();
        model.addAttribute("accounts", accounts);
        return "admin/account";
    }

    @RequestMapping("/admin/account/delete/{id}")
    public String delete(@PathVariable String id) {
        dao.deleteById(id);
        return "redirect:/admin/account";
    }

    @PostMapping("/admin/account/update")
    public ModelAndView postupdate(ModelMap modelMap, @RequestParam MultipartFile image,
            @ModelAttribute("account") AccountForm form) throws IOException {

        Account account = new Account();
        BeanUtils.copyProperties(form, account);

        // check if username is not existed then show error
        if (!dao.existsAccountById(account.getId())) {
            modelMap.addAttribute("message", "Username is not existed!!");
            return new ModelAndView("redirect:/admin/account", modelMap);
        }

        // check if image name is null
        if (!image.getOriginalFilename().equals("")) {
            account.setImage(image.getOriginalFilename());
        } else {
            Account existingAccount = dao.getReferenceById(account.getId());

            if (existingAccount != null) {
                account.setImage(existingAccount.getImage());
            } else {
                // Xử lý khi không tìm thấy tài khoản
                modelMap.addAttribute("message", "Account not found!!");
                return new ModelAndView("redirect:/admin/account", modelMap);
            }

        }
        userService.save(account);
        modelMap.addAttribute("message", "Update success!!");
        return new ModelAndView("redirect:/admin/account/edit/" + form.getId(), modelMap);
    }

    @PostMapping("/admin/account/create")
    public ModelAndView postCreate(ModelMap modelMap, @RequestParam MultipartFile image,
            @ModelAttribute("account") AccountForm form) throws IOException {
        Account account = new Account();
        BeanUtils.copyProperties(form, account);
        // check if account already existed
        if (dao.existsAccountById(account.getId())) {
            modelMap.addAttribute("error", "Account:" + account.getId() + " already exists!!");
            return new ModelAndView("redirect:/admin/account", modelMap);
        }
        // check if image name is null
        if (image != null && !image.getOriginalFilename().equals("")) {
            account.setImage(image.getOriginalFilename());
        } else {
            account.setImage("default.jpg");
        }
        userService.save(account);
        common.saveFile(image, "user");

        modelMap.addAttribute("message", "Create success!! Username: " + account.getId());
        return new ModelAndView("redirect:/admin/account", modelMap);
    }

    @RequestMapping("/admin/account/sort")
    public String accountSort(ModelMap model, @RequestParam Optional<String> field) {
        Sort sort = Sort.by(Sort.Direction.DESC, field.orElse("id"));
        model.addAttribute("field", field.orElse("id").toUpperCase());
        List<Account> accounts = dao.findAll(sort);
        model.addAttribute("accounts", accounts);
        model.addAttribute("account", new Account());
        return "admin/account";
    }

    @GetMapping("/admin/account/export-excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("appplication/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=accounts_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<Account> listAcc = dao.findAll();
        ExcelExporter<Account> excelExporter = new ExcelExporter<Account>(listAcc, "accounts");
        excelExporter.export(response);
    }
}
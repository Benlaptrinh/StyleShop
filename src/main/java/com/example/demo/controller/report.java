package com.example.demo.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Dao.OrderDetailDAO;
import com.example.demo.Dao.productDao;
import com.example.demo.model.Report;

@Controller
public class report {
    @Autowired
    private productDao productDao;

    @RequestMapping("/admin/revenue")
    public String revenue(ModelMap model) {
        List<Report> reports = productDao.getInventoryByCategory();
        List<Report> reports1 = productDao.getInventoryByCategory1();
        System.out.println(reports);
        model.addAttribute("reports", reports);
        model.addAttribute("reports1", reports1);
        return "admin/thongke";
    }
}

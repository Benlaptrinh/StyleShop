package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Dao.OrderDAO;
import com.example.demo.Service.ParamService;
import com.example.demo.model.Order;

/**
 * OrderController
 */
@Controller
public class OrderController {
    @Autowired
    OrderDAO dao;

    @Autowired
    ParamService paramService;

    @GetMapping("/admin/order")
    public String index(ModelMap model) {
        model.addAttribute("ord", new Order());
        List<Order> ord = dao.findAll();
        model.addAttribute("ords", ord);
        return "admin/order";
    }

    @RequestMapping("/admin/order/edit/{id}")
    public String edit(@PathVariable Integer id, ModelMap model) {
        Order or = dao.findById(id).get();
        System.out.println(or.getId());
        model.addAttribute("ord", or);
        List<Order> ord = dao.findAll();
        model.addAttribute("ords", ord);
        return "admin/order";
    }

    @RequestMapping("/admin/order/delete/{id}")
    public String delete(@PathVariable Integer id) {
        dao.deleteById(id);
        return "redirect:/admin/order";
    }

    @PostMapping("/admin/order/update")
    public String update(Order or) {
        dao.save(or);
        return "redirect:/admin/order/edit/" + or.getId();
    }

    @PostMapping("/admin/order/create")
    public String create(Order or) {
        dao.save(or);
        return "redirect:/admin/order";
    }

}
package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Dao.OrderDAO;
import com.example.demo.Dao.OrderDetailDAO;
import com.example.demo.model.Order;
import com.example.demo.model.OrderDetail;

@Controller
public class RevenueController {
    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private OrderDAO OrderDAO;

    @GetMapping("/admin/revenue/{id}")
    public String index(ModelMap model, @PathVariable Integer id) {
        Order optionalOrder = OrderDAO.findById(id).get();
        List<OrderDetail> ord = orderDetailDAO.findByOrderid(optionalOrder);
        System.out.println(ord + "<---------------");
        model.addAttribute("ords", ord);
        return "admin/chitiet";
    }

}

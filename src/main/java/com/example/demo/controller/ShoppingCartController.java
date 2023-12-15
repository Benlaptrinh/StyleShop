package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Dao.OrderDAO;
import com.example.demo.Dao.OrderDetailDAO;
import com.example.demo.Dao.accountDao;
import com.example.demo.Dao.productDao;
import com.example.demo.Service.ParamService;
import com.example.demo.Service.ShoppingCartService;
import com.example.demo.model.Account;
import com.example.demo.model.Order;
import com.example.demo.model.OrderDetail;
import com.example.demo.model.Product;
import com.example.demo.utils.AccountForm;
import com.example.demo.utils.CommonService;
import com.example.demo.utils.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/cart")
public class ShoppingCartController {
    @Autowired
    productDao productDAO;

    @Autowired
    ParamService param;

    @Autowired
    accountDao accountDAO;

    @Autowired
    OrderDAO orderDAO;

    @Autowired
    OrderDetailDAO orderDetailDAO;

    @Autowired
    SessionService sessionService;

    @Autowired
    ShoppingCartService cartService;

    @RequestMapping("/checkout/{username}")
    public String checkout(@PathVariable String username, ModelMap model, @RequestParam("quantity") String quantity,
            @RequestParam("anotherValue") String Idne, @RequestParam("soluongne") String soluongne,
            @RequestParam("vietne") String diachi) {
        System.out.println(username);
        System.out.println(quantity);
        System.out.println(Idne);
        System.out.println(soluongne);
        System.out.println(diachi);
        double parsedQuantity;
        Integer producidne;
        Integer soluong;
        try {
            parsedQuantity = Double.parseDouble(quantity);
            producidne = Integer.parseInt(Idne);
            soluong = Integer.parseInt(soluongne);
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
            return "errorPage";
        }
        Account acc = accountDAO.findById(username).get();
        Order order = new Order();
        order.setAddress(diachi);
        order.setUsername(acc);
        orderDAO.save(order);
        cartService.clear();
        Product a = productDAO.findById(producidne).get();
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setPrice(parsedQuantity);
        orderDetail.setOrderid(order);
        orderDetail.setProductid(a);
        orderDetail.setIdproduct(producidne);
        orderDetail.setSoluonghienthi(soluong);
        orderDetail.setIdorder(order.getId());
        orderDetailDAO.save(orderDetail);
        sessionService.set("tong", parsedQuantity);
        return "redirect:/cart/view";

    }

    @RequestMapping("/view")
    public String view(ModelMap model, @ModelAttribute AccountForm accForm) {
        Account user = accountDAO.findById(sessionService.get("username")).get();

        model.addAttribute("cartItems", cartService.getCartItems());
        model.addAttribute("totalAmount", cartService.getAmount());
        sessionService.set("cartQuantity", cartService.getCount());
        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", sessionService.get("username"));

        sessionService.set("stdne", user.getPhone());

        return "user/giohang";
    }

    @GetMapping("/add/{id}")
    public ModelAndView add(@PathVariable Integer id, ModelMap model) {
        if (sessionService.get("username") == null) {
            model.addAttribute("message", "Bạn Cần Phải Đăng Nhập Mới Được Mua Hàng");
            return new ModelAndView("user/login");
        } else {
            cartService.add(id);
            sessionService.set("idne", id);
            sessionService.set("cartQuantity", cartService.getCount());
            return new ModelAndView("redirect:/cart/view");
        }

    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable Integer id) {
        cartService.remove(id);
        sessionService.set("cartQuantity", cartService.getCount());
        return "redirect:/cart/view";
    }

    @RequestMapping("/update")
    public String update() {
        Integer id = param.getInt("id", 0);
        int qty = param.getInt("qty", 1);
        if (qty == 0) {
            return "redirect:/cart/remove/" + id;
        }
        cartService.update(id, qty);
        return "redirect:/cart/view";
    }

    @RequestMapping("/clear")
    public String reset() {
        cartService.clear();
        sessionService.set("cartQuantity", cartService.getCount());
        return "redirect:/cart/view";
    }
}

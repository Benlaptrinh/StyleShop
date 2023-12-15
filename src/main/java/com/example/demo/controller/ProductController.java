package com.example.demo.controller;

import java.util.List;
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
import com.example.demo.Dao.categoryDAO;
import com.example.demo.Dao.productDao;
import com.example.demo.Service.ParamService;
import com.example.demo.Service.ShoppingCartService;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.utils.AccountForm;
import com.example.demo.utils.CommonService;
import com.example.demo.utils.CommonUtils;
import com.example.demo.utils.SessionService;

@Controller
public class ProductController {

    @Autowired
    productDao productDAO;

    @Autowired
    categoryDAO categoryDAO;

    @Autowired
    ParamService paramService;

    @Autowired
    SessionService sessionService;

    @Autowired
    CommonUtils common;

    @Autowired
    ShoppingCartService ShoppingCartService;

    @GetMapping(value = "/sanpham")
    public String paginate(@RequestParam Optional<Boolean> isLogin,
            @RequestParam(required = false) Optional<String> sessionUsername,
            @RequestParam(required = false) String error,
            @RequestParam(required = false) String message,
            @RequestParam Optional<Integer> page, ModelMap model) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<Product> pages = productDAO.findAll(pageable);
        model.addAttribute("page", pages);
        model.addAttribute("isLogin", isLogin.orElse(CommonService.isLogin));
        model.addAttribute("sessionUsername", sessionUsername.orElse((String) sessionService.get("username")));
        return "/user/sanpham";
    }

    @GetMapping("/product/detail/{id}")
    public String detail(@PathVariable int id, @ModelAttribute AccountForm accForm, ModelMap model) {
        Product product = productDAO.findById(id).get();
        System.out.println(id + "<------------------");
        System.out.println(product + "<------------------");
        Pageable limit = PageRequest.of(0, 5);
        Page<Product> relevantProducts = productDAO.findAll(limit);

        model.addAttribute("product", product);
        model.addAttribute("relevantProducts", relevantProducts);
        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", sessionService.get("username"));
        return "user/chitietsanpham";
    }

    @RequestMapping("/product/search")
    public String searchAndPage1(ModelMap model, @RequestParam("keywords") Optional<String> kw,
            @RequestParam Optional<Integer> page) {
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        Page<Product> pages;

        try {
            Double dPrice = Double.parseDouble(kwords);
            pages = productDAO.findAllByPriceIs(dPrice, pageable);
        } catch (Exception e2) {
            pages = productDAO.findAllByNameLike("%" + kwords + "%", pageable);
        }

        model.addAttribute("page", pages);
        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", sessionService.get("username"));
        return "/user/sanpham";

    }

    @ModelAttribute("categories")
    public List<Category> getAllCategories() {

        return categoryDAO.findAll();
    }

    @PostMapping("/product/select")
    public String productsByCategory(@RequestParam("category_id") String categoryId, Model model,
            @RequestParam("page") Optional<Integer> page) {
        System.out.println(categoryId);
        List<Product> products = productDAO.findByCustomCategoryId(categoryId);
        model.addAttribute("products", products);

        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", sessionService.get("username"));
        return "/user/sanpham";
    }

}

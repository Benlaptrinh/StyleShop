package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.model.Account;
import com.example.demo.utils.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String uri = request.getRequestURI();
        Account user = (Account) session.get("user");
        String error = "";
        if (user == null) {
            error = "You are not logged in";
        } else if (!user.getAdmin() && uri.startsWith("/admin")) {
            error = "User Not Accessed";
        }

        if (error.length() > 0) {
            session.set("security-uri", uri);
            response.sendRedirect(
                    "/account/login?error=" + error);
            return false;
        }
        return true;
    }

}
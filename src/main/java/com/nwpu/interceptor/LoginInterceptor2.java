package com.nwpu.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor2 implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {

/*        //获取请求的URL
        String url = request.getRequestURI();

        //获取session
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        Object company = session.getAttribute("company");
        Object admin = session.getAttribute("admin");

        *//**
         * 登录后再次访问 /login
         *//*
        //user
        if(url.contains("/login") && user != null) {
            request.getRequestDispatcher("/WEB-INF/pages/user/index.jsp").forward(request, response);
            return false;
        }

        //company
        if(url.contains("/login") && company != null) {
            request.getRequestDispatcher("/WEB-INF/pages/company/index.jsp").forward(request, response);
            return false;
        }

        //admin
        if(url.contains("/login") && admin != null) {
            request.getRequestDispatcher("/WEB-INF/pages/admin/index.jsp").forward(request, response);
            return false;
        }*/

        return true;
    }
}

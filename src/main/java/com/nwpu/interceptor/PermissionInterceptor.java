package com.nwpu.interceptor;

import com.nwpu.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class PermissionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int type = user.getUserType();
        String url = request.getRequestURI();
        System.err.println("拦截器2：" +url);

        if(url.contains("admin")){
            if (type == 2) {
                return true;
            }else {
                response.setStatus(403);
                return false;
            }
        }else if(url.contains("company")){
            if (type == 1) {
                System.out.println("company  放行");
                return true;
            }else {
                response.setStatus(403);
                return false;
            }
        }else {
            if (type == 0) {
                return true;
            }else {
                response.setStatus(403);
                return false;
            }
        }

    }
}

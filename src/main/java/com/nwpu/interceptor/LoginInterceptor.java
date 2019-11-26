package com.nwpu.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {

  /*      //获取请求的URL
        String url = request.getRequestURI();

        //login.jsp或登录请求放行，不拦截
        if(url.contains("/login")){
            return true;
        }

        //获取session
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        Object company = session.getAttribute("company");
        Object admin = session.getAttribute("admin");
        if(user != null || company != null || admin != null){
            return true;
        }

        //没有登录且不是登录页面，转发到登录界面，并给出提示错误信息
        request.setAttribute("msg","还没登录，请先登录!");
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        return false;
*/
  return true;
    }
}

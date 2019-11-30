package com.nwpu.interceptor;

import com.nwpu.domain.User;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {

    private final static Log log = LogFactory.getLog(LoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {

        //获取session
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user != null && user.getUserType()!=null){
            return true;
        }
        log.debug("拦截1");
        //没有登录且不是登录页面，转发到登录界面，并给出提示错误信息
        request.setAttribute("msg","还没登录，请先登录!");
        response.sendRedirect(request.getContextPath()+"/login");
        return false;

    }
}

package com.nwpu.controller.before;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BaseBeforeController {

    public void isLogin(HttpSession session, HttpServletRequest request){
        if(session.getAttribute("user") == null){
            // throw new UserLoginNoException("没有登录);
        }
    }
}

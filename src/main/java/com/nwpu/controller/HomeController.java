package com.nwpu.controller;

import com.nwpu.domain.User;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * 系统主控制类
 */
@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private UserService userService;


    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model){
        return "login";
    }


    /**
     * 登录表单
     * @return
     */
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String showLoginForm(){
        return "login";
    }

    /**
     * 登录请求
     * @param userName
     * @param password
     * @param session
     * @return
     */
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String processLogin(@RequestParam(value = "userName", defaultValue = "") String userName, Model model,
                               @RequestParam(value = "password", defaultValue = "") String password, HttpSession session) {

        System.out.println(userName);
        System.out.println(password);
        User user = userService.findUserByUserNameAndPassword(userName, password);
        // User user = userService.findUserByUserName(userName);
        if(user != null){
            // System.out.println(user);
            session.setAttribute("user", user);

            //普通用户
            if(user.getUserType() == 0){
                return "redirect:/user";
            }

            //公司
            if(user.getUserType() == 1){
                return "redirect:/";
            }

            if(user.getUserType() == 2){
                return "redirect:/";
            }
            return null;

        }else{
            String err_msg = "账号不存在";
            model.addAttribute("msg","用户或密码错误，请重新登录");
            return "login";
        }

    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value="/logout")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        return "redirect:/";
    }
}

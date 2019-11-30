package com.nwpu.controller;

import com.nwpu.Utils.EncodeHandler;
import com.nwpu.domain.User;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * 系统主控制类
 */
@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private UserService userService;





    /**
     * 登录表单
     * @return
     */
    @RequestMapping(value={"/login", ""}, method = RequestMethod.GET)
    public String showLoginForm(HttpSession session) {
        // System.err.println(EncodeHandler.md5Encode("admin"));
        User user = (User) session.getAttribute("user");
        if (user != null) {
            switch (user.getUserType()) {
                case 0:
                    return "redirect:/user";
                case 1:
                    return "redirect:/company";
                case 2:
                    return "redirect:/admin";
                default:
                    break;
            }
        }
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
                               @RequestParam(value = "password", defaultValue = "") String password, HttpSession session,
                               HttpServletResponse response) {

        User user = userService.findUserByUserNameAndPassword(userName, EncodeHandler.md5Encode(password));
        if(user != null) {
            int type = user.getUserType();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(60*60);
            response.addCookie(new Cookie("user", EncodeHandler.Encryption(userName, 5)));
            switch (type) {
                case 0:
                    return "redirect:/user";
                case 1:
                    return "redirect:/company";
                case 2:
                    return "redirect:/admin";
                default:
                    String err_msg = "账号不存在";
                    model.addAttribute("msg", "用户或密码错误，请重新登录");
                    return "login";
            }
        }else {
            String err_msg = "账号不存在";
            model.addAttribute("msg", "用户或密码错误，请重新登录");
            return "login";
        }
    }

    /**
     * 注册
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(){
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid User user, BindingResult result, Model model, HttpSession session, HttpServletResponse response){

        // if(result.hasErrors()){
        //     model.addAttribute("msg", "请完善信息！");
        //     model.addAttribute("user", user);
        //     return "user/register";
        // }
        if(result.hasErrors()){
            List<ObjectError> errorList = result.getAllErrors();
            for (ObjectError error: errorList) {
                System.out.println(error.getDefaultMessage());
                model.addAttribute("msg", error.getDefaultMessage());
                model.addAttribute("user", user);
                return "user/register";
            }
        }

        if(userService.findUserByUserName(user.getUserName()) != null || userService.findUserByUserName(user.getUserName()) != null){
            model.addAttribute("msg", "账号已存在！请重新注册！");
            model.addAttribute("user", user);
            return "user/register";
        }
        user.setPassword(EncodeHandler.md5Encode(user.getPassword()));

        if(userService.addUser(user) == 1) {
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(60 * 60);
            response.addCookie(new Cookie("user", EncodeHandler.Encryption(user.getUserName(), 5)));
            model.addAttribute("msg", "注册成功！请登录！");
            if(user.getUserType()==0){
                return "user/index";
            }
            return "company/index";

        }
        model.addAttribute("msg", "注册失败！请重新注册！");
        model.addAttribute("user", user);
        return "user/register";
    }


    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value="/logout")
    public String logout(HttpSession session, HttpServletRequest request){
        //清除session, cookie
        session.removeAttribute("user");
        session.invalidate();
        for(Cookie cookie: request.getCookies()){
            cookie.setMaxAge(0);
        }
        return "redirect:/";
    }
}

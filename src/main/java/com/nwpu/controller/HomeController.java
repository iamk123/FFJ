package com.nwpu.controller;

import com.nwpu.domain.User;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
     * 登录表单
     * @return
     */
    @RequestMapping(value={"/login", ""}, method = RequestMethod.GET)
    public String showLoginForm(HttpSession session) {
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

        User user = userService.findUserByUserNameAndPassword(userName, password);
        // User user = userService.findUserByUserName(userName);
        if(user != null) {
            int type = user.getUserType();
            //session.invalidate();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(60*60);
            response.addCookie(new Cookie("user", DigestUtils.md5DigestAsHex(userName.getBytes())));
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
            /*//普通用户
            if(user.getUserType() == 0){
                session.setAttribute("user", user);
                System.out.println("user: " + session.getAttribute("user"));
                return "redirect:/user";
            }

            //公司
            if(user.getUserType() == 1){
                session.setAttribute("company", user);
                System.out.println("company: " + session.getAttribute("company"));
                return "redirect:/company";
            }

            if(user.getUserType() == 2){
                session.setAttribute("admin", user);
                System.out.println("admin" + session.getAttribute("admin"));
                return "redirect:/admin";
            }
            return null;

        }else{
            String err_msg = "账号不存在";
            model.addAttribute("msg","用户或密码错误，请重新登录");
            return "login";
        }*/

    }

    /**
     * 注册
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(User user, Model model, HttpSession session, HttpServletResponse response){
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user, Model model){
        System.out.println(user);
        if(userService.findUserByUserName(user.getUserName()) != null ){
            model.addAttribute("msg", "账号已存在！请重新注册！");
            return "user/register";
        }
        if(userService.addUser(user) == 1){
            model.addAttribute("msg", "注册成功！请登录！");
            return "login";
        }
        model.addAttribute("msg", "注册失败！请重新注册！");
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

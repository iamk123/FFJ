package com.nwpu.controller;

import com.nwpu.domain.User;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        User user = userService.findUserByUserNameAndPassword(userName, password);
        // User user = userService.findUserByUserName(userName);
        if(user != null){
            //普通用户
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
     * 修改密码
     * @return
     */
    @GetMapping("/updatePassword")
    public String updatePassword(){

        return "user/password-reset";
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public String updatePassword(HttpSession session, Model model, @ModelAttribute("origin") String origin,
                                 @ModelAttribute("newPassword") String newPassword, @ModelAttribute("confirm") String confirm){

        User user = (User) session.getAttribute("user");
        if("".equals(origin) || "".equals(newPassword) || "".equals(confirm)){
            model.addAttribute("msg", "请完善信息！！");

            return "user/password-reset";
        }
        if(!user.getPassword().equals(origin)){
            model.addAttribute("msg", "原密码错误！");
            return "user/password-reset";
        }
        if(!newPassword.equals(confirm)){
            model.addAttribute("msg", "两次密码不一致！");
            return "user/password-reset";
        }
        if(user.getPassword().equals(newPassword)){
            model.addAttribute("msg", "密码不能与原密码相同！！");
            return "user/password-reset";
        }
        if(userService.updatePassword(user.getId(), newPassword) == 1){
            // model.addAttribute("msg", "修改密码成功！");
            System.out.println("修改成功");
            session.invalidate();
            return "redirect:/";
        }
        return null;
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

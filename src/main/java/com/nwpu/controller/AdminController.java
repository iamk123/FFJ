package com.nwpu.controller;

import com.nwpu.domain.*;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserService userService;
    @Autowired
    JobService jobService;

    /**
     * 首页
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(){

        return "admin/index";
    }

    /**
     * 用户列表
    * @param userType
     * @param currentPage
     * @param rows
     * @param model
     * @return
     */
    @GetMapping("/userList")
    public String getUserList(@RequestParam(value = "userType", defaultValue = "3") int userType,
                              @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                              @RequestParam(value = "rows", defaultValue = "10") int rows, Model model){

        model.addAttribute("users", userService.findAllByPage(userType, currentPage, rows));
        return "admin/userList";
    }

    /**
     * 添加用户
     * @return
     */
    @GetMapping("/userAdd")
    public String addUser(){
        return "/admin/userAdd";
    }

    @PostMapping("/userAdd")
    public void addUser(@Param("user") User user){
        if(user != null){
            System.err.println(user.toString());
            userService.save(user);
        }

    }

    /**
     * 职位列表
     * @param currentPage
     * @param rows
     * @param model
     * @return
     */
    @GetMapping("/jobList")
    public String getJobList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                             @RequestParam(value = "rows", defaultValue = "10") int rows, Model model){

        model.addAttribute("pb", jobService.findAllByPage(currentPage, rows));
        return "/admin/jobList";
    }

    /**
     * 修改密码
     * @return
     */
    @GetMapping("/adminPasswordReset")
    public String updatePassword(){

        return "admin/password-reset";
    }

    @RequestMapping(value = "/adminPasswordReset", method = RequestMethod.POST)
    public String adminPasswordReset(HttpSession session, Model model, @ModelAttribute("origin") String origin,
                                 @ModelAttribute("newPassword") String newPassword, @ModelAttribute("confirm") String confirm){

        User admin = (User) session.getAttribute("user");
        if("".equals(origin) || "".equals(newPassword) || "".equals(confirm)){
            model.addAttribute("msg", "请完善信息！！");
            return "admin/password-reset";
        }
        if(!admin.getPassword().equals(origin)){
            model.addAttribute("msg", "原密码错误！");
            return "admin/password-reset";
        }
        if(!newPassword.equals(confirm)){
            model.addAttribute("msg", "两次密码不一致！");
            return "admin/password-reset";
        }
        if(admin.getPassword().equals(newPassword)){
            model.addAttribute("msg", "密码不能与原密码相同！！");
            return "admin/password-reset";
        }
        if(userService.updatePassword(admin.getId(), newPassword) == 1){
            System.out.println("修改成功");
            session.invalidate();
            return "redirect:/";
        }
        return null;
    }

    /**
     * 查看职位详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/jobDetail/{id}", method = RequestMethod.GET)
    public String jobDetail(@PathVariable int id, Model model){

        Job jobDetail = jobService.findJobCompanyById(id);

        User user = userService.findUserById(jobDetail.getCompany().getUserId());
        model.addAttribute("companyUser",user);
        model.addAttribute("jobDetail", jobDetail);

        return "admin/jobInfo";
    }

    /**
     * 个人基本信息
     * @param session
     * @param model
     * @return
     */
    @GetMapping(value = "/personInfo/{userId}")
    public String personInfo(HttpSession session, @PathVariable int userId, Model model){

        model.addAttribute("resume", userService.findResumeById(userId));
        model.addAttribute("user",userService.findUserById(userId));
        return "admin/personInfo-update";
    }

    /**
     * 更新用户信息

     * @param user
     * @param resume
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    public String updatePersonInfo(Model model, User user,Resume resume){

        if(user.getName() == "" || user.getEmail() == "" || user.getPhone() == "" || resume.getGrade() == "" || resume.getLocation() == ""){
            model.addAttribute("user",user);
            model.addAttribute("resume",resume);
            model.addAttribute("msg", "2");
            return "admin/personInfo-update";
        }

        int affectRows = userService.updateUser(user, resume);
        if(affectRows != 2){
            model.addAttribute("msg", "0");
        }else{
            model.addAttribute("user",userService.findUserById(user.getId()));
            model.addAttribute("resume",userService.findResumeById(user.getId()));
            model.addAttribute("msg", "1");
        }

        return "admin/personInfo-update";
    }


}
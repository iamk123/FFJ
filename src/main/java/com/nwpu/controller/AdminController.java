package com.nwpu.controller;

import com.nwpu.Utils.EncodeHandler;
import com.nwpu.dao.ICompanyDao;
import com.nwpu.domain.*;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserService userService;
    @Autowired
    JobService jobService;
    @Autowired
    CompanyService companyService;

    /**
     * 首页
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model){

        model.addAttribute("countUser", userService.countAll());
        model.addAttribute("countCompany", companyService.countAll());
        model.addAttribute("countJob", jobService.countAll());
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
                              @RequestParam(value = "rows", defaultValue = "10") int rows, Model model,
                              @RequestParam(value = "msg", defaultValue = "") String msg){

        model.addAttribute("users", userService.findAllByPage(userType, currentPage, rows));
        model.addAttribute("msg",msg);
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
    public String addUser(@Param("user") @Valid  User user, BindingResult result, Model model){

        if(result.hasErrors()){
            List<ObjectError> errorList = result.getAllErrors();
            for (ObjectError error: errorList) {
                System.out.println(error.getDefaultMessage());
                model.addAttribute("msg", error.getDefaultMessage());
                model.addAttribute("user1", user);
                return "admin/userAdd";
            }
        }

        // System.err.println(user.toString());
        User u = userService.findUserByUserName(user.getUserName());
        if(u==null){
            user.setPassword(EncodeHandler.md5Encode(user.getPassword()));
            userService.save(user);
            return "redirect:/admin/userList?msg=1";
        }else{
            model.addAttribute("user1", user);
            model.addAttribute("msg","添加失败！用户已存在！");
            return "admin/userAdd";
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
                             @RequestParam(value = "msg", defaultValue = "") String msg,
                             @RequestParam(value = "rows", defaultValue = "10") int rows, Model model){

        model.addAttribute("pb", jobService.findAllByPage(currentPage, rows));
        model.addAttribute("msg", msg);
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
        if(!admin.getPassword().equals(EncodeHandler.md5Encode(origin))){
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
        if(userService.updatePassword(admin.getId(), EncodeHandler.md5Encode(newPassword)) == 1){
            // System.out.println("修改成功");
            session.removeAttribute("user");
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

    /**
     * 删除一个用户
     * @param userId
     * @return
     */
    @GetMapping(value = "/deleteUser/{userId}/{currentPage}")
    public String deleteUser(HttpSession session, @PathVariable int userId, @PathVariable int currentPage){
        User admin = (User) session.getAttribute("user");
        if(userId != admin.getId()){
            userService.deleteUserById(userId);
            return "redirect:/admin/userList?msg=1&currentPage=" + currentPage;
        }

        return "redirect:/admin/userList?msg=0&currentPage=" + currentPage;
    }

    /**
     * 更新职位信息
     * @param jobId
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateJob", method = RequestMethod.GET)
    public String updateJob(@RequestParam("jobId") int jobId, Model model,
                            @RequestParam(value = "msg", defaultValue = "") String msg){

        Job jobDetail = jobService.findJobCompanyById(jobId);
        model.addAttribute("jobDetail", jobDetail);
        model.addAttribute("msg",msg);
        return "admin/jobUpdate";
    }

    /**
     *更新职位信息
     * @param jobId
     * @param model
     * @param job
     * @param result
     * @return
     */
    @RequestMapping(value = "/updateJob", method = RequestMethod.POST)
    public String updateJob2(@RequestParam("jobId") int jobId, Model model, @Valid Job job, BindingResult result){

        // System.out.println("------------------");
        // if(result.hasErrors()){
        //     List<ObjectError> errorList = result.getAllErrors();
        //     for (ObjectError error: errorList) {
        //         System.out.println(error.getDefaultMessage());
        //     }
        // }
        if(result.hasErrors()){
            // System.out.println("信息不全！");
            return "redirect:/admin/jobUpdate?msg=2&jobId="+jobId;
        }else if(jobService.updateJob(job)==1){
            System.out.println(job);
            return "redirect:/admin/updateJob?msg=1&jobId="+jobId;
        }else{
            return "redirect:/admin/updateJob?msg=0&jobId="+jobId;
        }
    }
}
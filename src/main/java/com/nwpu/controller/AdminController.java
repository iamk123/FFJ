package com.nwpu.controller;

import com.nwpu.domain.*;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/userList")
    public String getUserList(@RequestParam(value = "userType", defaultValue = "3") int userType,
                              @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                              @RequestParam(value = "rows", defaultValue = "10") int rows, Model model){

        model.addAttribute("users", userService.findAllByPage(userType, currentPage, rows));
        return "admin/userList";
    }

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

    @GetMapping("/jobList")
    public String getJobList(@RequestParam(value = "status", defaultValue = "3") int status,
                             @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                             @RequestParam(value = "rows", defaultValue = "10") int rows, Model model){

        model.addAttribute("jobs", jobService.findAllByPage(status, currentPage, rows));
        return "/admin/jobList";
    }


    @ResponseBody
    @PostMapping("/updateStatus")
    public String updateStatus( @RequestParam("status") int status, @RequestParam int jobId,
                                @RequestParam int resumeId){

        jobService.updateStatus(jobId,resumeId,status);
        return "OK";
    }
}
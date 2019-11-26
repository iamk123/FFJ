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
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserService userService;
    @Autowired
    JobService jobService;

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

    @GetMapping("/jobHandle")
    public String getJobHandle(@RequestParam String jobName, @RequestParam String name,
                               @RequestParam(value = "status", defaultValue = "3") int status,
                               @RequestParam(value = "currentPage", defaultValue = "1")int currentPage, Model model){
        System.err.println(jobName + " " + name);
        Job jobDetail = jobService.findJobCompanyByName(name, jobName);

        User user = userService.findUserById(jobDetail.getCompany().getUserId());
        model.addAttribute("companyUser",user);
        model.addAttribute("jobDetail", jobDetail);
        model.addAttribute("users", jobService.findAllByPage(jobDetail.getId(), status, currentPage, 10));
        return "/admin/jobHandle";
    }

    @GetMapping("/resumeHandle")
    public String getResumeHandle(@RequestParam int id, @RequestParam int jobId, Model model){
        User user = userService.findUserById(id);
        Resume resume = userService.findResumeById(id);
        int resumeId = resume.getId();
        List<Advantage> advantages = userService.findAdvantageByResumeId(resumeId);
        List<String> jobNames = userService.findJobByResumeId(resumeId);
        List<Project> projects = userService.findProjectByResumeId(resumeId);
        List<Honor> honors = userService.findHonorByResumeId(resumeId);
        List<SocialWork> socialWorks = userService.findSocialWorkByResumeId(resumeId);
        model.addAttribute("user", user);
        model.addAttribute("resume", resume);
        model.addAttribute("advantages", advantages);
        model.addAttribute("jobNames", jobNames);
        model.addAttribute("projects", projects);
        model.addAttribute("honors", honors);
        model.addAttribute("socialWorks", socialWorks);
        model.addAttribute("jobId", jobId);
        return "/admin/resumeHandle";
    }

    @ResponseBody
    @PostMapping("/updateStatus")
    public String updateStatus( @RequestParam("status") int status, @RequestParam int jobId,
                             @RequestParam int resumeId){

            jobService.updateStatus(jobId,resumeId,status);
            return "OK";
    }
}
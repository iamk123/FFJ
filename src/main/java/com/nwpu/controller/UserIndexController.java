package com.nwpu.controller;

import com.nwpu.domain.*;
import com.nwpu.service.AccountService;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class UserIndexController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private JobService jobService;
    @Autowired
    UserService userService;

    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model){


        List<Map<String, Integer>> maps = companyService.findBaseInfo();
        System.out.println(maps.toString());
        model.addAttribute("companies", maps);

        // List<Company> companyList = companyService.findHotCompany(8);
        // // Company company = companyList.get(1);
        // // System.out.println("company   " + company);
        // model.addAttribute("hotCompany",companyList);
        // System.out.println(companyList);
        //
        // List<Account> list = accountService.findAll();
        // model.addAttribute("list", list);
        return "user/index";


        // return "user/index";
    }

    @GetMapping("/personInfo")
    public String getPersonInfo(){
        return "user/personInfo";
    }

    @GetMapping("/resume")
    public String getResume(HttpSession session, Model model){
        //HashMap map = new HashMap<>();
        User user = (User)session.getAttribute("user");
        Resume resume = userService.findResumeById(user.getId());
        int resumeId = resume.getId();
        System.err.println(resumeId);
        List<Advantage> advantages = userService.findAdvantageByResumeId(resumeId);
        List<String> jobNames = userService.findJobByResumeId(resumeId);
        List<Project> projects = userService.findProjectByResumeId(resumeId);
        List<Honor> honors = userService.findHonorByResumeId(resumeId);
        List<SocialWork> socialWorks = userService.findSocialWorkByResumeId(resumeId);
        System.out.println(advantages.get(1).getName());
        model.addAttribute("resume", resume);
        model.addAttribute("advantages", advantages);
        model.addAttribute("jobNames", jobNames);
        model.addAttribute("projects", projects);
        model.addAttribute("honors", honors);
        model.addAttribute("socialWorks", socialWorks);
        return "user/resume";
    }


}

package com.nwpu.controller;

import com.nwpu.domain.*;
import com.nwpu.pojo.PageBean;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSON;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private JobService jobService;
    @Autowired
    UserService userService;

    /**
     * 首页
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(){

        return "company/index";
    }

    /**
     * 热门企业
     * @return
     */
    @ResponseBody
    @GetMapping("/hotCompanies")
    public String getHotCompanies(){
        /*List<String> names = new ArrayList<>();
        List<Integer> numbers = new ArrayList<>();*/
        List<Map<String, Integer>> maps = companyService.findBaseInfo();
        System.out.println(maps.toString());
        String json = JSON.toJSONString(maps);
        System.err.println(json);
        return json;
    }

    /**
     * 招聘职位列表
     * @return
     */
    @GetMapping("/postJobList")
    public String postJobList(@RequestParam(value = "status", defaultValue = "3") int status,
                                 @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                                 @RequestParam(value = "rows", defaultValue = "5") int rows,HttpSession session, Model model){

        User company = (User) session.getAttribute("company");
        Integer companyId = company.getId();
        PageBean<Job> deliverList = jobService.findPostJobsByPage(companyId, currentPage, rows, status);

        model.addAttribute("pb", deliverList);
        model.addAttribute("status", status);
        return "company/postJobList";
    }

    /**
     * 职位详情 及 投递简历列表
     * @param jobId
     * @param model
     * @return
     */
    @RequestMapping(value = "/jobHandle", method = RequestMethod.GET)
    public String jobDetail(@RequestParam int jobId, Model model){

        Job jobDetail = jobService.findJobCompanyById(jobId);
        User user = userService.findUserById(jobDetail.getCompany().getUserId());
        model.addAttribute("companyUser",user);
        model.addAttribute("jobDetail", jobDetail);

        //TODO 查询应聘者列表
        return "company/jobHandle";
    }

    // @RequestMapping(value = "/resumeHandle", method = RequestMethod.GET)
    // public String resumeHandle(@RequestParam int resumeId, Model model){
    //
    //     System.out.println("查看一个投递者简历");
    //     // Job jobDetail = jobService.findJobCompanyById(resumeId);
    //     // User user = userService.findUserById(jobDetail.getCompany().getUserId());
    //     // model.addAttribute("companyUser",user);
    //     // model.addAttribute("jobDetail", jobDetail);
    //
    //     return "company/resumeHandle";
    // }
    @GetMapping("/resumeHandle")
    public String getResumeHandle(@RequestParam int userId, @RequestParam int jobId, Model model){
        System.out.println("查看一个投递者简历");
        User user = userService.findUserById(userId);
        Resume resume = userService.findResumeById(userId);
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
        return "/company/resumeHandle";
    }


}

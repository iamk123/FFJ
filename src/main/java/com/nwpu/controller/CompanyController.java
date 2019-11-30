package com.nwpu.controller;

import com.nwpu.Utils.EncodeHandler;
import com.nwpu.domain.*;
import com.nwpu.pojo.PageBean;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSON;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
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

        List<Map<String, Integer>> maps = companyService.findBaseInfo();
        // System.out.println(maps.toString());
        String json = JSON.toJSONString(maps);
        // System.err.println(json);
        return json;
    }

    /**
     * 招聘职位列表
     * @return
     */
    @GetMapping("/postJobList")
    public String postJobList(@RequestParam(value = "location", defaultValue = "") String location,
                              @RequestParam(value = "kind", defaultValue = "") String kind,
                              @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                              @RequestParam(value = "rows", defaultValue = "5") int rows,HttpSession session, Model model){

        User company = (User) session.getAttribute("user");
        Integer companyId = company.getId();
        PageBean<Job> deliverList = jobService.findPostJobsByPage(companyId, currentPage, rows, location, kind);

        model.addAttribute("pb", deliverList);
        model.addAttribute("location", location);
        model.addAttribute("kind", kind);
        return "company/postJobList";
    }

    /**
     * 职位详情 及 投递简历列表
     * @param jobId
     * @param model
     * @return
     */
    @RequestMapping(value = "/jobHandle", method = RequestMethod.GET)
    public String jobDetail(@RequestParam int jobId, Model model,HttpSession session,
                            @RequestParam(value = "status", defaultValue = "3") int status,
                            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                            @RequestParam(value = "rows", defaultValue = "5") int rows){

        Job jobDetail = jobService.findJobCompanyById(jobId);
        User user = userService.findUserById(jobDetail.getCompany().getUserId());
        model.addAttribute("companyUser",user);
        model.addAttribute("jobDetail", jobDetail);

        PageBean<Object> deliverList = userService.findJobReceiveResumesByPage(jobId, currentPage, rows, status);
        model.addAttribute("pb", deliverList);
        model.addAttribute("status", status);
        model.addAttribute("jobId", jobId);
        return "company/jobHandle";
    }

    /**
     * 查看一个投递者的简历
     * @param userId
     * @param jobId
     * @param model
     * @return
     */
    @GetMapping("/resumeHandle")
    public String getResumeHandle(@RequestParam int userId, @RequestParam int jobId, Model model){

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

    /**
     * 处理一个简历
     * @param status
     * @param jobId
     * @param resumeId
     * @return
     */
    @ResponseBody
    @PostMapping("/updateStatus")
    public String updateStatus( @RequestParam("status") int status, @RequestParam int jobId,
                                @RequestParam int resumeId){

        jobService.updateStatus(jobId,resumeId,status);
        return "OK";
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
        return "company/jobUpdate";
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
        // System.out.println(job);
        // if(result.hasErrors()){
        //     List<ObjectError> errorList = result.getAllErrors();
        //     for (ObjectError error: errorList) {
        //         System.out.println(error.getDefaultMessage());
        //     }
        // }
        if(result.hasErrors()){
            model.addAttribute("jobDetail", job);
            model.addAttribute("msg", "2");
            return "company/jobUpdate";
        }
        if(jobService.updateJob(job)==1){
            return "redirect:/company/updateJob?msg=1&jobId="+jobId;
        }else{
            return "redirect:/company/updateJob?msg=0&jobId="+jobId;
        }
    }

    /**
     * 发布职位
     * @return
     */
    @RequestMapping("/postJob")
    public String postJob(){

        return "company/jobAdd";
    }
    @RequestMapping(value = "/postJob", method = RequestMethod.POST)
    public String postJob(Model model, @Valid Job job, BindingResult result, HttpSession session){

        // if(result.hasErrors()){
        //     model.addAttribute("job", job);
        //     model.addAttribute("msg", "2");
        //     return "company/jobAdd";
        // }

        if(result.hasErrors()){
            List<ObjectError> errorList = result.getAllErrors();
            for (ObjectError error: errorList) {
                System.out.println(error.getDefaultMessage());
                model.addAttribute("msg", error.getDefaultMessage());
                model.addAttribute("job", job);
                return "company/jobAdd";
            }
        }

        User company = (User) session.getAttribute("user");
        job.setCompanyId(company.getId());
        job.setCreateTime(new Date());
        System.out.println(job);
        jobService.addJob(job);
        return "redirect:/company/jobHandle?jobId="+job.getId();
    }

    /**
     * 个人基本信息
     * @param session
     * @param model
     * @return
     */
    @GetMapping(value = "/personInfo")
    public String personInfo(HttpSession session, Model model){

        User user = (User)session.getAttribute("user");
        model.addAttribute("user",userService.findUserById(user.getId()));
        return "company/personInfo";
    }

    /**
     * 更新用户信息
     * @param session
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    public String updatePersonInfo(HttpSession session, Model model,
                                   @ModelAttribute("user")  User user){

        if(user.getName() == "" || user.getEmail() == "" || user.getPhone() == ""){

            model.addAttribute("msg", "2");
            return "company/personInfo";
        }

        int affectRows = userService.update(user);
        if(affectRows != 1){
            model.addAttribute("msg", "0");
        }else{
            user = userService.findUserById(user.getId());
            model.addAttribute("msg", "1");
            session.setAttribute("user", user);
        }

        return "company/personInfo";
    }

    /**
     * 修改密码
     * @return
     */
    @GetMapping("/updatePassword")
    public String updatePassword(){

        return "company/password-reset";
    }

    /**
     * 修改密码
     * @param session
     * @param model
     * @param origin
     * @param newPassword
     * @param confirm
     * @return
     */
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public String updatePassword(HttpSession session, Model model, @ModelAttribute("origin") String origin,
                                 @ModelAttribute("newPassword") String newPassword, @ModelAttribute("confirm") String confirm){

        User user = (User) session.getAttribute("user");
        if("".equals(origin) || "".equals(newPassword) || "".equals(confirm)){
            model.addAttribute("msg", "请完善信息！！");
            return "user/password-reset";
        }
        if(!user.getPassword().equals(EncodeHandler.md5Encode(origin))){
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
        if(userService.updatePassword(user.getId(), EncodeHandler.md5Encode(newPassword)) == 1){
            // model.addAttribute("msg", "修改密码成功！");
            // System.out.println("修改成功");
            session.removeAttribute("user");
            session.invalidate();
            return "redirect:/";
        }
        return null;
    }

    /**
     * 删除一条职位
     * @param jobId
     * @param currentPage
     * @return
     */
    @GetMapping(value = "/deleteJob/{jobId}/{currentPage}")
    public String deleteJob(@PathVariable int jobId, @PathVariable int currentPage){

        jobService.deleteJobById(jobId);
        //如果resumeDeliver中有该job,也要删除
        jobService.deleteResumeDeliverByJobId(jobId);
        return "redirect:/company/postJobList?currentPage" + currentPage;
    }
}

package com.nwpu.controller;

import com.alibaba.fastjson.support.hsf.HSFJSONUtils;
import com.nwpu.dao.IJobDao;
import com.nwpu.domain.Job;
import com.nwpu.domain.Resume;
import com.nwpu.domain.ResumeDeliver;
import com.nwpu.domain.User;
import com.nwpu.pojo.ConditionBean;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobService jobService;
    @Autowired
    private UserService userService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private IJobDao jobDao;

    /**
     * 分页标签查询
     * @param key
     * @param address
     * @param kind
     * @param currentPage
     * @param rows
     * @param model
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "key", defaultValue = "") String key,
                          @RequestParam(value = "address", defaultValue = "") String address,
                          @RequestParam(value = "kind", defaultValue = "") String kind,
                          @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                          @RequestParam(value = "rows", defaultValue = "5") int rows, Model model){

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("key",  key.trim());
        map.put("address", address);
        map.put("kind", kind);
        model.addAttribute("pb",jobService.findByCondition(map, currentPage, rows));

        //信息回填
        // map.put("currentPage", currentPage);
        // map.put("rows", rows);
        model.addAttribute("conditionMap", map);
        return "user/search";
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

        return "user/jobInfo";
    }

    /**
     * 投递简历
     * @param model
     * @return
     */
    @RequestMapping(value = "/deliver", method = RequestMethod.POST)
    @ResponseBody
    public String deliver(Integer userId, Integer jobId, Model model){

        Resume resume = userService.findResumeById(userId);

        //判断是否已经投递过
        int isDeliver = userService.isDeliver(resume.getId(), jobId);
        //已投递
        if(isDeliver != 0){
            return "0";
        }

        ResumeDeliver resumeDeliver = new ResumeDeliver();
        resumeDeliver.setCreateTime(new Date());
        resumeDeliver.setJobId(jobId);
        resumeDeliver.setStatus(0);
        resumeDeliver.setResumeId(resume.getId());

        //投递成功
        if(userService.deliverResume(resumeDeliver)==1){
            return "1";
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
        return "redirect:/admin/jobList?msg=1&currentPage=" + currentPage;
    }

    /**
     * 发布职位申请
     * @return
     */
    @RequestMapping("/postJob")
    public String postJob(){
        return "user/jobAdd";
    }

    /**
     * 发布职位
     * @param model
     * @param job
     * @param session
     * @param result
     * @return
     */
    @RequestMapping(value = "/postJob", method = RequestMethod.POST)
    public String postJob(Model model, @Valid Job job, BindingResult result, HttpSession session){

        System.out.println(job);
        if(result.hasErrors()){
            List<ObjectError> errorList = result.getAllErrors();
            for (ObjectError error: errorList) {
                System.out.println(error.getDefaultMessage());
                model.addAttribute("msg", error.getDefaultMessage());
                model.addAttribute("job", job);
                return "user/jobAdd";
            }
        }

        job.setCompanyId(0);
        job.setUserId(((User) session.getAttribute("user")).getId());
        job.setCreateTime(new Date());
        System.out.println(job);
        jobService.addJob(job);
        return "user/index";
    }

    @RequestMapping("/postList")
    public String postList(){
        // jobService.findPostJobsByPage();
        return null;
    }

}

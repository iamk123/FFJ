package com.nwpu.controller;

import com.alibaba.fastjson.support.hsf.HSFJSONUtils;
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
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
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

    /**
     * 查询
     * @return
     */
    // @RequestMapping(value = "/search", method = RequestMethod.GET)
    // public String search(ConditionBean conditionBean, Model model,
    //                       @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
    //                       @RequestParam(value = "rows", defaultValue = "5") int rows){
    //
    //     // System.out.println(conditionBean);
    //     Map<String, Object> map = new HashMap<String, Object>();
    //     map.put("key",  conditionBean.getKey());
    //     map.put("address", conditionBean.getAddress());
    //     map.put("kind", conditionBean.getKind());
    //
    //     model.addAttribute("job",jobService.findByCondition(map, currentPage, rows));
    //     //信息回填
    //     map.put("currentPage", currentPage);
    //     map.put("rows", rows);
    //     model.addAttribute("conditionMap", map);
    //     return "user/search";
    // }

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

        System.out.println("123");
        System.out.println("userId " + userId);
        System.out.println("companyId" + jobId);
        Resume resume = userService.findResumeById(userId);
        System.out.println(resume);

        //判断是否已经投递过
        int isDeliver = userService.isDeliver(resume.getId(), jobId);
        System.out.println("是否投递 " + isDeliver);
        //已投递
        if(isDeliver != 0){
            return "0";
        }

        ResumeDeliver resumeDeliver = new ResumeDeliver();
        resumeDeliver.setCreateTime(new Date());
        resumeDeliver.setJobId(jobId);
        resumeDeliver.setStatus(4);
        resumeDeliver.setResumeId(resume.getId());
        System.out.println("resumeDeliver: " + resumeDeliver);

        //投递成功
        if(userService.deliverResume(resumeDeliver)==1){
            return "1";
        }

        return null;
    }


}

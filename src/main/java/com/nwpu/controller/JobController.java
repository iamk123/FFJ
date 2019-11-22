package com.nwpu.controller;

import com.nwpu.domain.Company;
import com.nwpu.domain.Job;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobService jobService;

    @Autowired
    private CompanyService companyService;

    /**
     * 查询
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "search", defaultValue = "") String key,
                         @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                         @RequestParam(value = "rows", defaultValue = "10") int rows, Model model){

        model.addAttribute("job", jobService.findByPage("%"+key+"%", currentPage, rows));
        System.out.println("key : " + key);
        model.addAttribute("search", key);
        return "user/search";
    }

    @GetMapping("/jobInfo/{id}")
    public String getJobInfo(@PathVariable Integer id, Model model){
        Job job = jobService.findOne(id);
        Company company = companyService.findCompanyByJobId(job.getId());
        model.addAttribute("job", job);
        model.addAttribute("company", company);
        return "user/jobInfo";
    }
}

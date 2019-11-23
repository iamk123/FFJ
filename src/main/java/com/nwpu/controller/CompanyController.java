package com.nwpu.controller;

import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSON;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private JobService jobService;

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

}

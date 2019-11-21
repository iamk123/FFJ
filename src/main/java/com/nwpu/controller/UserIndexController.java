package com.nwpu.controller;

import com.nwpu.dao.ICompanyDao;
import com.nwpu.domain.Account;
import com.nwpu.domain.Company;
import com.nwpu.service.AccountService;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/user")
public class UserIndexController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private JobService jobService;

    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model){

        List<Company> companyList = companyService.findSomeCompany(8);
        // Company company = companyList.get(1);
        // System.out.println("company   " + company);
        model.addAttribute("hotCompany",companyList);
        System.out.println(companyList);

        List<Account> list = accountService.findAll();
        model.addAttribute("list", list);
        return "user/index";


        // return "user/index";
    }


    /**
     * 搜索
     * @param search
     * @param model
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam String search, Model model){
        System.out.println("search for :  " + search);


        return "user/search";
    }

}

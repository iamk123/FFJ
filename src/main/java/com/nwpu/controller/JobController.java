package com.nwpu.controller;

import com.nwpu.pojo.ConditionBean;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobService jobService;

    /**
     * 查询
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(ConditionBean conditionBean, Model model,
                          @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                          @RequestParam(value = "rows", defaultValue = "5") int rows){

        System.out.println(conditionBean);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("key",  conditionBean.getKey());
        map.put("address", conditionBean.getAddress());
        map.put("kind", conditionBean.getKind());

        model.addAttribute("job",jobService.findByCondition(map, currentPage, rows));
        //信息回填
        map.put("currentPage", currentPage);
        map.put("rows", rows);
        model.addAttribute("conditionMap", map);
        return "user/search";
    }


    @RequestMapping(value = "/search2", method = RequestMethod.GET)
    public String search2(@RequestParam(value = "key", defaultValue = "") String key,
                          @RequestParam(value = "address", defaultValue = "") String address,
                          @RequestParam(value = "kind", defaultValue = "") String kind,
                          @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                          @RequestParam(value = "rows", defaultValue = "5") int rows, Model model){

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("key",  key);
        map.put("address", address);
        map.put("kind", kind);
        model.addAttribute("job",jobService.findByCondition(map, currentPage, rows));

        //信息回填
        map.put("currentPage", currentPage);
        map.put("rows", rows);
        model.addAttribute("conditionMap", map);
        return "user/search";
    }
}

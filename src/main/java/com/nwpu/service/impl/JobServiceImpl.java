package com.nwpu.service.impl;

import com.nwpu.dao.IJobDao;
import com.nwpu.domain.Job;
import com.nwpu.domain.PageBean;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("jobServiceImpl")
public class JobServiceImpl implements JobService {

    @Autowired
    private IJobDao jobDao;

    @Override
    public int findOneTotal(int id) {
        return jobDao.findOneTotal(id);
    }


    @Override
    public PageBean<Job> findByPage(String key, int currentPage, int rows) {

        Map<String, Object> map = new HashMap<String, Object>();
        PageBean<Job> pageBean = new PageBean<Job>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示页数
        pageBean.setRows(rows);

        //总记录数
        int totalCount = jobDao.findTotal();
        pageBean.setTotalCount(totalCount);

        //总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/rows);    //向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("key", key);
        map.put("start", (currentPage-1)*rows);
        map.put("size", pageBean.getRows());

        //封装每页显示的数据
        List<Job> list = jobDao.findByPage(map);
        pageBean.setList(list);

        System.out.println(pageBean);
        return pageBean;

    }

    public Job findOne(Integer id){
        return jobDao.findOne(id);
    }
}

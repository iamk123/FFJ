package com.nwpu.service.impl;

import com.nwpu.dao.IJobDao;
import com.nwpu.domain.Job;
import com.nwpu.pojo.PageBean;
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

    /**
     *
     * @param id
     * @return
     */
    @Override
    public int findOneTotal(int id) {
        return jobDao.findOneTotal(id);
    }


    /**
     * 分页查询
     * @param key
     * @param currentPage
     * @param rows
     * @return
     */
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

    /**
     * 条件 分页查询
     * @param map
     * @param currentPage
     * @param rows
     * @return
     */
    @Override
    public PageBean<Job> findByCondition(Map<String, Object> map, int currentPage, int rows) {

        PageBean<Job> pageBean = new PageBean<Job>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示页数
        pageBean.setRows(rows);

        //总记录数
        int totalCount = jobDao.findByPageTotal(map);
        pageBean.setTotalCount(totalCount);

        //总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/rows);    //向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage-1)*rows);
        map.put("size", pageBean.getRows());

        //封装每页显示的数据
        List<Job> list = jobDao.findByPage(map);
        pageBean.setList(list);
        return pageBean;
    }

    /**
     * 查找职位详细信息 及 对应公司
     * @param id
     * @return
     */
    @Override
    public Job findJobCompanyById(int id) {
        return jobDao.findJobCompanyById(id);
    }
}
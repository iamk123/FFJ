package com.nwpu.service;

import com.nwpu.domain.Job;
import com.nwpu.pojo.PageBean;

import java.util.List;
import java.util.Map;

public interface JobService {

    /**
     * 查询某公司的再招职位总条数
     * @return
     */
    public int findOneTotal(int id);

    /**
     * 分页查找
     * @param key
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<Job> findByPage(String key, int currentPage, int rows);

    /**
     * 条件 分页查找
     * @param map
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<Job> findByCondition(Map<String, Object> map, int currentPage, int rows);

    /**
     * 查找职位详细信息 及 对应的公司
     * @param id
     * @return
     */
    Job findJobCompanyById(int id);

    Job findOne(Integer id);

    PageBean<Job> findAllByPage(int currentPage, int rows);

    Job findJobCompanyByName(String name, String jobName);



    void updateStatus(int jobId, int id, int status);


    PageBean<Job> findPostJobsByPage(Integer companyId, int currentPage, int rows, int status);

    void deleteJobById(int jobId);
}

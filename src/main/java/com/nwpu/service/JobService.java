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
    int findOneTotal(int id);

    /**
     * 查找职位总条数
     * @return
     */
    int countAll();

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

    /**
     * 查找一条工作
     * @param id
     * @return
     */
    Job findOne(Integer id);

    /**
     * 分页查找所有工作
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<Job> findAllByPage(int currentPage, int rows);

    /**
     * 查找公司、职位
     * @param name
     * @param jobName
     * @return
     */
    Job findJobCompanyByName(String name, String jobName);

    /**
     * 更新状态
     * @param jobId
     * @param id
     * @param status
     */
    void updateStatus(int jobId, int id, int status);

    /**
     * 分页查找发布的职位
     * @param companyId
     * @param currentPage
     * @param rows
     * @param location
     * @param kind
     * @return
     */
    PageBean<Job> findPostJobsByPage(Integer companyId, int currentPage, int rows, String location, String kind);

    /**
     * 删除职位
     * @param jobId
     */
    void deleteJobById(int jobId);

    /**
     * 更新职位
     * @param job
     * @return
     */
    int updateJob(Job job);

    /**
     * 删除投递简历记录
     * @param jobId
     */
    void deleteResumeDeliverByJobId(int jobId);

    /**
     * 添加职位
     * @param job
     */
    void addJob(Job job);
}

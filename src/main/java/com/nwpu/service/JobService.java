package com.nwpu.service;

import com.nwpu.domain.Job;
import com.nwpu.pojo.PageBean;

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
}

package com.nwpu.service;

import com.nwpu.domain.Job;
import com.nwpu.domain.PageBean;

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
}

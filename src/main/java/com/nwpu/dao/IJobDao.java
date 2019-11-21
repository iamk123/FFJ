package com.nwpu.dao;

import com.nwpu.domain.Job;

import java.util.List;
import java.util.Map;

public interface IJobDao {

    /**
     * 根据id 查询公司总在招职位
     * @param id
     * @return
     */
    public int findOneTotal(int id);

    int findTotal();

    List<Job> findByPage(Map<String, Object> map);
}

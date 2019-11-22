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


    /**
     * 分页查找
     * @param map
     * @return
     */
    List<Job> findByPage(Map<String, Object> map);

    /**
     * 查找总条数
     * @return
     */
    int findTotal();

    /**
     * 分页查找总条数
     * @param map
     * @return
     */
    int findByPageTotal(Map<String, Object> map);

    Job findJobCompanyById(int id);
}

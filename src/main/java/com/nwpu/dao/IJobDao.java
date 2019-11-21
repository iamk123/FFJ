package com.nwpu.dao;

public interface IJobDao {

    /**
     * 根据id 查询公司总在招职位
     * @param id
     * @return
     */
    public int findOneTotal(int id);
}

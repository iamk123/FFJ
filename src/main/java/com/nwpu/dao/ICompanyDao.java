package com.nwpu.dao;

import com.nwpu.domain.Company;
import com.nwpu.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface ICompanyDao {

    /**
     * 查询所有
     * @return
     */
    public List<Company> findAll();

    /**
     * 根据名称查询
     * @param name
     * @return
     */
    public Company findByName(String name);

    /**
     * 查找总条数
     * @return
     */
    public int findTotal();

    /**
     * 分页查找
     * @param map
     * @return
     */
    List<Company> findByPage(Map map);

    /**
     * 查找部分公司
     * @param num
     * @return
     */
    List<Company> findSome(int num);
}

package com.nwpu.dao;

import com.nwpu.domain.Company;

import java.util.List;

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

    List<Company> findSome(int num);
}

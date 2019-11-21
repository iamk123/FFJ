package com.nwpu.service;

import com.nwpu.domain.Company;

import java.util.List;

public interface CompanyService {

    /**
     * 查询所有
     * @return
     */
    public List<Company> findAll();

    /**
     * 查找指定条数
     * @param num
     * @return
     */
    public List<Company> findSomeCompany(int num);

    /**
     * 根据名称查询
     * @return
     */
    public Company findByName(String name);
}

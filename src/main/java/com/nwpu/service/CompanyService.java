package com.nwpu.service;

import com.nwpu.domain.Company;
import com.nwpu.domain.Job;
import com.nwpu.pojo.PageBean;

import java.util.List;
import java.util.Map;

public interface CompanyService {

    /**
     * 查询所有
     * @return
     */
    List<Company> findAll();

    int countAll();

    /**
     * 查找指定条数
     * @param num
     * @return
     */
    List<Company> findHotCompany(int num);

    /**
     * 根据名称查询
     * @return
     */
    Company findByName(String name);

    // List<Company> search(String key, int i);

    /**
     * 分页查找
     * @param key
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<Company> findByPage(String key, int currentPage, int rows);

    /**
     * 热门企业
     * @return
     */
    List<Map<String, Integer>> findBaseInfo();

    /**
     * 查找公司
     * @param id
     * @return
     */
    Company findCompanyByJobId(Integer id);

    Integer finCompanyIdByUserId(Integer id);
}

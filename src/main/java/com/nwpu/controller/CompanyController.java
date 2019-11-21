package com.nwpu.controller;

import com.nwpu.dao.ICompanyDao;
import com.nwpu.domain.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("company")
public interface CompanyController {

    /**
     * 查询所有
     * @return
     */
    public List<Company> findAll();
}

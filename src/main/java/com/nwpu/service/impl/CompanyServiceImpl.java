package com.nwpu.service.impl;

import com.nwpu.dao.ICompanyDao;
import com.nwpu.domain.Company;
import com.nwpu.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private ICompanyDao companyDao;

    @Override
    public List<Company> findAll() {
        return companyDao.findAll();
    }

    @Override
    public List<Company> findSomeCompany(int num) {
        return companyDao.findSome(num);
    }

    @Override
    public Company findByName(String name) {
        return companyDao.findByName(name);
    }
}

package com.nwpu.service.impl;

import com.nwpu.dao.ICompanyDao;
import com.nwpu.domain.Company;
import com.nwpu.pojo.PageBean;
import com.nwpu.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private ICompanyDao companyDao;

    @Override
    public List<Company> findAll() {
        return companyDao.findAll();
    }

    @Override
    public List<Company> findHotCompany(int num) {
        return companyDao.findSome(num);
    }

    @Override
    public Company findByName(String name) {
        return companyDao.findByName(name);
    }
    //
    // @Override
    // public List<Company> search(String key, int i) {
    //     if(key == "" || key == null){
    //         return companyDao.findSome(5);
    //     }else{
    //         return companyDao.findByCondition(key, i);
    //     }
    // }


    @Override
    public PageBean<Company> findByPage(String key, int currentPage, int rows) {

        Map<String, Object> map = new HashMap<String, Object>();
        PageBean<Company> pageBean = new PageBean<Company>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示页数
        pageBean.setRows(rows);

        //总记录数
        int totalCount = companyDao.findTotal();
        pageBean.setTotalCount(totalCount);

        //总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/rows);    //向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage-1)*rows);
        map.put("size", pageBean.getRows());

        //封装每页显示的数据
        List<Company> list = companyDao.findByPage(map);
        pageBean.setList(list);

        System.out.println(pageBean);
        return pageBean;

    }
}

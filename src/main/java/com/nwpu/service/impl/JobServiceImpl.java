package com.nwpu.service.impl;

import com.nwpu.dao.IJobDao;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("jobServiceImpl")
public class JobServiceImpl implements JobService {

    @Autowired
    private IJobDao jobDao;

    @Override
    public int findOneTotal(int id) {
        return jobDao.findOneTotal(id);
    }
}

package com.nwpu.service.impl;

import com.nwpu.dao.IAccountDao;
import com.nwpu.domain.Account;
import com.nwpu.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private IAccountDao accountDao;

    public List<Account> findAll() {
        // System.out.println("业务层：查询所有账户...");
        return accountDao.findAll();
    }

    public void saveAccount(Account account) {
        // System.out.println("业务层:保存账户...");
        accountDao.saveAccount(account);
    }
}

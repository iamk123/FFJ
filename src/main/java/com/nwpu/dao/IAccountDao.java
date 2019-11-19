package com.nwpu.dao;

import com.nwpu.domain.Account;


import java.util.List;

/**
 * 账户dao层
 */

public interface IAccountDao {

    // 查询所有账户

    public List<Account> findAll();

    // 保存帐户信息

    public void saveAccount(Account account);
}

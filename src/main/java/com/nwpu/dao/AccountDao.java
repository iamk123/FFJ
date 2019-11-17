package com.nwpu.dao;

import com.nwpu.domain.Account;

import java.io.Serializable;
import java.util.List;

/**
 * 账户dao层
 */
public interface AccountDao{

    /**
     * 查询所有账户
     * @return
     */
    public List<Account> findAll();

    /**
     * 保存账户信息
     * @param account
     */
    public void saveAccount(Account account);
}

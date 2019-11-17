package com.nwpu.dao;

import com.nwpu.domain.Account;
import org.apache.ibatis.annotations.Select;

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
    @Select("select * from account")
    public List<Account> findAll();

    /**
     * 保存账户信息
     * @param account
     */
    @Select("insert into account (name, money) values (#(name), #(money))")
    public void saveAccount(Account account);
}

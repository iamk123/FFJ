package com.nwpu.dao;

import com.nwpu.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 持久层
 * 用户dao
 */
public interface IUserDao {

    /**
     * 查询所有用户
     * @return
     */
    List<User> findAll();

    /**
     * 根据用户名查询用户
     * @param userName
     * @return
     */
    User findByUserName(String userName);

    /**
     * 根据账号、密码查询
     * @param map
     * @return
     */
    User findByUserNameAndPassword(Map map);

    User findById(int id);
}

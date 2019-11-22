package com.nwpu.service;

import com.nwpu.domain.User;

import java.util.List;

public interface UserService {
    /**
     * 查询所有user
     * @return
     */
    public List<User> findAll();

    /**
     * 查询用户
     * @param userName
     * @return
     */
    public User findUserByUserName(String userName);

    /**
     * 查询用户
     * @param userName
     * @param password
     * @return
     */
    public User findUserByUserNameAndPassword(String userName, String password);


    User findUserById(Integer userId);
}

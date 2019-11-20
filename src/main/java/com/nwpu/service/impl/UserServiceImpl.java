package com.nwpu.service.impl;

import com.nwpu.dao.IUserDao;
import com.nwpu.domain.User;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private IUserDao userDao;

    /**
     * 查询所有user
     * @return
     */
    public List<User> findAll(){
        return userDao.findAll();
    }

    /**
     * 查询用户
     * @param userName
     * @return
     */
    public User findUserByUserName(String userName){
        return userDao.findByUserName(userName);
    }

    /**
     * 查询用户
     * @param userName
     * @param password
     * @return
     */
    public User findUserByUserNameAndPassword(String userName, String password){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userName", userName);
        map.put("password", password);
        return userDao.findByUserNameAndPassword(map);
    }

}

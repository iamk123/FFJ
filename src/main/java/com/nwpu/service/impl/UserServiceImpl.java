package com.nwpu.service.impl;

import com.nwpu.dao.IUserDao;
import com.nwpu.domain.*;
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
     *
     * @param userType
     * @param currentPage
     * @param rows
     * @return
     */
    public PageBean<User> findAllByPage(int userType, int currentPage, int rows){
        PageBean<User> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        Map<String, Object> map = new HashMap<>();
        int totalCount = userDao.findAllByUserType(userType);

        System.err.println(totalCount);

        //double tc = totalCount;
        Double num = Math.ceil(((double)totalCount)/rows);
        pageBean.setTotalPage(num.intValue());
        map.put("userType", userType);
        map.put("start", (currentPage-1)*rows);
        map.put("size", pageBean.getRows());
        List<User> users=  userDao.findAllByPage(map);
        pageBean.setList(users);
        return pageBean;
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

    public List<Advantage> findAdvantageByResumeId(Integer id){
        return userDao.findAdvantageByResumeId(id);
    }

    public Resume findResumeById(Integer id){
        return userDao.findResumeById(id);
    }

    public List<String> findJobByResumeId(Integer id){
        return userDao.findJobByResumeId(id);
    }

    public List<Project> findProjectByResumeId(Integer id){
        return userDao.findProjectByResumeId(id);
    }

    public List<Honor> findHonorByResumeId(Integer id){
        return userDao.findHonorByResumeId(id);
    }

    public List<SocialWork> findSocialWorkByResumeId(Integer id){
        return userDao.findSocialWorkByResumeId(id);
    }
}

package com.nwpu.service.impl;

import com.nwpu.dao.IUserDao;
import com.nwpu.domain.*;
import com.nwpu.pojo.PageBean;
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

    @Override
    public List<Advantage> findAdvantageByResumeId(Integer id) {
        return null;
    }

    @Override
    public User findUserById(Integer userId) {
        return userDao.findById(userId);
    }

    @Override
    public Resume findResumeById(Integer id) {
        return userDao.findResumeById(id);
    }

    @Override
    public List<Advantage> findAdvantageByResumeId(int id) {
        return userDao.findAdvantageByResumeId(id);
    }

    @Override
    public List<String> findJobByResumeId(int id) {
        return userDao.findJobByResumeId(id);
    }

    @Override
    public List<Project> findProjectByResumeId(int id) {
        return userDao.findProjectByResumeId(id);
    }

    @Override
    public List<Honor> findHonorByResumeId(int id) {
        return userDao.findHonorByResumeId(id);
    }

    @Override
    public List<SocialWork> findSocialWorkByResumeId(int id) {
        return userDao.findSocialWorkByResumeId(id);
    }


    public PageBean<User> findAllByPage(int userType, int currentPage, int rows) {
        PageBean<User> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        Map<String, Object> map = new HashMap<>();
        int totalCount = userDao.findAllByUserType(userType);

        System.err.println(totalCount);

        //double tc = totalCount;
        Double num = Math.ceil(((double) totalCount) / rows);
        pageBean.setTotalPage(num.intValue());
        map.put("userType", userType);
        map.put("start", (currentPage - 1) * rows);
        map.put("size", pageBean.getRows());
        List<User> users = userDao.findAllByPage(map);
        pageBean.setList(users);
        return pageBean;
    }

    @Override
    public void save(User user){
        userDao.save(user);
    }
}

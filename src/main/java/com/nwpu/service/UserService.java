package com.nwpu.service;

import com.nwpu.domain.*;
import com.nwpu.pojo.PageBean;

import java.util.List;

public interface UserService {
    /**
     * 查询所有user
     * @return
     */
    List<User> findAll();

    /**
     * 查询用户
     * @param userName
     * @return
     */
    User findUserByUserName(String userName);

    /**
     * 查询用户
     * @param userName
     * @param password
     * @return
     */
    User findUserByUserNameAndPassword(String userName, String password);

    List<Advantage> findAdvantageByResumeId(Integer id);

    User findUserById(Integer userId);

    Resume findResumeById(Integer id);

    List<Advantage> findAdvantageByResumeId(int id);

    List<String> findJobByResumeId(int id);

    List<Project> findProjectByResumeId(int id);

    List<Honor> findHonorByResumeId(int id);

    List<SocialWork> findSocialWorkByResumeId(int id);

    PageBean<User> findAllByPage(int userType, int currentPage, int rows);

    void save(User user);
}

package com.nwpu.service;

import com.nwpu.domain.*;

import java.util.List;

public interface UserService {
    /**
     * 查询所有user
     * @return
     */

    PageBean<User> findAllByPage(int userType, int currentPage, int rows);

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

    Resume findResumeById(Integer id);

    List<String> findJobByResumeId(Integer id);

    List<Project> findProjectByResumeId(Integer id);

    List<Honor> findHonorByResumeId(Integer id);

    List<SocialWork> findSocialWorkByResumeId(Integer id);

}

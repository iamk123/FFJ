package com.nwpu.service;

import com.nwpu.domain.*;
import com.nwpu.pojo.DeliverListBean;
import com.nwpu.pojo.PageBean;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     * 查询所有user
     * @return
     */
    List<User> findAll();

    int countAll();

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

    int addUser(User user);

    int updateUser(User user, Resume resume);
    int update(User user);

    int updatePassword(Integer id, String password);

    PageBean<DeliverListBean> findDeliverListByPage(Integer resumeId, int currentPage, int rows, int status);

    PageBean<Object> findJobReceiveResumesByPage(int jobId, int currentPage, int rows, int status);

    int deliverResume(ResumeDeliver resumeDeliver);

    int isDeliver(Integer resumeId, Integer jobId);

    int addHonor(Honor honor);

    int deleteHonor(int id);

    int addProject(Project project);

    void deleteProject(int id);

    int addAdvantage(Advantage advantage);

    void deleteAdvantage(int id);

    int addSocialWork(SocialWork socialWork);

    void deleteSocialWork(int id);

    void save(User user);

    void deleteUserById(int userId);

    void addResume(Integer id);
}

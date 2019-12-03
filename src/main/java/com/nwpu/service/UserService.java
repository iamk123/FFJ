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

    /**
     * 查询总条数
     * @return
     */
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

    /**
     * 查找所有个人优势
     * @param id
     * @return
     */
    List<Advantage> findAdvantageByResumeId(Integer id);

    /**
     * 查找用户
     * @param userId
     * @return
     */
    User findUserById(Integer userId);

    /**
     * 查找简历
     * @param id
     * @return
     */
    Resume findResumeById(Integer id);

    /**
     * 查找个人优势
     * @param id
     * @return
     */
    List<Advantage> findAdvantageByResumeId(int id);

    /**
     * 查找工作
     * @param id
     * @return
     */
    List<String> findJobByResumeId(int id);

    /**
     * 查找项目经历
     * @param id
     * @return
     */
    List<Project> findProjectByResumeId(int id);

    /**
     * 查找获奖经历
     * @param id
     * @return
     */
    List<Honor> findHonorByResumeId(int id);

    /**
     * 查找社会工作
     * @param id
     * @return
     */
    List<SocialWork> findSocialWorkByResumeId(int id);

    /**
     * 分页查找用户
     * @param userType
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<User> findAllByPage(int userType, int currentPage, int rows);

    /**
     * 添加用户
     * @param user
     * @return
     */
    int addUser(User user);

    /**
     * 更新用户
     * @param user
     * @param resume
     * @return
     */
    int updateUser(User user, Resume resume);

    /**
     * 更新用户
     * @param user
     * @return
     */
    int update(User user);

    /**
     * 更新密码
     * @param id
     * @param password
     * @return
     */
    int updatePassword(Integer id, String password);

    /**
     * 分页查找投递列表
     * @param resumeId
     * @param currentPage
     * @param rows
     * @param status
     * @return
     */
    PageBean<DeliverListBean> findDeliverListByPage(Integer resumeId, int currentPage, int rows, int status);

    /**
     * 分页查找收到简历列表
     * @param jobId
     * @param currentPage
     * @param rows
     * @param status
     * @return
     */
    PageBean<Object> findJobReceiveResumesByPage(int jobId, int currentPage, int rows, int status);

    /**
     * 投递简历
     * @param resumeDeliver
     * @return
     */
    int deliverResume(ResumeDeliver resumeDeliver);

    /**
     * 判断是否已经投递
     * @param resumeId
     * @param jobId
     * @return
     */
    int isDeliver(Integer resumeId, Integer jobId);

    /**
     * 添加获奖经历
     * @param honor
     * @return
     */
    int addHonor(Honor honor);

    /**
     * 删除获奖经历
     * @param id
     * @return
     */
    int deleteHonor(int id);

    /**
     * 添加项目经历
     * @param project
     * @return
     */
    int addProject(Project project);

    /**
     * 删除项目经历
     * @param id
     */
    void deleteProject(int id);

    /**
     * 添加个人优势
     * @param advantage
     * @return
     */
    int addAdvantage(Advantage advantage);

    /**
     * 删除个人优势
     * @param id
     */
    void deleteAdvantage(int id);

    /**
     * 添加社会工作
     * @param socialWork
     * @return
     */
    int addSocialWork(SocialWork socialWork);

    /**
     * 删除社会工作
     * @param id
     */
    void deleteSocialWork(int id);

    /**
     * 保存用户
     * @param user
     */
    void save(User user);

    /**
     * 删除用户
     * @param userId
     */
    void deleteUserById(int userId);

    /**
     * 添加简历
     * @param id
     */
    void addResume(Integer id);
}

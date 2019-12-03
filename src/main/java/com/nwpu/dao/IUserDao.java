package com.nwpu.dao;

import com.nwpu.domain.User;
import com.nwpu.domain.*;
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
     * 用户总条数
     * @return
     */
    int countAll();

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

    /**
     * 查找用户
     * @param id
     * @return
     */
    User findById(int id);

    /**
     * 查找个人优势
     * @param id
     * @return
     */
    List<Advantage> findAdvantageByResumeId(Integer id);

    /**
     * 查找简历
     * @param id
     * @return
     */
    Resume findResumeById(Integer id);

    /**
     * 查找工作
     * @param id
     * @return
     */
    List<String> findJobByResumeId(Integer id);

    /**
     * 查找项目经历
     * @param id
     * @return
     */
    List<Project> findProjectByResumeId(Integer id);

    /**
     * 查找荣誉
     * @param id
     * @return
     */
    List<Honor> findHonorByResumeId(Integer id);

    /**
     * 查找社会工作
     * @param id
     * @return
     */
    List<SocialWork> findSocialWorkByResumeId(Integer id);

    /**
     * 根据类型查找所有用户
     * @param userType
     * @return
     */
    int findAllByUserType(@Param("userType") Integer userType);

    /**
     * 查找所有用户
     * @param map
     * @return
     */
    List<User> findAllByPage(Map<String, Object> map);

    /**
     * 插入一条用户
     * @param user
     * @return
     */
    int save(User user);

    /**
     * 更新用户
     * @param user
     * @return
     */
    int updateUser(User user);

    /**
     * 更新简历
     * @param resume
     * @return
     */
    int updateResume(Resume resume);

    /**
     * 更新密码
     * @param id
     * @param password
     * @return
     */
    int updatePassword(@Param("id") Integer id, @Param("password") String password );

    /**
     * 删除用户
     * @param userId
     */
    void deleteUserById(int userId);

    /**
     * 删除简历
     * @param userId
     */
    void deleteResumeByUserId(int userId);

}

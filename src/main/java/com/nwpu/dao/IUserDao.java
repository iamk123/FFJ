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

    List<Advantage> findAdvantageByResumeId(Integer id);

    Resume findResumeById(Integer id);

    List<String> findJobByResumeId(Integer id);

    List<Project> findProjectByResumeId(Integer id);

    List<Honor> findHonorByResumeId(Integer id);

    List<SocialWork> findSocialWorkByResumeId(Integer id);

    int findAllByUserType(@Param("userType") Integer userType);

    List<User> findAllByPage(Map<String, Object> map);

    int save(User user);

    int updateUser(User user);

    int updateResume(Resume resume);

    int updatePassword(@Param("id") Integer id, @Param("password") String password );

    // void save(User user);
}

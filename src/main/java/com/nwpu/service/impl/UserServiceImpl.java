package com.nwpu.service.impl;

import com.nwpu.Utils.TimeUtil;
import com.nwpu.dao.IResumeDao;
import com.nwpu.dao.IResumeDeliverDao;
import com.nwpu.dao.IUserDao;
import com.nwpu.domain.*;
import com.nwpu.pojo.DeliverListBean;
import com.nwpu.pojo.PageBean;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private IUserDao userDao;
    @Autowired
    private IResumeDeliverDao resumeDeliverDao;
    @Autowired
    private IResumeDao resumeDao;

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

    /**
     * 添加一个用户
     * @param user
     * @return
     */
    @Override
    public int addUser(User user) {

        if(userDao.save(user) == 1){
            return 1;
        }else{
            return 0;
        }

    }

    /**
     * 修改用户信息
     * @param user
     * @param resume
     * @return
     */
    @Override
    public int updateUser(User user, Resume resume) {

        //之前传id的userId,因为都有id，所以之前的resume设成了userId，在这更新一下
        int i1 = userDao.updateUser(user);
        resume.setUserId(user.getId());
        int i2 = userDao.updateResume(resume);

        return i1 + i2;
    }

    /**
     * 修改密码
     * @param
     * @return
     */
    @Override
    public int updatePassword(Integer id, String password) {

        return userDao.updatePassword(id, password);
    }

    /**
     * 分页查找用户的应聘列表
     * @param resumeId
     * @param currentPage
     * @param rows
     * @param status
     * @return
     */
    @Override
    public PageBean<DeliverListBean> findDeliverListByPage(Integer resumeId, int currentPage, int rows, int status) {

        PageBean<DeliverListBean> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        Map<String, Object> map = new HashMap<>();
        int totalCount = resumeDeliverDao.findAllByDeliverByStatus(resumeId, status);
        System.err.println(totalCount);

        double tc = totalCount;
        Double num = Math.ceil(((double) totalCount) / rows);
        pageBean.setTotalPage(num.intValue());

        map.put("status", status);
        map.put("start", (currentPage - 1) * rows);
        map.put("size", pageBean.getRows());
        map.put("resumeId", resumeId);

        List<DeliverListBean> list = resumeDeliverDao.findDeliverListByPage(map);
        System.err.println(list);
        pageBean.setList(list);

        return pageBean;

    }

    @Override
    public int deliverResume(ResumeDeliver resumeDeliver) {
        return resumeDeliverDao.saveDeliver(resumeDeliver);
    }

    /**
     * 判断是否已经投递
     * @param resumeId
     * @return
     */
    @Override
    public int isDeliver(Integer resumeId, Integer jobId) {
        return resumeDeliverDao.isDeliver(resumeId, jobId);
    }

    /**
     * 添加获奖经历
     * @param honor
     * @return
     */
    @Override
    public int addHonor(Honor honor) {
        return resumeDao.addHonor(honor);
    }

    @Override
    public int deleteHonor(int id) {
        return resumeDao.deleteHonor(id);
    }

    @Override
    public int addProject(Project project) {
        return resumeDao.addProject(project);
    }

    @Override
    public void deleteProject(int id) {
        resumeDao.deleteProject(id);
    }

    @Override
    public int addAdvantage(Advantage advantage) {
        return resumeDao.addAdvantage(advantage);
    }

    @Override
    public void deleteAdvantage(int id) {
        resumeDao.deleteAdvantage(id);
    }

    @Override
    public int addSocialWork(SocialWork socialWork) {
        return resumeDao.addSocialWork(socialWork);
    }

    @Override
    public void deleteSocialWork(int id) {
        resumeDao.deleteSocialWork(id);
    }

    @Override
    public void save(User user){
        userDao.save(user);
    }

}

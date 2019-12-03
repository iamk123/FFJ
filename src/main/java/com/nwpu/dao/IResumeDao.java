package com.nwpu.dao;

import com.nwpu.domain.Advantage;
import com.nwpu.domain.Honor;
import com.nwpu.domain.Project;
import com.nwpu.domain.SocialWork;

public interface IResumeDao {

    /**
     * 添加获奖
     * @param honor
     * @return
     */
    int addHonor(Honor honor);

    /**
     * 删除获奖
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
     * 添加简历
     * @param id
     */
    void addResume(Integer id);

}

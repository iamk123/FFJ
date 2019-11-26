package com.nwpu.dao;

import com.nwpu.domain.Advantage;
import com.nwpu.domain.Honor;
import com.nwpu.domain.Project;
import com.nwpu.domain.SocialWork;

public interface IResumeDao {

    int addHonor(Honor honor);

    int deleteHonor(int id);

    int addProject(Project project);

    void deleteProject(int id);

    int addAdvantage(Advantage advantage);

    void deleteAdvantage(int id);

    int addSocialWork(SocialWork socialWork);

    void deleteSocialWork(int id);

}

package com.nwpu.dao;

import com.nwpu.domain.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IJobDao {

    /**
     * 根据id 查询公司总在招职位
     * @param id
     * @return
     */
    public int findOneTotal(int id);

    /**
     * 职位总条数
     * @return
     */
    int countAll();

    /**
     * 分页查找
     * @param map
     * @return
     */
    List<Job> findByPage(Map<String, Object> map);

    /**
     * 查找总条数
     * @return
     */
    int findTotal();

    /**
     * 分页查找总条数
     * @param map
     * @return
     */
    int findByPageTotal(Map<String, Object> map);

    /**
     * 查询公司 职位信息
     * @param id
     * @return
     */
    Job findJobCompanyById(int id);

    /**
     * 查询职位
     */
    Job findOne(Integer id);

    /**
     * 分页查找职位
     * @param map
     * @return
     */
    List<Job> findAllByPage(Map<String, Object> map);

    /**
     * 分页查找职位总条数
     * @return
     */
    int findCountJobs();

    /**
     * 查找总条数
     * @param id
     * @param status
     * @return
     */
    int findAllByStatusAndId(@Param("id") int id, @Param("status") int status);

    /**
     * 查找职位、公司
     * @param name
     * @param jobName
     * @return
     */
    Job findJobCompanyByName(@Param("name") String name, @Param("jobName")String jobName);

    /**
     * 查找职位、公司
     * @param map
     * @return
     */
    List<Map<String, Object>> findAllByPage2(Map<String, Object> map);


    /**
     * 查找职位总条数
     * @param map
     * @return
     */
    int findCountPostJobsByCompanyId(Map<String, Object> map);

    /**
     * 查找职位
     * @param map
     * @return
     */
    List<Job> findPostJobsByPage(Map<String, Object> map);

    /**
     * 删除职位
     * @param jobId
     */
    void deleteJobById(int jobId);

    /**
     * 删除职位
     * @param job
     * @return
     */
    int updateJob(Job job);

    /**
     * 添加职位
     * @param job
     */
    void addJob(Job job);
}

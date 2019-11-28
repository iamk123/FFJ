package com.nwpu.service.impl;

import com.nwpu.dao.IJobDao;
import com.nwpu.dao.IResumeDeliverDao;
import com.nwpu.domain.Job;
import com.nwpu.domain.ResumeDeliver;
import com.nwpu.pojo.PageBean;
import com.nwpu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("jobServiceImpl")
public class JobServiceImpl implements JobService {

    @Autowired
    private IJobDao jobDao;
    @Autowired
    IResumeDeliverDao resumeDeliverDao;

    /**
     *
     * @param id
     * @return
     */
    @Override
    public int findOneTotal(int id) {
        return jobDao.findOneTotal(id);
    }


    /**
     * 分页查询
     * @param key
     * @param currentPage
     * @param rows
     * @return
     */
    @Override
    public PageBean<Job> findByPage(String key, int currentPage, int rows) {

        Map<String, Object> map = new HashMap<String, Object>();
        PageBean<Job> pageBean = new PageBean<Job>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示页数
        pageBean.setRows(rows);

        //总记录数
        int totalCount = jobDao.findTotal();
        pageBean.setTotalCount(totalCount);

        //总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/rows);    //向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("key", key);
        map.put("start", (currentPage-1)*rows);
        map.put("size", pageBean.getRows());

        //封装每页显示的数据
        List<Job> list = jobDao.findByPage(map);
        pageBean.setList(list);

        System.out.println(pageBean);
        return pageBean;

    }

    /**
     * 条件 分页查询
     * @param map
     * @param currentPage
     * @param rows
     * @return
     */
    @Override
    public PageBean<Job> findByCondition(Map<String, Object> map, int currentPage, int rows) {

        PageBean<Job> pageBean = new PageBean<Job>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示页数
        pageBean.setRows(rows);

        //总记录数
        int totalCount = jobDao.findByPageTotal(map);
        pageBean.setTotalCount(totalCount);

        //总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/rows);    //向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage-1)*rows);
        map.put("size", pageBean.getRows());

        //封装每页显示的数据
        List<Job> list = jobDao.findByPage(map);
        pageBean.setList(list);
        return pageBean;
    }

    /**
     * 查找职位详细信息 及 对应公司
     * @param id
     * @return
     */
    @Override
    public Job findJobCompanyById(int id) {
        return jobDao.findJobCompanyById(id);
    }

    @Override
    public Job findJobCompanyByName(String name, String jobName){ return jobDao.findJobCompanyByName(name, jobName);}

    @Override
    public Job findOne(Integer id){
        return jobDao.findOne(id);
    }

    @Override
    public PageBean<Job> findAllByPage(int currentPage, int rows){
        PageBean<Job> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        Map<String, Object> map = new HashMap<>();
        int totalCount = jobDao.findCountJobs();
        Double num = Math.ceil(((double) totalCount) / rows);
        pageBean.setTotalPage(num.intValue());
        map.put("start", (currentPage - 1) * rows);
        map.put("size", pageBean.getRows());
        List<Job> jobs = jobDao.findAllByPage(map);
        System.out.println(jobs);
        pageBean.setList(jobs);
        return pageBean;
    }

    @Override
    public void updateStatus(int jobId, int id, int status){
        resumeDeliverDao.updateStatus(status, id, jobId);
    }

    @Override
    public PageBean<Job> findPostJobsByPage(Integer companyId, int currentPage, int rows, String location, String kind) {

        PageBean<Job> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        Map<String, Object> map = new HashMap<>();
        map.put("location", location);
        map.put("kind", kind);
        map.put("companyId", companyId);
        int totalCount = jobDao.findCountPostJobsByCompanyId(map);
        System.err.println(totalCount);

        double tc = totalCount;
        Double num = Math.ceil(((double) totalCount) / rows);
        pageBean.setTotalPage(num.intValue());


        map.put("start", (currentPage - 1) * rows);
        map.put("size", pageBean.getRows());
        map.put("companyId", companyId);

        List<Job> list = jobDao.findPostJobsByPage(map);
        System.err.println(list);
        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public void deleteJobById(int jobId) {
        jobDao.deleteJobById(jobId);
    }

    @Override
    public int updateJob(Job job) {
        return jobDao.updateJob(job);
    }

    @Override
    public void deleteResumeDeliverByJobId(int jobId) {
        ResumeDeliver rd = resumeDeliverDao.findJobByJobId(jobId);
        if(rd != null){
            resumeDeliverDao.deleteById(rd.getId());
        }
    }
}

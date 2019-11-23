package com.nwpu.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 投简历记录表
 */
public class ResumeDeliver implements Serializable {

    private Integer id;         //id
    private Date createTime;    //投递时间
    private Integer jobId;      //对应的职位
    private Integer resumeId;   //对应的简历

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    @Override
    public String toString() {
        return "ResumeDeliver{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", jobId=" + jobId +
                ", resumeId=" + resumeId +
                '}';
    }
}
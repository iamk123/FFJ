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
    private int status;         //简历状态
    private String comment;
    private Job job;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

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

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "ResumeDeliver{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", jobId=" + jobId +
                ", resumeId=" + resumeId +
                ", status=" + status +
                ", comment='" + comment + '\'' +
                ", job=" + job +
                '}';
    }
}

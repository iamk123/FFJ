package com.nwpu.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 投递列表bean
 */
public class DeliverListBean implements Serializable {

    private Integer deliverId;
    private Integer jobId;
    private String jobName;           //职位名称
    private String companyName;      //公司名称
    private Date createTime;         //投递时间
    private int status;           //状态
    private String reason;         //状态处理结果

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getDeliverId() {
        return deliverId;
    }

    public void setDeliverId(Integer deliverId) {
        this.deliverId = deliverId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "DeliverListBean{" +
                "deliverId=" + deliverId +
                ", jobId=" + jobId +
                ", jobName='" + jobName + '\'' +
                ", companyName='" + companyName + '\'' +
                ", createTime=" + createTime +
                ", status=" + status +
                ", reason='" + reason + '\'' +
                '}';
    }
}

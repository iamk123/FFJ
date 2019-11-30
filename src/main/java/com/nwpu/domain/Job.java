package com.nwpu.domain;



import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * 职位
 */
public class Job implements Serializable {

    private Integer id;
    private Integer companyId;  //对应公司
    @NotBlank(message = "名称不能位空")
    private String jobName;     //工作名字
    @NotBlank(message = "人数不能位空")
    @Min(value = 0, message = "人数是大于0的数字")
    private String needNum;      //需要人数
    @NotBlank(message = "要求不能位空")
    private String jobRequire;  //职业要求
    @NotBlank(message = "薪水不能位空")
    private String salary;      //薪水
    @NotBlank(message = "地点不能位空")
    private String location;    //工作地点
    @NotBlank(message = "职位介绍不能为空")
    private String jobInfo;     //职位介绍

    private Date createTime;    //创建时间
    @NotBlank(message = "联系方式不能为空")
    @Length(min=11, max=11, message = "手机号码为11位")
    private String contact;     //联系方式
    @NotBlank(message = "9")
    private String kind;        //类别

    private Integer resumeId;

    private ResumeDeliver resumeDeliver;

    public ResumeDeliver getResumeDeliver() {
        return resumeDeliver;
    }

    public void setResumeDeliver(ResumeDeliver resumeDeliver) {
        this.resumeDeliver = resumeDeliver;
    }

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    private Company company;    //一对一级联查询

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getNeedNum() {
        return needNum;
    }

    public void setNeedNum(String jobNum) {
        this.needNum = jobNum;
    }

    public String getJobRequire() {
        return jobRequire;
    }

    public void setJobRequire(String jobRequire) {
        this.jobRequire = jobRequire;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getJobInfo() {
        return jobInfo;
    }

    public void setJobInfo(String jobInfo) {
        this.jobInfo = jobInfo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", companyId=" + companyId +
                ", jobName='" + jobName + '\'' +
                ", needNum='" + needNum + '\'' +
                ", jobRequire='" + jobRequire + '\'' +
                ", salary='" + salary + '\'' +
                ", location='" + location + '\'' +
                ", jobInfo='" + jobInfo + '\'' +
                ", createTime=" + createTime +
                ", contact='" + contact + '\'' +
                ", kind='" + kind + '\'' +
                ", resumeId=" + resumeId +
                ", resumeDeliver=" + resumeDeliver +
                ", company=" + company +
                '}';
    }
}

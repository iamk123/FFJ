package com.nwpu.domain;

import java.io.Serializable;

/**
 * 公司
 */
public class Company implements Serializable {

    private Integer id;             //id
    private String name;            //公司名称
    private Integer userId;         //所属人
    private String location;        //地址
    private String companyInfo;     //简介

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCompanyInfo() {
        return companyInfo;
    }

    public void setCompanyInfo(String companyInfo) {
        this.companyInfo = companyInfo;
    }

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userId=" + userId +
                ", location='" + location + '\'' +
                ", companyInfo='" + companyInfo + '\'' +
                '}';
    }
}

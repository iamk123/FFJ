package com.nwpu.domain;

import java.io.Serializable;

/**
 * 简历
 */
public class Resume implements Serializable {

    private Integer id;         //id
    private Integer userId;     //简历对应的用户
    private String location;    //地址
    private String grade;       //年级

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "id=" + id +
                ", userId=" + userId +
                ", location='" + location + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}

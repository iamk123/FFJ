package com.nwpu.domain;

import java.io.Serializable;

/**
 * 个人优势
 */
public class Advantage implements Serializable {

    private Integer id;
    private String name;
    private Integer resumeId;

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

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

    @Override
    public String toString() {
        return "Advantage{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", resumeId=" + resumeId +
                '}';
    }
}

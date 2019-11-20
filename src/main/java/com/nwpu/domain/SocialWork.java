package com.nwpu.domain;

import java.io.Serializable;

/**
 * 社会工作
 */
public class SocialWork implements Serializable {

    private Integer id;
    private String name;
    private String description;
    private String work;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    @Override
    public String toString() {
        return "SocialWork{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", work='" + work + '\'' +
                '}';
    }
}

package com.nwpu.domain;

import java.io.Serializable;

public class Advantage implements Serializable {

    private Integer id;
    private String name;
    private Integer resumeId;

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
        return "Honor{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

package com.nwpu.domain;

import java.io.Serializable;

/**
 * 荣誉证书
 */
public class Honor implements Serializable {
    private Integer id;
    private String name;

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

package com.nwpu.pojo;

import java.io.Serializable;

/**
 * 搜索参数封装
 */
public class ConditionBean implements Serializable {

    private String key;         //关键字
    private String address;     //地点
    private String kind;        //类别

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    @Override
    public String toString() {
        return "CondictionBean{" +
                "key='" + key + '\'' +
                ", address='" + address + '\'' +
                ", kind='" + kind + '\'' +
                '}';
    }
}

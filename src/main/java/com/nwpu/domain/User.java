package com.nwpu.domain;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;

/**
 * 用户
 */
public class User implements Serializable {

    private Integer id;         //id
    @NotBlank(message = "昵称不能为空")
    private String name;        //昵称
    @NotBlank(message = "账号不能为空")
    private String userName;    //账号
    @NotBlank(message = "密码不能为空")
    private String password;    //密码
    @NotBlank(message = "邮箱不能为空")
    private String email;       //邮箱
    @NotBlank(message = "电话不能为空")
    @Length(min=11, max=11, message = "手机号码为11位")
    private String phone;       //电话
    private Integer userType;   //用户类型

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", userType=" + userType +
                '}';
    }
}

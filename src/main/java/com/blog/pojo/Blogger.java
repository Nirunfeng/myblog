package com.blog.pojo;

import java.io.Serializable;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:22
 * @Version 1.0
 */
public class Blogger implements Serializable {

    private Integer id;
    private String username;
    private String password;
    private String email;
    private String hint;
    private String address;
    private String phone;

    public Blogger() {
    }

    public Blogger(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Blogger(String email) {
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getHint() {
        return hint;
    }

    public void setHint(String hint) {
        this.hint = hint;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Blogger{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", hint='" + hint + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}


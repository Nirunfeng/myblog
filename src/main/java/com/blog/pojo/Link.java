package com.blog.pojo;

import java.io.Serializable;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:25
 * @Version 1.0
 */
public class Link implements Serializable {

    private Integer id;
    private String linkName;
    private String linkUrl;
    private Integer orderNum;

    public Link() {
    }

    public Link(String linkName, String linkUrl) {
        this.linkName = linkName;
        this.linkUrl = linkUrl;
    }

    public Link(Integer id, String linkName, String linkUrl, Integer orderNum) {
        this.id = id;
        this.linkName = linkName;
        this.linkUrl = linkUrl;
        this.orderNum = orderNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    @Override
    public String toString() {
        return "Link{" +
                "id=" + id +
                ", linkName='" + linkName + '\'' +
                ", linkUrl='" + linkUrl + '\'' +
                ", orderNum=" + orderNum +
                '}';
    }

}


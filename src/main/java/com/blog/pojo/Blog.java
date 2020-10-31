package com.blog.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:20
 * @Version 1.0
 */
public class Blog implements Serializable{
    private Integer id;
    private String title;
    private String summary;
    private Date releaseDate;
    private Integer clickHit;
    private Integer commentHit;
    private String content;
    private String keyword;
    private int blogTypeId;

    private String typeName;
    private int typeCount;

    public Blog() {
    }

    public Blog(String title, String summary, String content, String keyword, int blogTypeId) {
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.keyword = keyword;
        this.blogTypeId = blogTypeId;
    }

    public Blog(Integer id, String title, String summary, String content, String keyword, int blogTypeId) {
        this.id = id;
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.keyword = keyword;
        this.blogTypeId = blogTypeId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getClickHit() {
        return clickHit;
    }

    public void setClickHit(Integer clickHit) {
        this.clickHit = clickHit;
    }

    public Integer getCommentHit() {
        return commentHit;
    }

    public void setCommentHit(Integer commentHit) {
        this.commentHit = commentHit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getBlogTypeId() {
        return blogTypeId;
    }

    public void setBlogTypeId(int blogTypeId) {
        this.blogTypeId = blogTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getTypeCount() {
        return typeCount;
    }

    public void setTypeCount(int typeCount) {
        this.typeCount = typeCount;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", releaseDate=" + releaseDate +
                ", clickHit=" + clickHit +
                ", commentHit=" + commentHit +
                ", content='" + content + '\'' +
                ", keyword='" + keyword + '\'' +
                ", blogTypeId=" + blogTypeId +
                ", typeName='" + typeName + '\'' +
                ", typeCount=" + typeCount +
                '}';
    }
}

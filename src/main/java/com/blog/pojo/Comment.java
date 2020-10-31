package com.blog.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:23
 * @Version 1.0
 */
public class Comment implements Serializable {

    private Integer id;
    private String name;
    private String email;
    private String content;
    private Date commentDate;
    private int blog_id;

    // 评论对应的博文标题
    private String blogTitle;
    // 对应回复博文
    private List<Reply> replyList;

    public Comment() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", content='" + content + '\'' +
                ", commentDate=" + commentDate +
                ", blog_id=" + blog_id +
                ", blogTitle='" + blogTitle + '\'' +
                ", replyList=" + replyList +
                '}';
    }

}


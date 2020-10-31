package com.blog.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:24
 * @Version 1.0
 */
public class Reply implements Serializable {

    private Integer id;
    private String content;
    private Date replyDate;
    private Integer commentId;

    // 对应的博客标题
    private Integer blog_id;
    private String blogTitle;

    public Reply() {
    }

    public Reply(int id, String content, Date replyDate, Integer commentId) {
        this.id = id;
        this.content = content;
        this.replyDate = replyDate;
        this.commentId = commentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public Integer getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(Integer blog_id) {
        this.blog_id = blog_id;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", replyDate=" + replyDate +
                ", commentId=" + commentId +
                ", blog_id=" + blog_id +
                ", blogTitle='" + blogTitle + '\'' +
                '}';
    }

}

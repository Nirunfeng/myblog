package com.blog.pojo;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:25
 * @Version 1.0
 */
public class Email {

    private String nickname;
    private String sender;
    private String subject;
    private String message;
    // 评论 id, 用于回复评论者邮箱
    private Integer commentId;
    // 授权码, 用于向博主发送邮件
    private String auth;

    public Email() {
    }

    public Email(String nickname, String sender, String subject, String message) {
        this.nickname = nickname;
        this.sender = sender;
        this.subject = subject;
        this.message = message;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    @Override
    public String toString() {
        return "Email{" +
                "nickname='" + nickname + '\'' +
                ", sender='" + sender + '\'' +
                ", subject='" + subject + '\'' +
                ", message='" + message + '\'' +
                ", commentId=" + commentId +
                ", auth='" + auth + '\'' +
                '}';
    }
}


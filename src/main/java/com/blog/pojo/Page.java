package com.blog.pojo;

import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:26
 * @Version 1.0
 */
public class Page<T> {

    private int currentPage;
    private int pageSize;
    private int sum;
    private int totalPage;
    private List<Blog> blogList;
    private List<Comment> commentList;
    private List<Reply> replyList;
    private List<Link> linkList;

    public Page() {
        super();
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<Blog> getBlogList() {
        return blogList;
    }

    public void setBlogList(List<Blog> blogList) {
        this.blogList = blogList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    public List<Link> getLinkList() {
        return linkList;
    }

    public void setLinkList(List<Link> linkList) {
        this.linkList = linkList;
    }

    @Override
    public String toString() {
        return "Page{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", sum=" + sum +
                ", totalPage=" + totalPage +
                ", blogList=" + blogList +
                ", commentList=" + commentList +
                ", replyList=" + replyList +
                ", linkList=" + linkList +
                '}';
    }

}


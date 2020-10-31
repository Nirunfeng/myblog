package com.blog.service.impl;

import com.blog.dao.CommentDao;
import com.blog.pojo.Comment;
import com.blog.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:49
 * @Version 1.0
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentDao commentDao;
    @Resource
    private CommentService commentService;

    @Override
    public List<Comment> getCommentByBlogId(int blog_id) {
        return commentDao.getCommentByBlogId(blog_id);
    }

    @Override
    public void updateComment(Comment comment) {
        commentDao.saveComment(comment);
        commentDao.updateCommentHit(comment.getBlog_id());
    }

    @Override
    public List<Comment> getAllComment() {
        return commentDao.getAllComment();
    }

    @Override
    public String getTitleByBlogId(int id) {
        return commentDao.getTitleByBlogId(id);
    }

    @Override
    public void deleteCommentById(Integer id) {
        Integer blog_id = commentDao.getBlogIdByCommentId(id);
        commentDao.minusCommentHit(blog_id);
        commentDao.deleteCommentById(id);
    }
}

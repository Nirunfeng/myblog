package com.blog.service.impl;

import com.blog.dao.BlogDao;
import com.blog.dao.ReplyDao;
import com.blog.pojo.Reply;
import com.blog.service.ReplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:52
 * @Version 1.0
 */
@Service
public class ReplyServiceImpl implements ReplyService {
    @Resource
    private ReplyDao replyDao;

    @Resource
    private BlogDao blogDao;

    @Override
    public List<Reply> getReplyListByCommentId(Integer comment_id) {
        return replyDao.getReplyListByCommentId(comment_id);
    }

    @Override
    public void addReply(Reply reply) {
        replyDao.addReply(reply);
    }

    @Override
    public List<Reply> getAllReply() {
        return replyDao.getAllReply();
    }

    @Override
    public void deleteReplyById(Integer id) {
        replyDao.deleteReplyById(id);
    }

    // 根据回复id查询博客标题
    @Override
    public String getBlogTitleByReplyId(int id) {
        String title = blogDao.getTitleById(replyDao.getBlogIdByReplyId(id));
        return title;
    }

    // 获取博客 id
    @Override
    public Integer getBlogIdByReplyId(Integer id) {
        Integer blogId = replyDao.getBlogIdByReplyId(id);
        return blogId;
    }
}

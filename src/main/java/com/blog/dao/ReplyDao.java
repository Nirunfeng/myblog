package com.blog.dao;

import com.blog.pojo.Reply;

import java.util.HashMap;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:38
 * @Version 1.0
 */
public interface ReplyDao {
    // 查询某一个评论下所有作者回复的合集
    List<Reply> getReplyListByCommentId(Integer comment_id);

    // 增加回复
    void addReply(Reply reply);

    // 获取分页查询总数
    int selectCount();

    // 分页查询评论
    List<Reply> getReplyByPage(HashMap<String, Object> map);

    // 获取所有回复
    List<Reply> getAllReply();

    // 根据评论 id 查询博客标题
    String getBlogTitleByReplyId(Integer id);

    // 根据评论 id 查询博客 id
    Integer getBlogIdByReplyId(Integer id);

    // 根据回复 id 删除回复
    void deleteReplyById(Integer id);
}

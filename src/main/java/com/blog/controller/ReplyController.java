package com.blog.controller;

import com.blog.pojo.Reply;
import com.blog.service.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:24
 * @Version 1.0
 */
@Controller
public class ReplyController {

    @Resource
    private ReplyService replyService;

    @ResponseBody
    @RequestMapping("/replyComment")
    public boolean replyComment(@RequestBody Reply reply) {
        if (reply.getCommentId() == null) {
            return false;
        } else {
            replyService.addReply(reply);
            return true;
        }
    }

    @ResponseBody
    @RequestMapping("/deleteReplyById")
    public boolean deleteReplyById(@RequestBody Reply reply) {
        if (reply.getId() == null) {
            return false;
        } else {
            replyService.deleteReplyById(reply.getId());
            return true;
        }
    }

}


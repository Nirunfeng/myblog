package com.blog.controller;

import com.blog.dao.CommentDao;
import com.blog.pojo.Comment;
import com.blog.pojo.Email;
import com.blog.service.CommentService;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:08
 * @Version 1.0
 */
@Controller
public class CommentController {

    @Resource
    private CommentDao commentDao;
    @Resource
    private CommentService commentService;

    // 发表评论
    @RequestMapping("/commentSubmit/{id}")
    public String commentSubmit(@PathVariable("id") Integer id, HttpServletRequest request) {

        int blog_id = Integer.parseInt(request.getParameter("id"));

        // 评论实例
        Comment comment = new Comment();
        comment.setName(request.getParameter("name"));
        comment.setEmail(request.getParameter("email"));
        comment.setContent(request.getParameter("content"));
        comment.setBlog_id(blog_id);
        commentService.updateComment(comment);

        return "redirect:/blog/.do?id=" + comment.getBlog_id();
    }

    @ResponseBody
    @RequestMapping("/sendCommentEmail")
    public boolean sendCommentEmail(@RequestBody Email email) {
        if (email.getCommentId() != null) {
            email.setNickname("倪润峰");
            email.setSender("2570034697@qq.com");
            String commentAddress = commentDao.getEmailByCommentId(email.getCommentId());

            JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

            mailSender.setHost("smtp.qq.com");
            mailSender.setPort(587);
            mailSender.setUsername("2570034697@qq.com");
            mailSender.setPassword("saxauffoyyfsdida");

            // 邮件信息
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setFrom(email.getSender()); // 发件人邮箱
            msg.setTo(commentAddress); // 收件人邮箱
            msg.setSubject(email.getSubject()); // 标题
            msg.setText(email.getMessage()); // 文本信息
            try {
                mailSender.send(msg);
            } catch (MailException e) {
                System.err.println("发送失败:" + e.getMessage());
                return false;
            }
            return true;
        }
        return false;
    }

    @ResponseBody
    @RequestMapping("/deleteCommentById")
    public boolean deleteCommentById(@RequestBody Comment comment) {
        Integer id = comment.getId();
        if (id != null) {
            commentService.deleteCommentById(id);
            return true;
        }
        return false;
    }

}

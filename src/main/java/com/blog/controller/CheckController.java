package com.blog.controller;

import com.blog.pojo.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.MD5Util;
import com.sun.mail.util.MailSSLSocketFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:09
 * @Version 1.0
 */
@Controller
public class CheckController {

    @Resource
    private BloggerService bloggerService;

    // 登录页面
    @RequestMapping("/bloggerLogin")
    public String login() {
        return "../back/login";
    }

    // 验证登录
    @ResponseBody
    @RequestMapping("/checkLogin")
    public boolean login(@RequestBody Blogger blogger) {

        // 获取登录实体
        Subject subject = SecurityUtils.getSubject();
        // 获取加密后的密码
        String saltPassword = MD5Util.md5(blogger.getPassword(), "admin");
        System.out.println(blogger.getPassword() + "  " + saltPassword);
        // 获取用户密码登录token
        UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUsername(), blogger.getPassword());

        try {
            //根据token登录 会调用BloggerRealm中的doGetAuthenticationInfo方法进行身份认证
            subject.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    // 忘记密码
    @RequestMapping("/forget")
    public String forget() {
        return "../back/forget";
    }

    // 发送作者邮箱
    @ResponseBody
    @RequestMapping("/checkMail")
    public boolean checkMail(@RequestBody Blogger blogger) {

        if (blogger.getEmail().equals(bloggerService.getBloggerEmail())) {

            // 发送邮件
            Blogger admin = bloggerService.getLoginInfo();

            Properties props = new Properties();
            //邮件传输的协议
            props.put("mail.transport.protocol", "smtp");

            //连接的邮件服务器
            props.put("mail.host", "smtp.qq.com");

            //发送人
            props.put("mail.from", "2570034697@qq.com");

            //第一步：创建session
            Session session = Session.getDefaultInstance(props);
            session.setDebug(true);

            try {
                MailSSLSocketFactory sf = new MailSSLSocketFactory();
                sf.setTrustAllHosts(true);

                props.put("mail.smtp.ssl.enable", "true");
                props.put("mail.smtp.ssl.socketFactory", "true");

                //第二步：获取邮件传输对象
                Transport ts = session.getTransport();

                //连接邮件服务器
                ts.connect("2570034697@qq.com", "saxauffoyyfsdida");

                //第三步：创建邮件消息体
                MimeMessage mimeMessage = new MimeMessage(session);

                //设置邮件的内容
                mimeMessage.setSubject("博主密码找回");

                //设置邮件的内容
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String time = sdf.format(date);
                String content = "亲爱的博主您好，您于 " + time + " 登陆个人博客管理账户失败，" +
                        "您的账号为：" + admin.getUsername() + ", 密码为：" + admin.getHint() + " 请尝试" + "重新登陆。";
                mimeMessage.setContent(content, "text/html;charset=utf-8");

                //第四步：设置发送昵称
                String nickname = javax.mail.internet.MimeUtility.encodeText("Stephanie");
                mimeMessage.setFrom(new InternetAddress(nickname + "'<" + "2570034697@qq.com" + " > '"));

                //第五步：设置接收人信息
                ts.sendMessage(mimeMessage, InternetAddress.parse("2570034697@qq.com"));

            } catch (Exception e) {
                e.printStackTrace();
            }

            return true;
        }
        return false;
    }

}


package com.blog.controller;

import com.blog.pojo.Blogger;
import com.blog.util.StringUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:25
 * @Version 1.0
 */
@Controller
public class ShiroController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(Blogger blogger) {
        if (!StringUtil.isEmpty(blogger.getUsername()) || !StringUtil.isEmpty(blogger.getPassword())) {
            return new ModelAndView("../back/login");
        }
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken(blogger.getUsername(), blogger.getPassword()));
        } catch (AuthenticationException e) {
            System.out.println("登陆失败： " + e.getMessage());
            return new ModelAndView("../back/login");
        }
        return new ModelAndView("../fore/index");
    }

}


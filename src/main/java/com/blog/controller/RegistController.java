package com.blog.controller;

import com.blog.pojo.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 19:41
 * @Version 1.0
 */
@Controller
public class RegistController {
    @Resource
    private BloggerService bloggerService;

    @ResponseBody
    @RequestMapping("/checkRegist")
    public boolean checkRegist(@RequestBody Blogger blogger){
        if(blogger.getUsername()!=""||blogger.getPassword()!=""){
            String saltPassword= MD5Util.md5(blogger.getPassword(),"admin");
            Blogger inblogger=new Blogger();
            inblogger.setUsername(blogger.getUsername());inblogger.setPassword(saltPassword);
            inblogger.setHint(blogger.getPassword());
            bloggerService.insertBlogUser(inblogger);
            return  true;
        }
        else {
            return false;
        }
    }
}

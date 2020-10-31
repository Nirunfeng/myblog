package com.blog.service.impl;

import com.blog.dao.BloggerDao;
import com.blog.pojo.Blogger;
import com.blog.service.BloggerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:41
 * @Version 1.0
 */
@Service
public class BloggerServiceImpl implements BloggerService {
    @Resource
    private BloggerDao bloggerDao;

    @Override
    public boolean loginCheck(String username, String password) {
        Blogger blogger = bloggerDao.getLoginInfo();
        System.out.println("service: " + blogger.getUsername() + "  " + blogger.getPassword());
        if (username.equals(blogger.getUsername()) && password.equals(blogger.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String getBloggerEmail() {
        return bloggerDao.getBloggerEmail();
    }

    @Override
    public Blogger getLoginInfo() {
        return bloggerDao.getLoginInfo();
    }

    @Override
    public Blogger getBloggerByUsername(String username) {
        return bloggerDao.getBloggerByUsername(username);
    }

    @Override
    public Blogger getBloggerInfo() {
        return bloggerDao.getBloggerInfo();
    }

    @Override
    public void updateBloggerInfo(Blogger blogger) {
        bloggerDao.updateBloggerInfo(blogger);
    }

    @Override
    public void insertBlogUser(Blogger blogger) {
        bloggerDao.insertBlogger(blogger);
    }
}

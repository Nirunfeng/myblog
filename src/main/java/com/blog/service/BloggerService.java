package com.blog.service;

import com.blog.pojo.Blogger;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:40
 * @Version 1.0
 */
public interface BloggerService {
    // 验证登录
    boolean loginCheck(String username, String password);

    // 获取博主电子邮件地址
    String getBloggerEmail();

    // 验证登录
    Blogger getLoginInfo();

    // shiro 验证
    Blogger getBloggerByUsername(String username);

    // 获取博主信息
    Blogger getBloggerInfo();

    // 修改博主信息
    void updateBloggerInfo(Blogger blogger);

    //添加用户
    void insertBlogUser(Blogger blogger);
}

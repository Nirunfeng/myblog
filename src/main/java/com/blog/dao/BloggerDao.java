package com.blog.dao;

import com.blog.pojo.Blogger;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:29
 * @Version 1.0
 */
public interface BloggerDao {
    // 验证登录
    Blogger getLoginInfo();

    // 获取博主电子邮件地址
    String getBloggerEmail();

    // shiro 验证
    Blogger getBloggerByUsername(String username);

    // 获取博主信息
    Blogger getBloggerInfo();

    // 更新博主信息
    void updateBloggerInfo(Blogger blogger);

    //添加博主
    void insertBlogger(Blogger blogger);
}

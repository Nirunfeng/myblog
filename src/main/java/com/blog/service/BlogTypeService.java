package com.blog.service;

import com.blog.pojo.BlogType;

import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:45
 * @Version 1.0
 */
public interface BlogTypeService {
    // 根据博客类别 id 查询博客类别名称
    String getTypeNameById(int id);

    // 获取博客类别合集
    List<BlogType> getAllTypes();

    // 添加类型
    void addBlogType(BlogType blogType);

    // 删除类型
    void deleteBlogTypeById(int id);

    // 根据类型名查找 id
    Integer getIdByTypeName(String typeName);

    // 更新类型
    void updateBlogType(BlogType blogType);
}

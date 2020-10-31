package com.blog.dao;

import com.blog.pojo.Blog;

import java.util.HashMap;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:27
 * @Version 1.0
 */
public interface BlogDao {
    // 首页查询博客
    List<Blog> getForeBlog();

    // 获取分页查询总数
    int selectCount();

    // 分页查询博客
    List<Blog> getBlogByPage(HashMap<String, Object> map);

    // 博客详情查询
    Blog getBlogById(int id);

    // 获取所有博客
    List<Blog> getAllBlog();

    // 刷新博客的访问量
    void updateClickHitById(int id);

    // 获取六个最新博客
    List<Blog> getSix();

    // 获取该分类下分页查询总数
    int selectCountByBlogType(int blogTypeId);

    // 获取博客分类分页
    List<Blog> getPageByBlogType(HashMap<String, Object> map);

    // 添加博客
    void insertBlog(Blog blog);

    // 删除博文
    void deleteBlogById(int id);

    void deleteCommentByBlogId(int id);

    // 修改博文
    void updateBlogById(Blog blog);

    // 获取 id
    Integer getIdByTitle(String title);

    // 搜索博文
    List<Integer> searchBlog(String str);

    // 根据博客 id 获取博客标题
    String getTitleById(Integer id);
}

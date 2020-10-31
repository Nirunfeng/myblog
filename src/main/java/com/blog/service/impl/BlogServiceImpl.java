package com.blog.service.impl;

import com.blog.dao.BlogDao;
import com.blog.pojo.Blog;
import com.blog.pojo.Page;
import com.blog.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:44
 * @Version 1.0
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private BlogDao blogDao;

    @Override
    public List<Blog> getForeBlog() {
        return blogDao.getForeBlog();
    }

    @Override
    public int selectCount() {
        return blogDao.selectCount();
    }

    @Override
    public Page<Blog> getBlogByPage(int currentPage) {
        HashMap<String, Object> map = new HashMap<>();
        Page<Blog> page = new Page<>();

        // 当前页数
        page.setCurrentPage(currentPage);

        // 每页显示条数
        int pageSize = 3;
        page.setPageSize(3);

        // 记录总数
        int sum = blogDao.selectCount();
        page.setSum(sum);

        // 总页数
        double decimal = sum;
        Double num = Math.ceil(decimal / pageSize);
        page.setTotalPage(num.intValue());

        // 设置开始结束页数
        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", page.getPageSize());

        // 每页显示的数据
        List<Blog> blogList = blogDao.getBlogByPage(map);
        page.setBlogList(blogList);

        return page;
    }

    @Override
    public List<Blog> getAllBlog() {
        return blogDao.getAllBlog();
    }

    @Override
    public Blog getBlogById(int id) {
        return blogDao.getBlogById(id);
    }

    @Override
    public void updateClickHitById(int id) {
        blogDao.updateClickHitById(id);
    }

    @Override
    public List<Blog> getSix() {
        return blogDao.getSix();
    }

    @Override
    public int selectCountByBlogType(int blogTypeId) {
        return blogDao.selectCountByBlogType(blogTypeId);
    }

    @Override
    public Page<Blog> getPageByBlogType(int currentPage, int blogTypeId) {
        HashMap<String, Object> map = new HashMap<>();
        Page<Blog> page = new Page<>();

        // 当前页数
        page.setCurrentPage(currentPage);

        // 每页显示条数
        int pageSize = 6;
        page.setPageSize(6);

        // 记录总数
        int sum = blogDao.selectCountByBlogType(blogTypeId);
        page.setSum(sum);

        // 总页数
        double decimal = sum;
        Double num = Math.ceil(decimal / pageSize);
        page.setTotalPage(num.intValue());

        // 设置开始结束页数
        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", page.getPageSize());
        map.put("blogTypeId", blogTypeId);

        // 每页显示的数据
        List<Blog> blogList = blogDao.getPageByBlogType(map);
        page.setBlogList(blogList);

        return page;
    }

    @Override
    public void insertBlog(Blog blog) {
        blogDao.insertBlog(blog);
    }

    @Override
    public void deleteBlogById(int id) {
        blogDao.deleteBlogById(id);
        blogDao.deleteCommentByBlogId(id);
    }

    @Override
    public void updateBlogById(Blog blog) {
        blogDao.updateBlogById(blog);
    }

    @Override
    public Integer getIdByTitle(String title) {
        return blogDao.getIdByTitle(title);
    }

    @Override
    public List<Integer> searchBlog(String str) {
        return blogDao.searchBlog(str);
    }
}

package com.blog.service.impl;

import com.blog.dao.BlogTypeDao;
import com.blog.pojo.BlogType;
import com.blog.service.BlogTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:46
 * @Version 1.0
 */
@Service
public class BlogTypeServiceImpl implements BlogTypeService {
    @Resource
    private BlogTypeDao blogTypeDao;

    @Override
    public String getTypeNameById(int id) {
        return blogTypeDao.getTypeNameById(id);
    }

    @Override
    public List<BlogType> getAllTypes() {
        return blogTypeDao.getAllTypes();
    }

    @Override
    public void addBlogType(BlogType blogType) {
        blogTypeDao.addBlogType(blogType);
    }

    @Override
    public void deleteBlogTypeById(int id) {
        // 删评论
        List<Integer> blogIdList = blogTypeDao.getBlogIdListByTypeId(id);
        for (int blogId : blogIdList) {
            blogTypeDao.deleteCommentByBlogId(blogId);
        }
        // 删博客
        blogTypeDao.deleteBlogByTypeId(id);
        // 删博客类型
        blogTypeDao.deleteBlogTypeById(id);
    }

    @Override
    public Integer getIdByTypeName(String typeName) {
        return blogTypeDao.getIdByTypeName(typeName);
    }

    @Override
    public void updateBlogType(BlogType blogType) {
        blogTypeDao.updateBlogType(blogType);
    }
}

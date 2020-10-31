package com.blog.controller;

import com.blog.pojo.BlogType;
import com.blog.service.BlogTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:07
 * @Version 1.0
 */
@Controller
public class BlogTypeController {

    @Resource
    private BlogTypeService blogTypeService;

    @ResponseBody
    @RequestMapping("/addBlogType")
    public boolean addBlogType(@RequestBody BlogType blogType) {
        if (!blogType.getTypeName().equals("")) {
            System.out.println(blogType.toString());
            BlogType addBlogType = new BlogType(blogType.getTypeName(), blogType.getOrderNum());
            blogTypeService.addBlogType(blogType);
            return true;
        }
        return false;
    }

    @ResponseBody
    @RequestMapping("/modifyBlogType")
    public boolean modifyBlogType(@RequestBody BlogType blogType) {
        if (blogType.getId() != null) {
            System.out.println(blogType.toString());
            blogTypeService.updateBlogType(blogType);
            return true;
        }
        return false;
    }

    // 由博文类型标题进行删除
    @RequestMapping("/deleteBlogTypeByName")
    public ModelAndView deleteBlogTypeByName(@RequestParam(required = false) String deleteBlogTypeName) {
        ModelAndView modelAndView = new ModelAndView();
        if (!deleteBlogTypeName.equals("")) {
            Integer id = blogTypeService.getIdByTypeName(deleteBlogTypeName);
            if (id != null) {
                blogTypeService.deleteBlogTypeById(id);
            }
            modelAndView.setViewName("redirect:admin/manage.do");
        }
        return modelAndView;
    }

}


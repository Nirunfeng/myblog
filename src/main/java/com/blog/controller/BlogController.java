package com.blog.controller;

import com.blog.pojo.*;
import com.blog.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:04
 * @Version 1.0
 */
@Controller
public class BlogController {

    @Resource
    private BlogService blogService;
    @Resource
    private BlogTypeService blogTypeService;
    @Resource
    private LinkService linkService;
    @Resource
    private CommentService commentService;
    @Resource
    private ReplyService replyService;

    // 请求博客详细信息
    @RequestMapping("/blog/{id}")
    public ModelAndView getBlogById(@PathVariable("id") Integer id, HttpServletRequest request) {

        id = Integer.parseInt(request.getParameter("id"));
        ModelAndView modelAndView = new ModelAndView();

        // 博客实例
        Blog blog = blogService.getBlogById(id);
        modelAndView.addObject("blog", blog);

        // 获取博客名称
        int blogTypeId = blog.getBlogTypeId();
        String typeName = blogTypeService.getTypeNameById(blogTypeId);
        modelAndView.addObject("typeName", typeName);

        // 刷新访问量
        blog.setClickHit(blog.getClickHit() + 1);
        blogService.updateClickHitById(id);

        // 获取六个最新博客
        List<Blog> sixList = blogService.getSix();
        modelAndView.addObject("sixList", sixList);

        // 获取所有的博客类别
        List<BlogType> blogTypeList = blogTypeService.getAllTypes();
        modelAndView.addObject("blogTypeList", blogTypeList);

        // 获取所有链接名称
        List<Link> linkList = linkService.getAllLink();
        modelAndView.addObject("linkList", linkList);

        // 根据博客 id 获取评论信息
        List<Comment> commentList = commentService.getCommentByBlogId(id);
        modelAndView.addObject("commentList", commentList);

        // 装配回复评论集合
        for (Comment comment : commentList) {
            Integer comment_id = comment.getId();
            List<Reply> replyList = replyService.getReplyListByCommentId(comment_id);
            comment.setReplyList(replyList);
        }

        modelAndView.setViewName("../fore/detail");
        return modelAndView;
    }

    // 默认分页显示
    @RequestMapping("/defaultBlogType")
    public ModelAndView defaultBlogType(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        // 默认查询第一种类型
        int defaultBlogTypeId = blogTypeService.getAllTypes().get(0).getId();

        // 分页
        modelAndView.addObject("pageInfo", blogService.getPageByBlogType(currentPage, defaultBlogTypeId));

        // 获取所有类别
        List<BlogType> blogTypeList = blogTypeService.getAllTypes();
        modelAndView.addObject("blogTypeList", blogTypeList);

        modelAndView.setViewName("../fore/type");
        return modelAndView;
    }

    // 按类别分页查看博客
    @RequestMapping("/blogType/{blogTypeId}")
    public ModelAndView blogType(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                                 @PathVariable("blogTypeId") Integer blogTypeId, HttpServletRequest request) throws Exception {

        blogTypeId = Integer.parseInt(request.getParameter("blogTypeId"));
        System.out.println(blogTypeId);
        ModelAndView modelAndView = new ModelAndView();

        // 分页
        modelAndView.addObject("pageInfo", blogService.getPageByBlogType(currentPage, blogTypeId));

        // 获取所有类别
        List<BlogType> blogTypeList = blogTypeService.getAllTypes();
        modelAndView.addObject("blogTypeList", blogTypeList);

        modelAndView.setViewName("../fore/type");
        return modelAndView;
    }

    // 创作博文
    @RequestMapping("/compose")
    public ModelAndView compose() {
        ModelAndView modelAndView = new ModelAndView();
        // 获取所有博客类别实例
        List<BlogType> blogTypeList = blogTypeService.getAllTypes();
        modelAndView.addObject("blogTypeList", blogTypeList);
        modelAndView.setViewName("../back/compose");
        return modelAndView;
    }

    // 获取博文内容进行添加
    @ResponseBody
    @RequestMapping("/getContent")
    public boolean getContent(@RequestBody Blog blog) {
        if (!blog.getTitle().equals("")) {
            Blog savedBlog = new Blog(blog.getTitle(), blog.getSummary(), blog.getContent(), blog.getKeyword(), blog.getBlogTypeId());
            System.out.println(savedBlog.toString());
            blogService.insertBlog(savedBlog);
            return true;
        }
        return false;
    }

    // 由 id 转到编辑页面
    @RequestMapping("/turnToEdit/{id}")
    public ModelAndView turnToEdit(@RequestParam(required = false) Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        if (id != null) {

            Blog blog = blogService.getBlogById(id);
            modelAndView.addObject("blog", blog);
            System.out.println(blog.toString());

            List<BlogType> blogTypeList = blogTypeService.getAllTypes();
            modelAndView.addObject("blogTypeList", blogTypeList);
            modelAndView.setViewName("../back/edit");
        }
        return modelAndView;
    }

    // 获取博文实体进行更新
    @ResponseBody
    @RequestMapping("/edit")
    public boolean edit(@RequestBody Blog blog) {
        if (blog.getId() != null) {
            Blog updateBlog = new Blog(blog.getId(), blog.getTitle(), blog.getSummary(), blog.getContent(), blog.getKeyword(), blog.getBlogTypeId());
            System.out.println(blog.toString());
            blogService.updateBlogById(blog);
            return true;
        }
        return false;
    }

    // 由博文标题进行删除
    @RequestMapping("/deleteBlogByTitle")
    public ModelAndView deleteBlogByTitle(@RequestParam(required = false) String deleteTitle) {
        ModelAndView modelAndView = new ModelAndView();
        if (!deleteTitle.equals("")) {
            Integer id = blogService.getIdByTitle(deleteTitle);
            if (id == null) {
                modelAndView.setViewName("redirect:admin/manage.do");
            } else {
                blogService.deleteBlogById(id);
                modelAndView.setViewName("redirect:admin/manage.do");
            }
        }
        return modelAndView;
    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(required = false) String str) {
        ModelAndView modelAndView = new ModelAndView();
        List<Integer> idList = blogService.searchBlog(str);
        System.out.println(" ID :" + idList);
        if (idList.isEmpty()) {
            modelAndView.setViewName("none");
        } else {
            List<Blog> blogList = new ArrayList<>();
            for (Integer i : idList) {
                blogList.add(blogService.getBlogById(i));
            }
            modelAndView.addObject("blogList", blogList);
            modelAndView.setViewName("result");
        }
        return modelAndView;
    }

}


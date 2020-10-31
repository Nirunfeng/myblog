package com.blog.controller;

import com.blog.pojo.Link;
import com.blog.service.LinkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:21
 * @Version 1.0
 */
@Controller
public class LinkController {

    @Resource
    private LinkService linkService;

    @ResponseBody
    @RequestMapping("/addLink")
    public boolean addLink(@RequestBody Link link) {
        if (link.getLinkUrl().equals("")) {
            return false;
        } else {
            linkService.addLink(link);
            return true;
        }
    }

    @RequestMapping("/deleteLinkById")
    public ModelAndView deleteLinkById(@RequestParam(required = false) Integer deleteLinkId) {
        ModelAndView modelAndView = new ModelAndView();
        if (deleteLinkId != null) {
            linkService.deleteLinkById(deleteLinkId);
        }
        modelAndView.setViewName("redirect:admin/manage.do");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/modifyLink")
    public boolean modifyLink(@RequestBody Link link) {
        if (link.getId() == null) {
            return false;
        } else {
            linkService.updateLink(link);
            return true;
        }
    }

}


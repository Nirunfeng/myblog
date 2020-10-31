package com.blog.service.impl;

import com.blog.dao.LinkDao;
import com.blog.pojo.Link;
import com.blog.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 15:50
 * @Version 1.0
 */
@Service
public class LinkServiceImpl implements LinkService {
    @Resource
    private LinkDao linkDao;

    @Override
    public List<Link> getAllLink() {
        return linkDao.getAllLink();
    }

    @Override
    public void addLink(Link link) {
        linkDao.addLink(link);
    }

    @Override
    public void deleteLinkById(Integer id) {
        linkDao.deleteLinkById(id);
    }

    @Override
    public void updateLink(Link link) {
        linkDao.updateLink(link);
    }
}

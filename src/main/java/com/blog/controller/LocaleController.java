package com.blog.controller;

import com.blog.pojo.Blogger;
import com.blog.service.BloggerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

/**
 * @Author Ni RunFeng
 * @Date 2020/9/2 16:22
 * @Version 1.0
 */
@Controller
public class LocaleController {

    @Resource
    private BloggerService bloggerService;

    @RequestMapping("/locale")
    public ModelAndView locale(@RequestParam("locale") String locale, HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("blogger", bloggerService.getBloggerInfo());
        if ("zh".equals(locale)) {
            Locale zhLocale = new Locale("zh", "CN");
            session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, zhLocale);
        } else {
            Locale enLocale = new Locale("en", "US");
            session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, enLocale);
        }

        modelAndView.setViewName("about");
        return modelAndView;
    }

    @RequestMapping("/about")
    public ModelAndView about() {
        ModelAndView modelAndView = new ModelAndView();
        Blogger blogger = bloggerService.getBloggerInfo();
        modelAndView.addObject("blogger", blogger);
        modelAndView.setViewName("about");
        return modelAndView;
    }

    @RequestMapping("/download")
    public ModelAndView download() {
        ModelAndView modelAndView = new ModelAndView();

        HttpURLConnection conn = null;
        InputStream inputStream = null;
        BufferedInputStream bis = null;
        FileOutputStream out = null;

        try {
            File fileDir = new File("..\\upload");
            if (!fileDir.isDirectory() && !fileDir.exists()) {
                fileDir.mkdirs();
            }
            out = new FileOutputStream(fileDir + "\\img.jpg");
            // 建立链接
            URL httpUrl = new URL("http://localhost:8080/static/img/about.jpg");
            conn = (HttpURLConnection) httpUrl.openConnection();
            //以Post方式提交表单，默认get方式
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
            conn.setDoOutput(true);
            // post方式不能使用缓存
            conn.setUseCaches(false);
            //连接指定的资源
            conn.connect();
            //获取网络输入流
            inputStream = conn.getInputStream();
            bis = new BufferedInputStream(inputStream);
            byte b[] = new byte[1024];
            int len = 0;
            while ((len = bis.read(b)) != -1) {
                out.write(b, 0, len);
            }
            System.out.println("下载完成...");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (bis != null) {
                    bis.close();
                }
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        modelAndView.setViewName("about");
        return modelAndView;
    }

}

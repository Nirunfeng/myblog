<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <title>博客分类</title>
    <!-- BOOTSTRAP CORE STYLE -->
    <link href="../static/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONT AWESOME ICON STYLE -->
    <link href="../static/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- CUSTOM STYLE CSS -->
    <link href="../static/assets/css/style.css" rel="stylesheet"/>
</head>
<body>
<div class="copyrights">Copyright &copy; all rights reserved 2019. Stephanie Went</div>
<!--END INFO SECTION-->
<div class="container">

    <h5>以下为搜索结果</h5> 返回<a href="${pageContext.request.contextPath}/index.do">首页</a>

    <div class="row">

        <div class="col-md-8 ">
            <c:forEach items="${blogList}" var="blog">
                <div class="blog-post">
                    <h2>${blog.title}</h2>
                    <h4>Posted by <a
                            href="${pageContext.request.contextPath}/about.do">Mini</a> ${blog.releaseDate} </h4>
                    <p>${blog.summary} </p>
                    <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}"
                       class="btn btn-default btn-lg ">Read
                        More <i class="fa fa-angle-right"></i></a>
                </div>
            </c:forEach>
            <br/>
        </div>
        <div class="col-md-1"></div>
    </div>

</div>

<!--END HOME PAGE SECTION-->
<div class="footer-sec" style="margin-top: 0px;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 foo-inner">
                Copyright &copy; all rights reserved 2019. Stephanie Went
            </div>
        </div>
    </div>
</div>


</body>
</html>

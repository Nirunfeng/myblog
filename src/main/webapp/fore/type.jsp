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

    <div class="row">

        <div class="col-md-8 ">
            <c:if test="${empty pageInfo}">
                Null Message for more blog.
            </c:if>
            <c:if test="${!empty pageInfo}">
                <c:forEach items="${pageInfo.blogList}" var="blog">
                    <div class="blog-post">
                        <h2>${blog.title}</h2>
                        <h4>Posted by <a href="${pageContext.request.contextPath}/about.do">Stephanie</a> ${blog.releaseDate} </h4>
                        <p>${blog.summary} </p>
                        <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}"
                           class="btn btn-default btn-lg ">Read
                            More <i class="fa fa-angle-right"></i></a>
                    </div>
                </c:forEach>
            </c:if>
            <br/>
            <nav>
                <ul class="pagination">
                    <c:if test="${pageInfo.currentPage != 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/setPage.do?currentPage=${pageInfo.currentPage-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${pageInfo.totalPage}" var="i">
                        <li>
                            <a href="${pageContext.request.contextPath}/setPage.do?currentPage=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageInfo.currentPage != pageInfo.totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath }/setPage.do?currentPage=${pageInfo.currentPage+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-3" style="padding-top: 30px;">
            <div class="row">
                <ul class="list-group">
                    <li class="list-group-item">
                        <strong>
                            <a href="${pageContext.request.contextPath}/index.do">主页</a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;博客分类
                        </strong>
                    </li>
                    <c:forEach items="${blogTypeList}" var="blogType">
                        <li class="list-group-item">
                            <a href="${pageContext.request.contextPath}/blogType/.do?blogTypeId=${blogType.id}">${blogType.typeName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

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

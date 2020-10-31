<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>blog detail</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">

    <!-- Font-Awesome -->
    <link rel="stylesheet" href="../static/css/font-awesome/css/font-awesome.min.css">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet'
          type='text/css'>

    <!-- Styles -->
    <link rel="stylesheet" href="../static/css/style.css" id="theme-styles">

</head>
<body>
<header>
    <div class="widewrapper masthead">
        <div class="container">
            <a href="${pageContext.request.contextPath}/about.do" id="logo">
                <img src="../static/img/logo.png" alt="clean Blog">
            </a>

            <div id="mobile-nav-toggle" class="pull-right">
                <a href="#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <nav class="pull-right clean-nav">
                <div class="collapse navbar-collapse">
                    <ul class="nav nav-pills navbar-nav">

                        <li>
                            <a href="../index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/about.do">About</a>
                        </li>
                        <li>
                            <a href="../fore/contact.jsp">Contact</a>
                        </li>
                    </ul>
                </div>
            </nav>

        </div>
    </div>

    <div class="widewrapper subheader">
        <div class="container">
            <div class="clean-breadcrumb">
                <a>关键字 ${blog.keyword}</a>
                <span class="separator">&#x2F;</span>
                <a>博客类型 ${typeName}</a>
            </div>


            <div class="clean-searchbox">
                <a>浏览 ${blog.clickHit}</a>
                <span class="separator">&#x2F;</span>
                <a>评论 ${blog.commentHit}</a>
            </div>
        </div>
    </div>
</header>

<div class="widewrapper main">
    <div class="container">
        <div class="row">
            <div class="col-md-8 blog-main">
                <article class="blog-post">
                    <div class="body">
                        <h1>${blog.title}</h1>
                        <div class="meta">
                            <i class="fa fa-user"> </i> Stephanie
                            <i class="fa fa-calendar"></i> ${blog.releaseDate}
                            <i class="fa fa-comments"></i>
                            <span class="data"><a href="#comments">${blog.commentHit} Comments</a></span>
                        </div>
                        <a>${blog.summary}</a>
                        <p>${blog.content}</p>
                    </div>
                </article>

                <aside class="social-icons clearfix">
                    <a href=""><i class="fa fa-thumbs-up"></i></a>
                </aside>

                <aside class="comments" id="comments">
                    <hr>

                    <h2><i class="fa fa-comments"></i> ${blog.commentHit} Comments</h2>

                    <c:if test="${empty commentList}">
                        暂无评论
                    </c:if>
                    <c:if test="${!empty commentList}">
                        <c:forEach items="${commentList}" var="comment">

                            <article class="comment">
                                <header class="clearfix">
                                    <div class="meta">
                                        <h3>${comment.name}</h3>
                                        <span class="date">${comment.commentDate}</span>
                                        <span class="separator"> - </span>
                                        <a href="#create-comment" class="reply-link">Reply</a>
                                    </div>
                                </header>
                                <div class="body">
                                        ${comment.content}
                                </div>
                            </article>

                            <c:if test="${!empty comment.replyList}">
                                <c:forEach items="${comment.replyList}" var="reply">
                                    <article class="comment reply">
                                        <header class="clearfix">
                                            <div class="meta">
                                                <h3>博主回复 @ ${comment.name}</h3>
                                                <span class="date">${reply.replyDate}</span>
                                            </div>
                                        </header>
                                        <div class="body">
                                                ${reply.content}
                                        </div>
                                    </article>
                                </c:forEach>
                            </c:if>

                        </c:forEach>
                    </c:if>


                </aside>

                <aside class="create-comment" id="create-comment">
                    <hr>

                    <h2><i class="fa fa-pencil"></i> Add Comment</h2>

                    <%-- 提交 JS 验证--%>
                    <form id="commentInfo" method="post" accept-charset="utf-8" οnsubmit="return checkComment()"
                          action="${pageContext.request.contextPath}/commentSubmit/.do?id=${blog.id}">
                        <div class="row">
                            <div class="col-md-6">
                                <input class="form-control input-lg"
                                       type="text" name="name" id="name" placeholder="Your Name" required="required">
                            </div>
                            <div class="col-md-6">
                                <input class="form-control input-lg"
                                       type="email" name="email" id="email" placeholder="Email" required="required"
                                       pattern="^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$">
                            </div>
                        </div>

                        <textarea class="form-control input-lg"
                                  rows="10" name="content" id="content" placeholder="Your Comment"
                                  required="required"></textarea>

                        <div class="buttons clearfix">
                            <button id="submitBtn" type="submit" class="btn btn-xlarge btn-clean-one">Submit</button>
                        </div>
                    </form>

                    <script type="text/javascript">
                        $("#submitBtn").click(function () {

                            var email = document.getElementById("email");

                            if (email.validity.valueMissing === true) {
                                email.setCustomValidity("邮箱不能为空!");
                                return;
                            } else if (email.validity.patternMismatch === true) {
                                email.setCustomValidity("邮箱格式不正确！");
                                return;
                            } else {
                                email.setCustomValidity("");
                            }

                            var name = document.getElementById("name");

                            if (name.validity.valueMissing === true) {
                                name.setCustomValidity("昵称不能为空!");
                                return;
                            } else {
                                name.setCustomValidity("");
                            }

                            var content = document.getElementById("content");

                            if (content.validity.valueMissing === true) {
                                content.setCustomValidity("评论内容不能为空!");

                            } else {
                                content.setCustomValidity("");
                            }

                        })
                    </script>

                </aside>
            </div>
            <aside class="col-md-4 blog-aside">

                <div class="aside-widget">
                    <header>
                        <h3>Recently Post</h3>
                    </header>
                    <div class="body">
                        <ul class="clean-list">
                            <c:forEach items="${sixList}" var="blog">
                                <li>
                                    <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}">${blog.title}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="aside-widget">
                    <header>
                        <h3>Blog Types</h3>
                    </header>
                    <div class="body clearfix">
                        <ul class="tags">
                            <c:forEach items="${blogTypeList}" var="blogType">
                                <li>
                                    <a href="${pageContext.request.contextPath}/blogType/.do?blogTypeId=${blogType.id}">${blogType.typeName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="aside-widget">
                    <header>
                        <h3>Links</h3>
                    </header>
                    <div class="body clearfix">
                        <ul class="tags">
                            <c:forEach items="${linkList}" var="link">
                                <li><a href="${link.linkUrl}">${link.linkName}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </aside>
        </div>
    </div>
</div>

<footer>
    <div class="widewrapper copyright">
        Copyright &copy; all rights reserved 2019. Stephanie Went
    </div>
</footer>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script src="../static/js/modernizr.js"></script>

</body>
</html>
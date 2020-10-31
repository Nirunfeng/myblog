<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="ch">

<head>
    <title>个人博客后台管理系统</title>
    <script src="../static/js/blogger/jquery.min.js"></script>
    <script src="../static/js/blogger/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".meun-item").click(function () {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function () {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function () {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function () {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function () {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function () {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <script src="../static/js/blogger/respond.min.js"></script>
    <link href="../static/css/blogger/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/common.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/slide.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/jquery.nouislider.css">
</head>

<body>

<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">

        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="个人博客后台管理系统" src="../static/img/blogger/logo.jpg"></p>
        </div>

        <div id="personInfor">
            <p id="blogger">Ni RunFeng</p>
            <p><span>2570034697@qq.com</span></p>
            <p>
                <a href="${pageContext.request.contextPath}/index.do">退出登录</a>
            </p>
        </div>

        <div class="meun-title">博客</div>

        <%-- 博文管理 --%>
        <div class="meun-item meun-item-active" href="#blog" aria-controls="sour" role="tab" data-toggle="tab">
            <img src="../static/img/blogger/icon_source.png">博文管理
        </div>

        <%-- 博文类别管理 --%>
        <div class="meun-item" href="#blogType" aria-controls="user" role="tab" data-toggle="tab">
            <img src="../static/img/blogger/icon_user_grey.png">博文类别
        </div>

        <div class="meun-title">评论</div>

        <%-- 评论管理 --%>
        <div class="meun-item" href="#comment" aria-controls="user" role="tab" data-toggle="tab">
            <img src="../static/img/blogger/icon_change_grey.png">浏览者评论
        </div>

        <%-- 回复评论 --%>
        <div class="meun-item" href="#reply" aria-controls="user" role="tab" data-toggle="tab">
            <img src="../static/img/blogger/icon_user_grey.png">回复评论
        </div>

        <div class="meun-title">第三方</div>

        <%-- 友情链接 --%>
        <div class="meun-item" href="#link" aria-controls="user" role="tab" data-toggle="tab">
            <img src="../static/img/blogger/icon_link_grey.png">友情链接
        </div>

        <div class="meun-title">个人</div>

        <%-- 个人信息 --%>
        <div class="meun-item" href="#info" aria-controls="user" role="tab" data-toggle="tab">
            <img src="../static/img/blogger/icon_chara_grey.png">个人信息
        </div>

    </div>

    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">

        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>

        <div class="tab-content">

            <!-- 博文管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="blog">

                <div class="check-div form-inline">
                    <a href="${pageContext.request.contextPath}/compose.do">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal">添加博客</button>
                    </a>
                </div>

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">
                            博客ID
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            标题
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                            简介
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty blogList}">
                            Null Message for more blogs.
                        </c:if>
                        <c:if test="${!empty blogList}">
                            <c:forEach items="${blogList}" var="blog">
                                <div class="row">
                                    <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                                ${blog.id}
                                        </div>
                                        <div id="topAD" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button"
                                             data-toggle="collapse" data-parent="#accordion" href="#collapseSystem"
                                             aria-expanded="true" aria-controls="collapseOne">
                                            <span id="topA"
                                                  class="glyphicon">${blog.title}</span>
                                        </div>
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">${blog.summary}</div>
                                    </a>

                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <a href="${pageContext.request.contextPath}/turnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">修改</button>
                                        </a>

                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteSource">删除
                                        </button>

                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                </div>

                <!--弹出删除博客警告窗口-->
                <div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="hint">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteBlogByTitle.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        删除该博文，评论也将一并删除。请输入博客标题确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteTitle" name="deleteTitle" type="text">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input class="btn btn-xs btn-danger" type="submit" value="确定删除"/>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

            </div>

            <!-- 博文类别模块 -->
            <div role="tabpanel" class="tab-pane" id="blogType">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addBlogType">添加类型
                        </button>
                    </div>
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            类型ID
                        </div>
                        <div class="col-xs-2">
                            类型名称
                        </div>
                        <div class="col-xs-2">
                            类型排序号
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty blogTypeList}">
                            Null Message for more blogTypes.
                        </c:if>
                        <c:if test="${!empty blogTypeList}">
                            <c:forEach items="${blogTypeList}" var="blogType">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${blogType.id}
                                    </div>
                                    <div class="col-xs-2">
                                            ${blogType.typeName}
                                    </div>
                                    <div class="col-xs-2">
                                            ${blogType.orderNum}
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#reviseBlogType">
                                            修改
                                        </button>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteBlogType">
                                            删除
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                </div>

                <!--弹出添加类型窗口-->
                <div class="modal fade" id="addBlogType" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">添加类型</h4>
                            </div>

                            <form class="form-horizontal">

                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">类型名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" name="typeName"
                                                       placeholder="博文类型 *" id="typeName" required
                                                       data-validation-required-message="Please enter blog type name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi" name="orderNum"
                                                       placeholder="博文排序号 *" id="orderNum" required
                                                       data-validation-required-message="Please enter blog type order number.">
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="blogTypeCommit" class="btn btn-xs btn-green"
                                           type="button" name="blogTypeCommit" value="添加"/>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
                <!--弹出修改类型窗口-->
                <div class="modal fade" id="reviseBlogType" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改博客类型</h4>
                            </div>
                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">类型ID：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi" name="modifyId"
                                                       placeholder="类型ID *" id="modifyId" required
                                                       data-validation-required-message="Please enter blog type id.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">类型名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyTypeName"
                                                       placeholder="类型名称 *" id="modifyTypeName" required
                                                       data-validation-required-message="Please enter blog type name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="modifyOrderNum"
                                                       placeholder="排序号 *" id="modifyOrderNum" required
                                                       data-validation-required-message="Please enter blog type order num.">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="modifyBlogTypeCommit" class="btn btn-xs btn-green"
                                           type="button" name="blogTypeCommit" value="修 改"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--弹出删除用户警告窗口-->
                <div class="modal fade" id="deleteBlogType" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteBlogTypeByName.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        删除此类型，博文也将一并删除。请输入类型名称确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteBlogTypeName" name="deleteBlogTypeName" type="text">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input class="btn  btn-xs btn-danger" type="submit" value="确认删除"/>
                                </div>
                            </form>

                        </div>

                    </div>

                </div>

            </div>

            <!-- 浏览者评论模块 -->
            <div role="tabpanel" class="tab-pane" id="comment">

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            评论ID
                        </div>
                        <div class="col-xs-2">
                            昵称
                        </div>
                        <div class="col-xs-2">
                            内容 & 时间
                        </div>
                        <div class="col-xs-2">
                            邮箱
                        </div>
                        <div class="col-xs-2">
                            评论博文
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty commentList}">
                            Null Message for more comments.
                        </c:if>
                        <c:if test="${!empty commentList}">
                            <c:forEach items="${commentList}" var="comment">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${comment.id}
                                    </div>
                                    <div class="col-xs-2">
                                            ${comment.name}
                                    </div>
                                    <div class="col-xs-2" title="${comment.commentDate}">
                                            ${comment.content}
                                    </div>
                                    <div class="col-xs-2">
                                            ${comment.email}
                                    </div>
                                    <div class="col-xs-2">
                                        <a href="${pageContext.request.contextPath}/blog/.do?id=${comment.blog_id}">
                                                ${comment.blogTitle}
                                        </a>
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#sendCommentEmail">
                                            发送邮件
                                        </button>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteComment">
                                            删除
                                        </button>
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#sendCommentReply">
                                            回复
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>

                <!--弹出发送邮件窗口-->
                <div class="modal fade" id="sendCommentEmail" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h5 class="modal-title">向评论者发送邮件</h5>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">评论ID：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="commentId"
                                                       placeholder="评论ID *" id="commentId" required
                                                       data-validation-required-message="Please enter comment id.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">邮件标题：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="commentEmailSubject"
                                                       placeholder="邮件标题 *" id="commentEmailSubject" required
                                                       data-validation-required-message="Please enter email subject.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">邮件内容：</label>
                                            <div class="col-xs-8 ">
                                                <textarea type="text" class="form-control input-sm duiqi"
                                                          name="commentEmailMessage"
                                                          placeholder="邮件内容 *" id="commentEmailMessage" required
                                                          data-validation-required-message="Please enter email content."></textarea>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendCommentEmailBtn" class="btn btn-xs btn-green"
                                           type="button" name="sendCommentEmailBtn" value="发 送"/>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <!--弹出删除评论警告窗口-->
                <div class="modal fade" id="deleteComment" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">

                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确定要删除该评论？输入评论ID确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteCommentId" name="deleteCommentId" type="number">
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendCommentDeleteBtn" class="btn  btn-xs btn-danger"
                                           type="button" name="sendCommentDeleteBtn" value="删 除"/>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>

                <!--弹出回复评论内容窗口-->
                <div class="modal fade" id="sendCommentReply" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">

                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">回复评论</h4>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入回复的评论ID：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="replyCommentId"
                                                                                   name="replyCommentId" type="number"/><br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入回复的内容：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea id="replyContent"
                                                                                      name="replyContent"
                                                                                      type="text"></textarea>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendCommentReplyBtn" class="btn  btn-xs btn-danger"
                                           type="button" name="sendCommentReplyBtn" value="确 定"/>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>

            </div>

            <%-- 回复模块 --%>
            <div role="tabpanel" class="tab-pane" id="reply">

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            回复ID
                        </div>
                        <div class="col-xs-2">
                            内容
                        </div>
                        <div class="col-xs-2">
                            评论博文
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty replyList}">
                            Null Message for more reply
                        </c:if>
                        <c:if test="${!empty replyList}">
                            <c:forEach items="${replyList}" var="reply">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${reply.id}
                                    </div>
                                    <div class="col-xs-2" title="${reply.replyDate}">
                                            ${reply.content}
                                    </div>
                                    <div class="col-xs-2">
                                        <a href="${pageContext.request.contextPath}/blog/.do?id=${reply.blog_id}">
                                                ${reply.blogTitle}
                                        </a>
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteReply">
                                            删除回复
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>

                <!--弹出删除评论警告窗口-->
                <div class="modal fade" id="deleteReply" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">

                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确定要删除该回复？输入回复ID确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteReplyId" name="deleteReplyId" type="number">
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendReplyDeleteBtn" class="btn  btn-xs btn-danger"
                                           type="button" name="sendReplyDeleteBtn" value="删 除"/>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>

            </div>

            <!-- 友情链接管理模块 -->
            <div role="tabpanel" class="tab-pane" id="link">

                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addLink">添加链接</button>
                    </div>
                </div>

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            链接ID
                        </div>
                        <div class="col-xs-2">
                            链接名称
                        </div>
                        <div class="col-xs-2">
                            链接URL
                        </div>
                        <div class="col-xs-2">
                            排序号
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">

                        <c:if test="${empty linkList}">
                            Null Message for more link.
                        </c:if>
                        <c:if test="${!empty linkList}">
                            <c:forEach items="${linkList}" var="link">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${link.id}
                                    </div>
                                    <div class="col-xs-2">
                                            ${link.linkName}
                                    </div>
                                    <div class="col-xs-2">
                                            ${link.linkUrl}
                                    </div>
                                    <div class="col-xs-2">
                                            ${link.orderNum}
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#modifyLink">
                                            修 改
                                        </button>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteLink">
                                            删 除
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </div>
                </div>

                <!--弹出添加链接窗口-->
                <div class="modal fade" id="addLink" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">添加链接</h4>
                            </div>

                            <form class="form-horizontal">

                                <div class="modal-body">

                                    <div class="container-fluid">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">链接名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="addLinkName"
                                                       placeholder="链接名称 *" id="addLinkName" required
                                                       data-validation-required-message="Please enter link name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">链接URL：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" name="addLinkUrl"
                                                       placeholder="链接URL *" id="addLinkUrl" required
                                                       data-validation-required-message="Please enter link url.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="linkOrderNum"
                                                       placeholder="排序号 *" id="addLinkOrderNum" required
                                                       data-validation-required-message="Please enter link order num.">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消
                                        </button>
                                        <input id="addLinkCommit" class="btn btn-xs btn-green"
                                               type="button" name="addLinkCommit" value="添 加"/>
                                    </div>


                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <!--弹出修改链接窗口-->
                <div class="modal fade" id="modifyLink" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改链接</h4>
                            </div>
                            <form class="form-horizontal">

                                <div class="modal-body">

                                    <div class="container-fluid">

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">链接ID：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="modifyLinkId"
                                                       placeholder="链接ID *" id="modifyLinkId" required
                                                       data-validation-required-message="Please enter link id.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">链接名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyLinkName"
                                                       placeholder="链接名称 *" id="modifyLinkName" required
                                                       data-validation-required-message="Please enter link name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">链接URL：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyLinkUrl"
                                                       placeholder="链接URL *" id="modifyLinkUrl" required
                                                       data-validation-required-message="Please enter link url.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="modifyLinkOrderNum"
                                                       placeholder="排序号 *" id="modifyLinkOrderNum" required
                                                       data-validation-required-message="Please enter link order num.">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消
                                        </button>
                                        <input id="modifyLinkCommit" class="btn btn-xs btn-green"
                                               type="button" name="modifyLinkCommit" value="修 改"/>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--弹出删除链接警告窗口-->
                <div class="modal fade" id="deleteLink" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteLinkById.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除此链接请输入链接ID确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteLinkId" name="deleteLinkId" type="number">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input class="btn  btn-xs btn-danger" type="submit" value="确认删除"/>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

            </div>

            <!-- 个人信息管理模块 -->
            <div role="tabpanel" class="tab-pane" id="info">
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            用户名
                        </div>
                        <div class="col-xs-2">
                            邮箱
                        </div>
                        <div class="col-xs-2">
                            地址
                        </div>
                        <div class="col-xs-2">
                            电话
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">
                        <c:if test="${empty blogger}">
                            Null Message for blogger.
                        </c:if>
                        <c:if test="${!empty blogger}">
                            <div class="row">
                                <div class="col-xs-2 ">
                                        ${blogger.username}
                                </div>
                                <div class="col-xs-2">
                                        ${blogger.email}
                                </div>
                                <div class="col-xs-2">
                                        ${blogger.address}
                                </div>
                                <div class="col-xs-2">
                                        ${blogger.phone}
                                </div>
                                <div class="col-xs-2">
                                    <button class="btn btn-success btn-xs" data-toggle="modal"
                                            data-target="#modifyBloggerInfo">
                                        修改
                                    </button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <!--弹出修改信息窗口-->
                <div class="modal fade" id="modifyBloggerInfo" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改信息</h4>
                            </div>
                            <form class="form-horizontal">

                                <div class="modal-body">

                                    <div class="container-fluid">

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">用户名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerName"
                                                       placeholder="用户名 *" id="modifyBloggerName" required
                                                       data-validation-required-message="Please enter blogger name.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">邮箱：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerEmail"
                                                       placeholder="邮箱 *" id="modifyBloggerEmail" required
                                                       data-validation-required-message="Please enter blogger email.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerAddress"
                                                       placeholder="地址 *" id="modifyBloggerAddress" required
                                                       data-validation-required-message="Please enter blogger address.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">手机号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerPhone"
                                                       placeholder="手机号 *" id="modifyBloggerPhone" required
                                                       data-validation-required-message="Please enter blogger phone.">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消
                                        </button>
                                        <input id="modifyBloggerInfoCommit" class="btn btn-xs btn-green"
                                               type="button" name="modifyBloggerInfoCommit" value="修 改"/>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<script src="../static/js/blogger/jquery.nouislider.js"></script>

<%-- 添加博客类型 --%>
<script>
    $(function () {
        $("#blogTypeCommit").click(function () {

            var typeName = $("#typeName").val();
            var orderNum = $("#orderNum").val();

            var url = "${pageContext.request.contextPath}/addBlogType.do";
            var blogType = {
                typeName: typeName,
                orderNum: orderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blogType),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("添加博客类型成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("添加博客类型失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 修改博客类型 --%>
<script>
    $(function () {
        $("#modifyBlogTypeCommit").click(function () {

            var modifyId = $("#modifyId").val();
            var modifyTypeName = $("#modifyTypeName").val();
            var modifyOrderNum = $("#modifyOrderNum").val();

            var url = "${pageContext.request.contextPath}/modifyBlogType.do";
            var blogType = {
                id: modifyId,
                typeName: modifyTypeName,
                orderNum: modifyOrderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blogType),
                dataType: "JSON",
                success: function (result) {
                    alert("修改博客类型成功！");
                    if (result === true) {
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改博客类型失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交发送邮件 --%>
<script>
    $(function () {
        $("#sendCommentEmailBtn").click(function () {

            var commentId = $("#commentId").val();
            var subject = $("#commentEmailSubject").val();
            var message = $("#commentEmailMessage").val();

            var url = "${pageContext.request.contextPath}/sendCommentEmail.do";
            var email = {
                commentId: commentId,
                subject: subject,
                message: message
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(email),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("向评论者发送邮件成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("向评论者发送邮件失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交删除评论 --%>
<script>
    $(function () {
        $("#sendCommentDeleteBtn").click(function () {

            var id = $("#deleteCommentId").val();
            var url = "${pageContext.request.contextPath}/deleteCommentById.do";
            var comment = {
                id: id
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(comment),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("删除评论成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("删除评论失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交回复评论 --%>
<script>
    $(function () {
        $("#sendCommentReplyBtn").click(function () {

            var content = $("#replyContent").val();
            var commentId = $("#replyCommentId").val();

            var url = "${pageContext.request.contextPath}/replyComment.do";

            var reply = {
                content: content,
                commentId: commentId
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(reply),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("回复评论成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("回复评论失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交删除回复 --%>
<script>
    $(function () {
        $("#sendReplyDeleteBtn").click(function () {

            var id = $("#deleteReplyId").val();
            var url = "${pageContext.request.contextPath}/deleteReplyById.do";
            var reply = {
                id: id
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(reply),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("删除回复成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("删除回复失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 添加链接 --%>
<script>
    $(function () {
        $("#addLinkCommit").click(function () {

            var linkName = $("#addLinkName").val();
            var linkUrl = $("#addLinkUrl").val();
            var linkOrderNum = $("#addLinkOrderNum").val();

            var url = "${pageContext.request.contextPath}/addLink.do";

            var link = {
                linkName: linkName,
                linkUrl: linkUrl,
                orderNum: linkOrderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(link),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("添加链接成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("添加链接失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 修改链接 --%>
<script>
    $(function () {
        $("#modifyLinkCommit").click(function () {

            var id = $("#modifyLinkId").val();
            var linkName = $("#modifyLinkName").val();
            var linkUrl = $("#modifyLinkUrl").val();
            var linkOrderNum = $("#modifyLinkOrderNum").val();

            var url = "${pageContext.request.contextPath}/modifyLink.do";

            var link = {
                id: id,
                linkName: linkName,
                linkUrl: linkUrl,
                orderNum: linkOrderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(link),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("修改链接成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改链接失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 修改信息 --%>
<script>
    $(function () {
        $("#modifyBloggerInfoCommit").click(function () {

            var username = $("#modifyBloggerName").val();
            var email = $("#modifyBloggerEmail").val();
            var address = $("#modifyBloggerAddress").val();
            var phone = $("#modifyBloggerPhone").val();

            var url = "${pageContext.request.contextPath}/admin/modifyBloggerInfo.do";

            var blogger = {
                username: username,
                email: email,
                address: address,
                phone: phone
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blogger),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("修改信息成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改信息失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
</body>

</html>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>联系博主</title>

    <!-- Bootstrap Core CSS -->
    <link href="../static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="../static/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="../static/css/clean-blog.min.css" rel="stylesheet">

    <!-- Temporary navbar container fix until Bootstrap 4 is patched -->
    <style>
        .navbar-toggler {
            z-index: 1;
        }

        @media (max-width: 576px) {
            nav > .container {
                width: 100%;
            }
        }
    </style>

    <%-- 引入JQ --%>
    <script src="../static/js/jquery.min.js"></script>
    <script type="text/javascript">

        function sendEmail() {
            var nickname = $("#name").val();
            var sender = $("#email").val();
            var subject = $("#phone").val();
            var message = $("#message").val();
            var auth = $("#auth").val();

            var url = "${pageContext.request.contextPath}/sendEmail.do";
            var email = {
                nickname: nickname,
                sender: sender,
                subject: subject,
                message: message,
                auth: auth
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(email),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("邮件发送成功，博主将在24小时内回复！");
                        window.location.href = "../fore/contact.jsp";
                    } else {
                        alert("邮件发送失败！");
                        window.location.href = "../fore/contact.jsp";
                    }
                }
            })
        }

    </script>

</head>

<body>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-toggleable-md navbar-light" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu <i class="fa fa-bars"></i>
        </button>
        <iframe style="height:100px"frameborder="0" class="navbar-brand page-scroll" src="http://i.tianqi.com/index.php?c=code&id=12&icon=12&num=2&py=shenyang"></iframe>
        <%--<a class="navbar-brand page-scroll" href="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5">
            check the weather ;)</a>--%>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/index.do">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll"
                       href="${pageContext.request.contextPath}/defaultBlogType.do">TYPES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/about.do">BLOGGER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="../fore/contact.jsp">CONTACT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="../fore/search.jsp">SEARCH</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<header class="intro-header" style="background-image: url('../static/img/contact-bg.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <div class="page-heading">
                    <h2>技术人生 -- 多元沟通</h2>
                    <hr class="small">
                    <span class="subheading">Have questions? I have answers (maybe).</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">

            <p>Wanna get in touch with me? </p>
            <p> Fill out the form below to send me an email and I will try to get back to you within 24 hours!</p>

            <form id="contactForm" novalidate>

                <%-- 发送者昵称 --%>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Name</label>
                        <input type="text" class="form-control" placeholder="Name" id="name" required
                               data-validation-required-message="Please enter your name.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>

                <%-- 发送者邮件地址 --%>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Email Address</label>
                        <input type="email" class="form-control" placeholder="Email Address" id="email" required
                               data-validation-required-message="Please enter your email address.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>

                <%-- 发送者邮箱授权码 --%>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Email Auth</label>
                        <input type="text" class="form-control" placeholder="Email Auth" id="auth" required
                               data-validation-required-message="Please enter your email auth.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>

                <%-- 邮件主题 --%>
                <div class="control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Email Subject</label>
                        <input type="tel" class="form-control" placeholder="Email Subject" id="phone" required
                               data-validation-required-message="Please enter your email subject.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>

                <%-- 邮件内容 --%>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Message</label>
                        <textarea rows="5" class="form-control" placeholder="Message" id="message" required
                                  data-validation-required-message="Please enter a message."></textarea>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>

                <br>

                <div class="form-group">
                    <button id="sendBtn" class="btn btn-secondary" onclick="sendEmail()">SEND</button>
                </div>

            </form>

        </div>
    </div>
</div>

<hr>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <ul class="list-inline text-center">
                    <li class="list-inline-item">
                        <a href="https://blog.csdn.net/qq_36818328">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-stack-1x fa-inverse">C</i>
                                </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://www.zhihu.com">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-stack-1x fa-inverse">知</i>
                                </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://github.com">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                        </a>
                    </li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; all rights reserved 2019. Stephanie Went</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery Version 3.1.1 -->
<script src="../static/lib/jquery/jquery.js"></script>

<!-- Tether -->
<script src="../static/lib/tether/tether.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../static/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="../static/js/jqBootstrapValidation.js"></script>
<script src="../static/js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="../static/js/clean-blog.min.js"></script>

</body>

</html>

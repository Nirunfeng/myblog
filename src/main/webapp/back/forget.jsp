<%@ page language="java" pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>forget password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>


    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../static/css/login/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/login/animate.css">
    <link rel="stylesheet" href="../static/css/login/style.css">

    <!-- Modernizr JS -->
    <script src="../static/js/login/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="../static/js/login/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">

        function sendBloggerEmail() {
            var email = $("#email").val();
            if (email === "") {
                alert("请填写电子邮件地址！");
                location.reload();
            } else {
                //验证是否为博主的邮件地址
                var url = "${pageContext.request.contextPath}/checkMail.do";
                var blogger = {
                    email: email
                };
                $.ajax({
                    url: url,
                    contentType: "application/json",
                    type: "POST",
                    data: JSON.stringify(blogger),
                    dataType: "JSON",
                    success: function (result) {
                        if (result === true) {
                            alert("发送成功！即将跳转登陆");
                            window.location.href = "../back/login.jsp";
                        } else if (result === false) {
                            alert("发送失败，邮箱地址填写错误！");
                            location.reload();
                        }
                    }
                })
            }
        }

    </script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">


            <!-- Start Sign In Form -->
            <form action="#" class="fh5co-form animate-box" data-animate-effect="fadeIn">
                <h2>Forgot Password</h2>

                <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email" autocomplete="off">
                </div>

                <div class="form-group">
                    <p><a href="${pageContext.request.contextPath}/bloggerLogin.do">Sign In</a></p>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary" id="sendMailBtn" onclick="sendBloggerEmail()">Send Email</button>
                </div>

            </form>

        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;">
        <div class="col-md-12 text-center"><p>Copyright &copy; all rights reserved 2019. Stephanie Went</p></div>
    </div>
</div>

<!-- jQuery -->
<script src="../static/js/login/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../static/js/login/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="../static/js/login/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="../static/js/login/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="../static/js/login/main.js"></script>

</body>


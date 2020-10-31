<%@ page language="java" pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Stephanie - BackStage Developer & UI Designer</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../static/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../static/fonts/font-awesome/css/font-awesome.css">

    <!-- Stylesheet -->
    <link rel="stylesheet" type="text/css" href="../static/css/about.style.css">
    <link rel="stylesheet" type="text/css" href="../static/css/prettyPhoto.css">
    <link href='http://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>

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
                        alert("邮件发送成功，博主会在24小时内回复的！");
                        window.location.href = "../fore/about.jsp";
                    } else {
                        alert("邮件发送失败！");
                        window.location.href = "../fore/about.jsp";
                    }
                }
            })
        }

    </script>

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- Header -->
<header id="header">
    <div class="intro">
        <div class="container">
            <div class="row">
                <div class="intro-text">
                    <h1><spring:message code="one_hello"/><span class="name"> <spring:message code="one_name"/> </span>
                    </h1>
                    <p><spring:message code="one_job"/></p>
                    <a href="#about" class="btn btn-default btn-lg page-scroll"><spring:message code="one_more"/></a>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Navigation -->
<div id="nav">
    <nav class="navbar navbar-custom">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i></button>
                <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/index.do"><spring:message
                        code="one_home"/></a></div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li><a class="page-scroll" href="#about"><spring:message code="one_about"/></a></li>
                    <li><a class="page-scroll" href="#skills"><spring:message code="one_skill"/></a></li>
                    <li><a class="page-scroll" href="#portfolio"><spring:message code="one_portfolio"/></a></li>
                    <li><a class="page-scroll" href="#resume"><spring:message code="one_resume"/></a></li>
                    <li><a class="page-scroll" href="#contact"><spring:message code="one_contact"/></a></li>
                    <li>
                        <span>
                            <h6>
                                <a class="page-scroll"
                                   href="${pageContext.request.contextPath}/locale.do?locale=zh">中</a>
                                |
                                <a class="page-scroll"
                                   href="${pageContext.request.contextPath}/locale.do?locale=en">US</a>
                            </h6>
                        </span>
                    </li>
                </ul>
            </div>

        </div>
    </nav>
</div>
<!-- About Section -->
<div id="about">
    <div class="container">
        <div class="section-title text-center center">
            <h2><spring:message code="two_about"/></h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-md-12 text-center"><img src="../static/img/about.png" class="img-responsive" alt="avatar">
            </div>
            <div class="col-md-8 col-md-offset-2">
                <div class="about-text">
                    <p><spring:message code="two_introduction_one"/></p>
                    <p><spring:message code="two_introduction_two"/></p>
                    <p class="text-center"><a class="btn btn-primary" href="${pageContext.request.contextPath}/download.do"><i class="fa fa-download"></i>
                        <spring:message code="two_download"/></a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Skills Section -->
<div id="skills" class="text-center">
    <div class="container">
        <div class="section-title center">
            <h2><spring:message code="three_skill"/></h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 skill"><span class="chart" data-percent="95"> <span class="percent">95</span> </span>
                <h4>Spring</h4>
            </div>
            <div class="col-md-4 col-sm-6 skill"><span class="chart" data-percent="85"> <span class="percent">85</span> </span>
                <h4>Mybatis</h4>
            </div>
            <div class="col-md-4 col-sm-6 skill"><span class="chart" data-percent="80"> <span class="percent">80</span> </span>
                <h4>Python</h4>
            </div>
            <div class="col-md-4 col-sm-6 skill"><span class="chart" data-percent="80"> <span class="percent">80</span> </span>
                <h4>Php</h4>
            </div>
            <div class="col-md-4 col-sm-6 skill"><span class="chart" data-percent="70"> <span class="percent">70</span> </span>
                <h4>Photoshop</h4>
            </div>
            <div class="col-md-4 col-sm-6 skill"><span class="chart" data-percent="65"> <span class="percent">65</span> </span>
                <h4>Axure</h4>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Section -->
<div id="portfolio">
    <div class="container">
        <div class="section-title text-center center">
            <h2><spring:message code="four_portfolio"/></h2>
            <hr>
        </div>
        <div class="categories">
            <ul class="cat">
                <li>
                    <ol class="type">
                        <li><a href="#" data-filter="*" class="active"><spring:message code="four_all"/></a></li>
                        <li><a href="#" data-filter=".web"><spring:message code="four_backstage"/></a></li>
                        <li><a href="#" data-filter=".app"><spring:message code="four_school"/></a></li>
                        <li><a href="#" data-filter=".branding"><spring:message code="four_life"/></a></li>
                    </ol>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="row">
            <div class="portfolio-items">
                <div class="col-sm-6 col-md-3 col-lg-3 web">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/01-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>网站开发</h4>
                                <small>Web Developer</small></div>
                            <img src="../static/img/portfolio/01-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 app">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/02-large.png" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>沈工大</h4>
                                <small>school</small></div>
                            <img src="../static/img/portfolio/02-small.png" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 web">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/03-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>专业作品</h4>
                                <small>Web Developer</small></div>
                            <img src="../static/img/portfolio/03-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 web">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/04-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>专业作品</h4>
                                <small>Web Developer</small></div>
                            <img src="../static/img/portfolio/04-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 app">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/05-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>沈工大</h4>
                                <small>School</small></div>
                            <img src="../static/img/portfolio/05-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/06-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>热爱</h4>
                                <small>Life</small></div>
                            <img src="../static/img/portfolio/06-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 branding app">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/07-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>校园生活</h4>
                                <small>School, Life</small></div>
                            <img src="../static/img/portfolio/07-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 web">
                    <div class="portfolio-item">
                        <div class="hover-bg"><a href="../static/img/portfolio/08-large.jpg" title="Project description"
                                                 rel="prettyPhoto">
                            <div class="hover-text">
                                <h4>专业作品</h4>
                                <small>Web Developer</small></div>
                            <img src="../static/img/portfolio/08-small.jpg" class="img-responsive" alt="Project Title">
                        </a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tlinks">Collect from <a href="https://blog.csdn.net/Stephanie17395" title="CSDN">BLOGGER</a></div>
<!-- Achievements Section -->
<div id="achievements" class="text-center">
    <div class="container">
        <div class="section-title center">
            <h2><spring:message code="five_stats"/></h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-delay="200ms">
                <div class="achievement-box"><span class="count">10</span>
                    <h4><spring:message code="five_products"/></h4>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-delay="400ms">
                <div class="achievement-box"><span class="count">1000</span>
                    <h4><spring:message code="five_hour"/></h4>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-delay="600ms">
                <div class="achievement-box"><span class="count">30</span>
                    <h4><spring:message code="five_award"/></h4>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-delay="800ms">
                <div class="achievement-box"><span class="count">3</span>
                    <h4><spring:message code="five_year"/></h4>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Resume Section -->
<div id="resume" class="text-center">
    <div class="container">
        <div class="section-title center">
            <h2><spring:message code="six_experience"/></h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="timeline">
                    <li>
                        <div class="timeline-image">
                            <h4>May 2019 <br>
                                - <br>
                                Present </h4>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>SSM Project</h4>
                                <h4 class="subheading">Web Developer</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Simpleness and Sureness</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>Nov 2018 <br>
                                - <br>
                                May 2019 </h4>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Software Competition</h4>
                                <h4 class="subheading">Coder</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Hard Work Never Let Me Down</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image">
                            <h4>May 2018 <br>
                                - <br>
                                August 2018 </h4>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Awards On UNECS</h4>
                                <h4 class="subheading">UX Designer</h4>
                            </div>
                            <div class="timeline-body">
                                <p>start to shine.</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="section-title center">
            <h2><spring:message code="seven_education"/></h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="timeline">

                    <!-- Education Section-->

                    <li>
                        <div class="timeline-image">
                            <h4>2017 <br>
                                - <br>
                                2021 </h4>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Shenyang University of Technology</h4>
                                <h4 class="subheading">Master Degree of Software Engineering</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Keep going and pursuit what I really want.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>2014 <br>
                                - <br>
                                2017 </h4>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>PX High School</h4>
                                <h4 class="subheading">I Am A Good Boy</h4>
                            </div>
                            <div class="timeline-body">
                                <p>I have been taught to love and study.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image">
                            <h4>2011 <br>
                                - <br>
                                2014 </h4>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>PX ShiYan</h4>
                                <h4 class="subheading">Middle School</h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted">I appreciate everything!</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Contact Section -->
<div id="contact" class="text-center">
    <div class="container">
        <div class="section-title center">
            <h2><spring:message code="eight_contact"/></h2>
            <hr>
        </div>
        <div class="col-md-8 col-md-offset-2">
            <div class="col-md-4"><i class="fa fa-map-marker fa-2x"></i>
                <p>辽宁省沈阳市<br>
                    ${blogger.address}</p><!-- 沈阳工业大学 -->
            </div>
            <div class="col-md-4"><i class="fa fa-envelope-o fa-2x"></i>
                <p>${blogger.email}</p>
            </div>
            <div class="col-md-4"><i class="fa fa-phone fa-2x"></i>
                <p> +86 ${blogger.phone}</p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-8 col-md-offset-2">
            <h3><spring:message code="eight_leave"/></h3>

            <form id="contactForm" novalidate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="name" class="form-control"
                                   placeholder="<spring:message code="eight_name"/>" required="required">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" id="email" class="form-control"
                                   placeholder="<spring:message code="eight_email"/>" required="required">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="phone" class="form-control"
                                   placeholder="<spring:message code="eight_subject"/>"
                                   required="required">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="auth" class="form-control"
                                   placeholder="<spring:message code="eight_auth"/>"
                                   required="required">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <textarea name="message" id="message" class="form-control" rows="4"
                              placeholder="<spring:message code="eight_message"/>"
                              required></textarea>
                    <p class="help-block text-danger"></p>
                </div>
                <div id="success"></div>
                <button id="sendBtn" class="btn btn-default" onclick="sendEmail()"><spring:message
                        code="eight_send"/></button>
            </form>

            <div class="social">
                <ul>
                    <li><a href="https://blog.csdn.net/qq_36818328"><i class="fa">C</i></a></li>
                    <li><a href="https://www.zhihu.com"><i class="fa">知</i></a></li>
                    <li><a href="https://github.com"><i class="fa fa-github"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <div class="container text-center">
        <div class="fnav">
            <p>Copyright &copy; all rights reserved 2019. Stephanie Went</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="../static/js/about/jquery.1.11.1.js"></script>
<script type="text/javascript" src="../static/js/about/bootstrap.js"></script>
<script type="text/javascript" src="../static/js/about/SmoothScroll.js"></script>
<script type="text/javascript" src="../static/js/about/easypiechart.js"></script>
<script type="text/javascript" src="../static/js/about/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="../static/js/about/jquery.isotope.js"></script>
<script type="text/javascript" src="../static/js/about/jquery.counterup.js"></script>
<script type="text/javascript" src="../static/js/about/waypoints.js"></script>
<script type="text/javascript" src="../static/js/about/jqBootstrapValidation.js"></script>
<script type="text/javascript" src="../static/js/about/contact_me.js"></script>
<script type="text/javascript" src="../static/js/about/main.js"></script>

</body>
</html>
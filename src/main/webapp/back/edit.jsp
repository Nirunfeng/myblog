<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="ch">

<link rel="stylesheet" href="../static/kindeditor/themes/default/default.css"/>
<link rel="stylesheet" href="../static/kindeditor/plugins/code/prettify.css"/>
<script charset="utf-8" src="../static/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="../static/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="../static/kindeditor/plugins/code/prettify.js"></script>
<!-- Bootstrap Core CSS -->
<link href="../static/search-edit/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="../static/search-edit/assets/css/animate.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../static/search-edit/assets/css/style.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../static/search-edit/assets/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../static/search-edit/assets/css/pe-icons.css" rel="stylesheet">

<!-- jQuery -->
<script src="../static/search-edit/assets/js/jquery.js"></script>

<script>
    var editor;
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="content"]', {
            cssPath: '../static/kindeditor/plugins/code/prettify.css',
            uploadJson: '${pageContext.request.contextPath}/upload/fileUpload.do',
            items: ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'],
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                });
            }
        });
        prettyPrint();
    });
</script>

<body>
<section id="contact">
    <div class="section-inner">
        <div class="container">

            <div class="row">
                <div class="col-lg-12 text-center wow fadeInDown">
                    <h2 class="section-heading"><strong>博文</strong> 修改</h2>
                    <h3 class="section-subheading text-muted">Ideas Worth Spreading</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <form id="blogForm" method="post" style="width: 660px;">
                        <p><input type="text" class="form-control" name="title"
                                  placeholder="博文标题 *" id="title" required
                                  data-validation-required-message="Please enter your title."
                                  value="${blog.title}"/>
                        </p>
                        <p>
                            <textarea name="summary" class="form-control" id="summary" placeholder="博文摘要 *"
                                      required
                                      data-validation-required-message="Please enter your summary.">${blog.summary}</textarea>
                        </p>
                        <p>
                            <textarea id="content" name="content" type="text" cols="100" rows="8"
                                      style="height: 400px; visibility: hidden;" required>${blog.content}</textarea>
                        </p>
                        <p>
                            <input type="text" class="form-control" name="keyword" placeholder="关键字 *"
                                   id="keyword" required data-validation-required-message="Please enter your keyword."
                                   value="${blog.keyword}"/>
                        </p>
                        <p>
                            博客类型：
                            <select id="blogTypeId" name="blogTypeId">
                                <c:forEach items="${blogTypeList}" var="blogType">
                                    <option value="${blogType.id}">${blogType.typeName}</option>
                                </c:forEach>
                            </select><br>
                        </p>
                        <input id="commit" class="btn btn-outlined btn-primary pull-right"
                               type="button" name="submit" value="发布博客"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(function () {
        $("#commit").click(function () {

            var id = ${blog.id};
            var title = $("#title").val();
            var summary = $("#summary").val();
            var content = editor.html();
            var keyword = $("#keyword").val();
            var blogTypeId = $("#blogTypeId").val();

            var url = "${pageContext.request.contextPath}/edit.do";
            var blog = {
                id: id,
                title: title,
                summary: summary,
                content: content,
                keyword: keyword,
                blogTypeId: blogTypeId
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blog),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("修改博客成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改博客失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<!-- Bootstrap Core JavaScript -->
<script src="../static/search-edit/assets/js/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="../static/search-edit/assets/js/plugins.js"></script>
<!-- Plugins -->
<script src="../static/search-edit/assets/js/jqBootstrapValidation.js"></script>
<script src="../static/search-edit/assets/js/contact_me.js"></script>
<!-- Custom JavaScript -->
<script src="../static/search-edit/assets/js/init.js"></script>

</body>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NWPU校园招聘</title>
    <link rel="icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/css/index.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">
    <link rel="stylesheet" href="/static/css/resume.css">
    <link rel="stylesheet" href="/static/lib/toastr/toastr.css">
    <script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/lib/toastr/toastr.min.js"></script>
    <style>
        .toast-center-center{
            top:20%;
            left:35%;
        }
    </style>
    <script type="text/javascript">
        toastr.options = {
            closeButton: false,
            debug: false,
            progressBar: false,
            positionClass: "toast-center-center",
            onclick: null,
            showDuration: "300",
            hideDuration: "1000",
            timeOut: "1000",
            extendedTimeOut: "1000",
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "fadeIn",
            hideMethod: "fadeOut"
        };
    </script>

    <script type="text/javascript">
        //初始化编辑按钮
        $(function(){
            $(".btn-resumeSet").click(function () {
                var status = $(this).val();
                $.ajax({
                    url: "/company/updateStatus",
                    type: "post",
                    data: {
                        "status": status,
                        "jobId": ${jobId},
                        "resumeId": ${resume.id}
                    },
                    success:function (data) {
                        toastr.success("操作成功!");
                    },
                    error:function () {
                        toastr.success("操作失败!");
                    }
                });
            });
        })
    </script>
</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
    <c:import url="head.jsp"></c:import>
    <!--/导航条-->
</header>
<!--/头部区域  -->

<div style="background-color: #f6f6f8; width: 100%;">
    <div class="container" >
        <div class="col-md-8 col-md-offset-2">
            <div class="btn-group pull-right" role="group" aria-label="..." style="margin-bottom: 10px;margin-top: 15px;">
                <button type="button" class="btn btn-success btn-resumeSet" value="1">约请面试</button>
                <button type="button" class="btn btn-danger btn-resumeSet" value="2">十分抱歉</button>
                <a href="/company/jobHandle?jobId=${jobId}"><button type="button" class="btn btn-warning" >返回</button></a>
            </div>
        </div>
    </div>
</div>

<!-- 个人简历 -->
<section id="resume" style="background-color:#f6f6f8;margin-bottom: 30px;">
    <div class="container userInfo-container">
        <div class="col-md-8 col-md-offset-2 userInfo-title" style="box-shadow: 5px 5px 5px 5px #ccc;height:60px; border-radius:10px 10px 0 0;">

           <h3>${user.userName} 的简历</h3>
        </div>
        <div class="col-md-8 col-md-offset-2 userInfo-box" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 0 0 10px 10px;">
            <div class="media userInfo">
                <div class="media-body">
                    <h2 class="media-heading">${user.userName}</h2>
                    <div class="userInfo-labels">
                        <p><span><i class="glyphicon glyphicon-briefcase"></i>${resume.grade}</span></p>
                        <p><span><i class="glyphicon glyphicon-education"></i>${resume.location}</span></p>
                        <p><span><i class="glyphicon glyphicon-earphone"></i>${user.phone}</span></p>
                    </div>
                </div>
                <div class="media-right">
                    <div class="user-icon">
                        <img class="media-object" src="/static/img/nwpu.png" alt="...">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 个人优势</h3>
                <ul class="list-inline">
                    <c:forEach items="${advantages}" var="advantage">
                        <li><i class="glyphicon glyphicon-heart-empty"></i> ${advantage.name}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 项目经历</h3>
                <ul class="">
                    <c:forEach items="${projects}" var="project">
                        <li style="margin-bottom: 30px;">
                            <p><i class="glyphicon glyphicon-heart-empty"></i>项目名称： ${project.name}</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>负责工作： </span>${project.work}</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>项目简介： </span>${project.description}</p>

                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 获奖情况</h3>
                <ul class="list-inline">
                    <c:forEach items="${honors}" var="honor">
                        <li class="delete"><i class="glyphicon glyphicon-heart-empty"></i> ${honor.name}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 实习经历</h3>

                <ul class="">
                    <c:forEach items="${socialWorks}" var="socialWork">
                        <li style="margin-bottom: 30px;">
                            <p><i class="glyphicon glyphicon-heart-empty"></i>实习公司： ${socialWork.name}</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责工作： ${socialWork.work}</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目简介： ${socialWork.description}</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- /个人简历 -->

<!--footer-->
<c:import url="../user/footer.jsp"></c:import>
<!--/footer-->

<%--<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>--%>
<%--<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>--%>
</body>
</html>
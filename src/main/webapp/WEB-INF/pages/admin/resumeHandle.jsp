<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
                toastr.success("操作成功!");
            });
        })
    </script>
</head>

<body>
<div style="background-color: #f6f6f8; width: 100%;">
    <div class="container" >
        <div class="col-md-8 col-md-offset-2">
            <div class="btn-group pull-right" role="group" aria-label="..." style="margin-bottom: 10px;margin-top: 15px;">
                <button type="button" class="btn btn-success btn-resumeSet" >约请面试</button>
                <button type="button" class="btn btn-info btn-resumeSet" >等待通知</button>
                <button type="button" class="btn btn-danger btn-resumeSet" >十分抱歉</button>
                <a href=""><button type="button" class="btn btn-warning" >返回</button></a>
            </div>
        </div>
    </div>
</div>


<!-- 个人简历 -->
<section id="resume">
    <div class="container userInfo-container" style="margin-top:0;">
        <div class="col-md-8 col-md-offset-2 userInfo-box">
            <div class="media userInfo" >
                <div class="media-body">
                    <h2 class="media-heading">小明</h2>
                    <div class="userInfo-labels">
                        <p><span><i class="glyphicon glyphicon-briefcase"></i>2017级</span></p>
                        <p><span><i class="glyphicon glyphicon-education"></i>软件学院</span></p>
                        <p><span><i class="glyphicon glyphicon-earphone"></i>14792076163</span></p>
                    </div>
                </div>
                <div class="media-right">
                    <div class="user-icon">
                        <img class="media-object" src="/static/img/nwpu.png" alt="...">
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-8 col-md-offset-2 user-resume">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 个人优势</h3>
                <ul class="list-inline">
                    <li><i class="glyphicon glyphicon-heart-empty"></i> UI设计</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 编程</li>
                </ul>
            </div>

        </div>
        <div class="col-md-8 col-md-offset-2 user-resume">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 期望职位</h3>
                <ul class="list-inline">
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 建模</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 编程</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 写作</li>
                </ul>
            </div>

        </div>
        <div class="col-md-8 col-md-offset-2 user-resume">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 项目经历</h3>
                <ul class="list-inline">
                    <li><i class="glyphicon glyphicon-heart-empty"></i> IT图书管理系统</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 班级管理系统</li>
                </ul>
            </div>

        </div>
        <div class="col-md-8 col-md-offset-2 user-resume">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 资格证书</h3>
                <ul class="list-inline">
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 四级证书</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 六级证书</li>
                </ul>
            </div>

        </div>
        <div class="col-md-8 col-md-offset-2 user-resume">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 实习经历</h3>
                <ul class="">
                    <li>
                        <div>
                            <p>名字</p>
                            <p>这是一次实习经历</p>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>名字</p>
                            <p>这是一次实习经历</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 获奖情况</h3>
                <ul class="list-inline">
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 校数模一等奖</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 校数模二等奖</li>
                    <li><i class="glyphicon glyphicon-heart-empty"></i> 校数模三等奖</li>
                </ul>
            </div>
        </div>


    </div>
</section>
<!-- /个人简历 -->
</body>
</html>
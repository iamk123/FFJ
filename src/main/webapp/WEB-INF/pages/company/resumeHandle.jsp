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
                    url: "/admin/updateStatus",
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
                <a href="#" onclick="javascript:history.back()"><button type="button" class="btn btn-warning" >返回</button></a>
            </div>
        </div>
    </div>
</div>

<!-- 个人简历 -->
<section id="resume" style="background-color:#f6f6f8;margin-bottom: 30px;">
    <div class="container userInfo-container">
        <div class="col-md-8 col-md-offset-2 userInfo-title" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius:10px 10px 0 0;">
            当前简历信息不完善,影响聊天回复率,修改后你将获得更多的求职机会
            <a href=""><i class="glyphicon glyphicon-pencil"></i>修改</a>
        </div>
        <div class="col-md-8 col-md-offset-2 userInfo-box" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 0 0 10px 10px;">
            <div class="media userInfo">
                <div class="media-body">
                    <h2 class="media-heading">${sessionScope.user.name}</h2>
                    <div class="userInfo-labels">
                        <p><span><i class="glyphicon glyphicon-briefcase"></i>${resume.grade}</span></p>
                        <p><span><i class="glyphicon glyphicon-education"></i>${resume.location}</span></p>
                        <p><span><i class="glyphicon glyphicon-earphone"></i>${sessionScope.user.phone}</span></p>
                    </div>
                </div>
                <div class="media-right">
                    <div class="user-icon">
                        <img class="media-object" src="/static/img/nwpu.png" alt="...">
                    </div>
                </div>
            </div>
            <div class="edit-logo">
                <a href="/user/personInfo"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 个人优势</h3>
                <ul class="list-inline">
                    <c:forEach items="${advantages}" var="advantage">
                        <li><i class="glyphicon glyphicon-heart-empty"></i> ${advantage.name}<a href="/user/deleteAdvantage/${advantage.id}">x</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="edit-logo">
                <span  data-toggle="modal" data-target="#myModal-advantage"><i class="glyphicon glyphicon-pencil"></i>添加</span>
            </div>
            <!-- 个人优势模态框 -->
            <div class="modal fade" id="myModal-advantage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel-advantage"><strong>添加特长</strong></h3>
                        </div>
                        <div class="modal-body">
                            <form action="/user/addAdvantage" id="advantageForm" method="POST">
                                <input type="text" value="${resume.id}" class="sr-only" name="resumeId">
                                <div class="form-group">
                                    <label for="exampleInputText-advantage1">特长名称</label>
                                    <input type="text" class="form-control" id="exampleInputText-advantage1" placeholder="Email" name="name">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitAdvantageForm()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /个人优势模态框 -->
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 项目经历</h3>
                <ul class="">
                    <c:forEach items="${projects}" var="project">
                        <li style="margin-bottom: 30px;">
                            <p><i class="glyphicon glyphicon-heart-empty"></i>项目名称： ${project.name}<a href="/user/deleteProject/${project.id}">x</a></p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>负责工作： </span>${project.work}</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>项目简介： </span>${project.description}</p>

                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="edit-logo">
                <span  data-toggle="modal" data-target="#myModal-project"><i class="glyphicon glyphicon-pencil"></i>添加</span>
            </div>
            <!-- 项目经历模态框 -->
            <div class="modal fade" id="myModal-project" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel-project"><strong>添加项目经历</strong></h3>
                        </div>
                        <div class="modal-body">
                            <form action="/user/addProject" id="projectForm" method="POST">
                                <input type="text" value="${resume.id}" class="sr-only" name="resumeId">
                                <div class="form-group">
                                    <label for="exampleInputText-project1">项目名称</label>
                                    <input type="text" class="form-control" id="exampleInputText-project1" placeholder="项目名称" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputText-project2">负责任务</label>
                                    <input type="text" class="form-control" id="exampleInputText-project2" placeholder="负责任务" name="work">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputText-project3">项目介绍</label>
                                    <textarea class="form-control" rows="3" id="exampleInputText-project3" name="description"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitProjectForm()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /项目经历模态框 -->
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 获奖情况</h3>
                <ul class="list-inline">
                    <c:forEach items="${honors}" var="honor">
                        <li class="delete"><i class="glyphicon glyphicon-heart-empty"></i> ${honor.name}<a href="/user/deleteHonor/${honor.id}">x</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="edit-logo">
                <span  data-toggle="modal" data-target="#myModal-honor"><i class="glyphicon glyphicon-pencil"></i>添加</span>
            </div>
            <!-- 获奖情况模态框 -->
            <div class="modal fade" id="myModal-honor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel-honor"><strong>添加获奖情况</strong></h3>
                        </div>
                        <div class="modal-body">
                            <form action="/user/addHonor" id="honorForm" method="POST">
                                <input type="text" value="${resume.id}" class="sr-only" name="resumeId">
                                <div class="form-group">
                                    <label for="exampleInputText-honor1">名称</label>
                                    <input type="text" class="form-control" id="exampleInputText-honor1" placeholder="名称" name="name">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitHonorForm()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /获奖情况模态框 -->
        </div>
        <div class="col-md-8 col-md-offset-2 user-resume" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius: 10px;">
            <div class="summary user-resume-item">
                <h3><i class="glyphicon glyphicon-tags"></i> 实习经历</h3>

                <ul class="">
                    <c:forEach items="${socialWorks}" var="socialWork">
                        <li style="margin-bottom: 30px;">
                            <p><i class="glyphicon glyphicon-heart-empty"></i>实习公司： ${socialWork.name}<a href="/user/deleteSocialWork/${socialWork.id}">x</a></p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责工作： ${socialWork.work}</p>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目简介： ${socialWork.description}</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="edit-logo">
                <span  data-toggle="modal" data-target="#myModal-socialWorks"><i class="glyphicon glyphicon-pencil"></i>添加</span>
            </div>
            <!-- 实习经历模态框 -->
            <div class="modal fade" id="myModal-socialWorks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel-socialWorks"><strong>添加实习经历</strong></h3>
                        </div>
                        <div class="modal-body">
                            <form action="/user/addSocialWork" id="socialWorkForm" method="POST">
                                <input type="text" value="${resume.id}" class="sr-only" name="resumeId">
                                <div class="form-group">
                                    <label for="exampleInputText1">实习单位</label>
                                    <input type="text" class="form-control" id="exampleInputText1" placeholder="Email" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputText2">负责任务</label>
                                    <input type="text" class="form-control" id="exampleInputText2" placeholder="Email" name="work">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputText3">实习介绍</label>
                                    <textarea class="form-control" rows="3" id="exampleInputText3" name="description"></textarea>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitSocialWorkForm()">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /实习经历模态框 -->
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
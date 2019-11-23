<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/lib/nprogress/nprogress.css">
    <link rel="stylesheet" href="/static/css/admin/admin.css">
    <script src="/static/lib/nprogress/nprogress.js"></script>


</head>

<body>

<!-- 个人简历 -->
<section class="section-main">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 position-head">
                <div class="position-content">
                    <div class="position-content-l pull-left">
                        <div class="job-name" title="java开发工程师">
                            <h2>java开发工程师</h2>
                            <h5 style="color:#555;">xxxx公司</h5>
                        </div>
                        <dd>
                            <h5 style="color:#555;">
                                <span style="color:#fd5f39;">7k-12k </span>
                                <span> / 大三 /</span>
                                <span>老校区 /</span>
                                <span>周末</span>
                            </h5>
                        </dd>
                    </div>
                    <div class="position-content-r pull-right">
                        <div class="position-deal">
                            <div class="job-collection pull-left">
                                编辑
                            </div>
                            <div class="resume-deliver pull-right">
                                <a href="">返回</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<section class="section-main section-main-color">
    <div class="container">
        <div class="row job-info">
            <div class="col-md-6 col-md-offset-1 job-detail">
                <dt></dt>
                <dd>
                    <h4><strong>职位描述</strong></h4>
                    <div>
                        <h5><strong>技能要求：</strong></h5>
                        <p>c++, Java, Python</p>
                        <h5><strong>工作描述：</strong></h5>
                        <p>在公司技术体系框架下，负责智能化、信息化业务系统设计、技术支持；负责解决方案的研发、测试、架构和售前技术工作；配合工程实施、项目执行。</p>
                        <h5><strong>工作地点：</strong></h5>
                        <p>新校区</p>
                        <h5><strong>其他：</strong></h5>
                        <p>无</p>
                    </div>
                </dd>
            </div>
            <div class="col-md-4 job-companyInfo">
                <div class="job-company">
                    <dt>
                        <a href="">
                            <div>
                                <div class="company-icon"><img src="/static/img/company1.png" alt=""></div>
                                <div><h4>xxx公司<i class="glyphicon glyphicon-check" style="margin-left: 10px; color:#00b38a;"></i></h4></div>
                            </div>
                        </a>
                    </dt>
                    <dd>
                        <ul>
                            <li>移动互联网,数据服务</li>
                            <li>移动互联网,数据服务</li>
                            <li>移动互联网,数据服务</li>
                        </ul>
                    </dd>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /个人简历 -->

<!--应聘者列表-->
<div class="container-fluid col-md-10 col-md-offset-1" style="border:1px solid #ccc; margin-top:20px;padding:20px;">
    <div class="page-title">
        <h3>应聘者列表</h3>
    </div>
    <!-- 有错误信息时展示 -->
    <!-- <div class="alert alert-danger">
      <strong>错误！</strong>发生XXX错误
    </div> -->
    <div class="page-action">
        <!-- show when multiple checked -->
        <div class="btn-batch" style="display: none">
            <button class="btn btn-info btn-sm">批量批准</button>
            <button class="btn btn-warning btn-sm">批量拒绝</button>
            <button class="btn btn-danger btn-sm">批量删除</button>
        </div>
        <div style="display: flex;">
            <div style="margin-right:20px;">处理状态: </div>
            <div class="search-option">
                <select name="address">
                    <option value="">不限</option>
                    <option value="招聘者">已处理</option>
                    <option value="应聘者">约请面试</option>
                    <option value="管理员">抱歉</option>
                </select>
            </div>
        </div>
        <ul class="pagination pagination-sm pull-right">
            <li><a href="#">上一页</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">下一页</a></li>
        </ul>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="40"><input type="checkbox"></th>
            <th>name</th>
            <th>email</th>
            <th>phone</th>
            <th>状态</th>
            <th class="text-center" width="150">操作</th>
        </tr>
        </thead>
        <tbody>
        <tr class="danger">
            <td class="text-center"><input type="checkbox"></td>
            <th>name</th>
            <th>email</th>
            <th>phone</th>
            <th>通知面试</th>
            <td class="text-center">
                <a href="post-add.html" class="btn btn-info btn-xs">查看简历</a>
                <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
        </tr>
        <tr class="danger">
            <td class="text-center"><input type="checkbox"></td>
            <th>name</th>
            <th>email</th>
            <th>phone</th>
            <th>抱歉</th>
            <td class="text-center">
                <a href="post-add.html" class="btn btn-info btn-xs">查看简历</a>
                <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<!--/应聘者列表-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
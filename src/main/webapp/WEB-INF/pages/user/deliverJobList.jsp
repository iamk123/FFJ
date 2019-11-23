<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/css/public.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">


</head>

<body>
<!-- 头部区域 -->
<header>
    <!-- 导航条 -->
    <nav class="navbar navbar-nwpu">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">职位</a></li>
                    <li><a href="#">职位</a></li>
                    <li><a href="#">职位</a></li>
                    <li><a href="#">职位</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">消息</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户昵称 <span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-mean-nwpu">
                            <li><a href="#">个人中心</a></li>
                            <li><a href="#">账号设置</a></li>
                            <li><a href="#">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /导航条 -->
</header>
<!--/头部区域  -->



<!--register-->
<section style="margin-top:20px;">
    <div class="container">
        <div class="">
            <div class="panel panel-default">
                <div class="panel-heading" >我的应聘<div class="pull-right"><a href="post-add.html" class="btn btn-success btn-xs">返回</a></div></div>
                <div class="panel-body">
                    <div style="display: flex;">
                        <div style="margin-right:20px;">简历状态: </div>
                        <div class="search-option">
                            <select name="address">
                                <option value="">不限</option>
                                <option value="已处理">已处理</option>
                                <option value="约请面试">约请面试</option>
                                <option value="抱歉">抱歉</option>
                            </select>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" width="40"><input type="checkbox"></th>
                            <th>职位名称</th>
                            <th>公司</th>
                            <th>投递时间</th>
                            <th>状态</th>
                            <th class="text-center" width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="">
                            <td class="text-center"><input type="checkbox"></td>
                            <th>xx</th>
                            <th>xx</th>
                            <th>xx</th>
                            <th>已处理</th>
                            <td class="text-center">
                                <a href="post-add.html" class="btn btn-info btn-xs">详情</a>

                            </td>
                        </tr>
                        <tr class="">
                            <td class="text-center"><input type="checkbox"></td>
                            <th>xx</th>
                            <th>xx</th>
                            <th>xx</th>
                            <th>约请面试</th>
                            <td class="text-center">
                                <a href="post-add.html" class="btn btn-info btn-xs">详情</a>

                            </td>
                        </tr>
                        <tr class="">
                            <td class="text-center"><input type="checkbox"></td>
                            <th>xx</th>
                            <th>xx</th>
                            <th>xx</th>
                            <th>抱歉</th>
                            <td class="text-center">
                                <a href="post-add.html" class="btn btn-info btn-xs">详情</a>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

<!--/register-->


<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
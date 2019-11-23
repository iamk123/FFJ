<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>Comments &laquo; Admin</title>
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/lib/nprogress/nprogress.css">
    <link rel="stylesheet" href="/static/css/admin/admin.css">
    <script src="/static/lib/nprogress/nprogress.js"></script>
</head>
<body>
<script>NProgress.start()</script>

<div class="main">
    <nav class="navbar">
        <button class="btn btn-default navbar-btn fa fa-bars"></button>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="profile.html"><i class="fa fa-user"></i>个人中心</a></li>
            <li><a href="login.html"><i class="fa fa-sign-out"></i>退出</a></li>
        </ul>
    </nav>
    <div class="container-fluid">
        <div class="page-title">
            <div class="pull-left"><h1>所有用户</h1></div>
            <div class="pull-right">
                <a href="post-add.html" class="btn btn-success btn-md">添加</a>
            </div>
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
                <div style="margin-right:20px;">用户类型: </div>
                <div class="search-option">
                    <select name="address">
                        <option value="">不限</option>
                        <option value="招聘者">招聘者</option>
                        <option value="应聘者">应聘者</option>
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
                <th>id</th>
                <th>name</th>
                <th>username</th>
                <th>password</th>
                <th>email</th>
                <th>phone</th>
                <th>userType</th>
                <th class="text-center" width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="danger">
                <td class="text-center"><input type="checkbox"></td>
                <th>id</th>
                <th>name</th>
                <th>username</th>
                <th>password</th>
                <th>email</th>
                <th>phone</th>
                <th>应聘者</th>
                <td class="text-center">
                    <a href="post-add.html" class="btn btn-info btn-xs">修改</a>
                    <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
                </td>
            </tr>
            <tr class="danger">
                <td class="text-center"><input type="checkbox"></td>
                <th>id</th>
                <th>name</th>
                <th>username</th>
                <th>password</th>
                <th>email</th>
                <th>phone</th>
                <th>招聘者</th>
                <td class="text-center">
                    <a href="post-add.html" class="btn btn-info btn-xs">修改</a>
                    <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="aside">
    <div class="profile">
        <img class="avatar" src="/static/img/nwpu.png">
        <h3 class="name">小明</h3>
    </div>
    <ul class="nav">
        <li>
            <a href="index.html"><i class="fa fa-dashboard"></i>首页</a>
        </li>
        <li>
            <a href="#menu-posts" class="collapsed" data-toggle="collapse">
                <i class="fa fa-thumb-tack"></i>xx<i class="fa fa-angle-right"></i>
            </a>
            <ul id="menu-posts" class="collapse">

                <li><a href="posts.html">xx</a></li>
                <li><a href="post-add.html">xx</a></li>
                <li><a href="categories.html">xx</a></li>
            </ul>
        </li>
        <li class="active">
            <a href="comments.html"><i class="fa fa-comments"></i>xx</a>
        </li>
        <li>
            <a href="users.html"><i class="fa fa-users"></i>xx</a>
        </li>
        <li>
            <a href="#menu-settings" class="collapsed" data-toggle="collapse">
                <i class="fa fa-cogs"></i>设置<i class="fa fa-angle-right"></i>
            </a>
            <ul id="menu-settings" class="collapse">
                <li><a href="nav-menus.html">导航菜单</a></li>
                <li><a href="slides.html">图片轮播</a></li>
                <li><a href="settings.html">网站设置</a></li>
            </ul>
        </li>
    </ul>
</div>

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script>NProgress.done()</script>
</body>
</html>

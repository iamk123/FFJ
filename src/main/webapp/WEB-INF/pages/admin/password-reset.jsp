<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>Password reset &laquo; Admin</title>
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
            <h1>修改密码</h1>
        </div>
        <!-- 有错误信息时展示 -->
        <!-- <div class="alert alert-danger">
          <strong>错误！</strong>发生XXX错误
        </div> -->
        <form class="form-horizontal">
            <div class="form-group">
                <label for="old" class="col-sm-3 control-label">旧密码</label>
                <div class="col-sm-7">
                    <input id="old" class="form-control" type="password" placeholder="旧密码">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 control-label">新密码</label>
                <div class="col-sm-7">
                    <input id="password" class="form-control" type="password" placeholder="新密码">
                </div>
            </div>
            <div class="form-group">
                <label for="confirm" class="col-sm-3 control-label">确认新密码</label>
                <div class="col-sm-7">
                    <input id="confirm" class="form-control" type="password" placeholder="确认新密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-7">
                    <button type="submit" class="btn btn-primary">修改密码</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="aside">
    <div class="profile">
        <img class="avatar" src="/static/img/nwpu.png">
        <h3 class="name">布头儿</h3>
    </div>
    <ul class="nav">
        <li>
            <a href="index.html"><i class="fa fa-dashboard"></i>仪表盘</a>
        </li>
        <li>
            <a href="#menu-posts" class="collapsed" data-toggle="collapse">
                <i class="fa fa-thumb-tack"></i>文章<i class="fa fa-angle-right"></i>
            </a>
            <ul id="menu-posts" class="collapse">
                <li><a href="posts.html">所有文章</a></li>
                <li><a href="post-add.html">写文章</a></li>
                <li><a href="categories.html">分类目录</a></li>
            </ul>
        </li>
        <li>
            <a href="comments.html"><i class="fa fa-comments"></i>评论</a>
        </li>
        <li>
            <a href="users.html"><i class="fa fa-users"></i>用户</a>
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

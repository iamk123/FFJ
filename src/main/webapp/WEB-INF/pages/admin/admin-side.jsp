<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
<div class="aside">
    <div class="profile">
        <img class="avatar" src="/static/img/rng.jpg">
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
        <li>
            <a href="/admin/userList"><i class="fa fa-comments"></i>用户列表</a>
        </li>
        <li>
            <a href=/admin/jobList><i class="fa fa-users"></i>职位列表</a>
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

</body>
</html>

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

    <!--导航条-->
    <c:import url="admin-head.jsp"></c:import>
    <!--/导航条-->

    <div class="container-fluid">
        <div class="page-title">
            <h1>修改密码</h1>
        </div>
        <!-- 有错误信息时展示 -->
        <!-- <div class="alert alert-danger">
          <strong>错误！</strong>发生XXX错误
        </div> -->
        <form class="form-horizontal" method="POST" action="/admin/adminPasswordReset">
            <div class="form-group">
                <label for="old" class="col-sm-3 control-label">旧密码</label>
                <div class="col-sm-7">
                    <input id="old" name="origin" class="form-control" type="password" placeholder="旧密码" value="${origin}">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 control-label">新密码</label>
                <div class="col-sm-7">
                    <input id="password" name="newPassword" class="form-control" type="password" placeholder="新密码" value="${newPassword}">
                </div>
            </div>
            <div class="form-group">
                <label for="confirm" class="col-sm-3 control-label">确认新密码</label>
                <div class="col-sm-7">
                    <input id="confirm" name="confirm" class="form-control" type="password" placeholder="确认新密码" value="${confirm}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-7">
                    <button type="submit" class="btn btn-primary">修改密码</button>
                    <h5 style="color:red;">${msg}</h5>
                </div>
            </div>
        </form>
    </div>
</div>

<!--侧边栏-->
<c:import url="admin-side.jsp"></c:import>
<!--/侧边栏-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script>NProgress.done()</script>
</body>
</html>

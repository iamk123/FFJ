<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <link rel="stylesheet" href="/static/css/personInfo.css">
</head>

<body>
<!-- 个人信息 -->
<section id="personInfo-session">
    <div class="container personInfo">
        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 hidden-xs" style="margin-top:20px;">
            <img src="img/logo.png" alt="">
        </div>
        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 personInfo-form">
            <form>
                <div class="personInfo-form-title">修改个人信息</div>
                <div class="form-group">
                    <label for="exampleInputEmail1"><h4>昵称</h4></label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="nickName">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2"><h4>学号</h4></label>
                    <input type="text" class="form-control" id="exampleInputEmail2" placeholder="userName">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3"><h4>密码</h4></label>
                    <input type="password" class="form-control" id="exampleInputEmail3" placeholder="password">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail4"><h4>邮箱</h4></label>
                    <input type="email" class="form-control" id="exampleInputEmail4" placeholder="email">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail5"><h4>联系电话</h4></label>
                    <input type="email" class="form-control" id="exampleInputEmail5" placeholder="email">
                </div>
                <div style="display: flex;">
                    <button type="submit" class="btn btn-default personInfo-btn" style="margin-right: 20px;">修改</button>
                    <button type="submit" class="btn btn-default personInfo-btn">返回</button>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- /个人信息 -->



<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
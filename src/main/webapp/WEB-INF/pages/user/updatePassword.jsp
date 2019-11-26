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
    <link rel="stylesheet" href="/static/css/personInfo.css">

</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
    <c:import url="../head.jsp"></c:import>
    <!--/导航条-->

</header>
<!--/头部区域  -->
<!-- 个人信息 -->
<section id="personInfo-session">
    <div class="container personInfo" >
        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 personInfo-form" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius:10px;">
            <form method="POST" action="${pageContext.request.contextPath}updatePassword">
                <input type="text" name="id" value="${sessionScope.user.id}" class="sr-only">
                <div class="personInfo-form-title">修改密码</div>
                <div class="form-group">
                    <label for="exampleInputEmail1">原密码</label>
                    <input type="password" class="form-control" id="exampleInputEmail1" name="origin" placeholder="原密码" value="${origin}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">新密码</label>
                    <input type="password" class="form-control" id="exampleInputEmail2" name="newPassword" placeholder="新密码" value="${newPassword}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail5">确认密码</label>
                    <input type="password" class="form-control" id="exampleInputEmail5" name="confirm" placeholder="确认密码" value="${confirm}">
                </div>
                <h5 style="color:red;">${msg}</h5>
                <button type="submit" class="btn btn-default personInfo-btn">修改</button>
                <a href="/user"><button type="button" class="btn btn-default personInfo-btn personInfo-btn-return">返回</button></a>
            </form>
        </div>
    </div>
</section>
<!-- /个人信息 -->

<!--footer-->
<c:import url="footer.jsp"></c:import>
<!--/footer-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>NWPU校园招聘 &laquo; Admin</title>
    <link rel="icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/lib/nprogress/nprogress.css">
    <link rel="stylesheet" href="/static/css/admin/admin.css">
    <link rel="stylesheet" href="/static/css/personInfo.css">
    <script src="/static/lib/nprogress/nprogress.js"></script>
</head>
<body>
<script>NProgress.start()</script>

<div class="main">

    <!--导航条-->
    <c:import url="admin-head.jsp"></c:import>
    <!--/导航条-->

    <div class="container-fluid">
        <!-- 个人信息 -->
        <section id="personInfo-session">
            <div class="container personInfo">
                <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 personInfo-form" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius:10px;">
                    <form method="POST" action="/admin/updateUserInfo">
                        <input type="text" name="id" value="${user.id}" class="sr-only">
                        <div class="personInfo-form-title">${user.userName} 的基本信息</div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">昵称</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="name" placeholder="name" value="${user.name}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail2">账号</label>
                            <input type="text" class="form-control" readonly="readonly" id="exampleInputEmail2" name="userName" placeholder="userName" value="${user.userName}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail8">密码</label>
                            <input type="password" class="form-control" id="exampleInputEmail8" name="password" value="${user.password}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail5">邮箱</label>
                            <input type="email" class="form-control" id="exampleInputEmail5" name="email" placeholder="email" value="${user.email}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail6">联系方式</label>
                            <input type="text" class="form-control" id="exampleInputEmail6" placeholder="phone" name="phone" value="${user.phone}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail7">年级</label>
                            <input type="text" class="form-control" id="exampleInputEmail7" placeholder="grade" name="grade" value="${resume.grade}">
                        </div>
                        <div class="form-group">
                            <p>地址</p>
                            <div>
                                <select name="location">
                                    <option value="长安校区" <c:if test="${resume.location == '长安校区'}">selected</c:if>>长安校区</option>
                                    <option value="友谊校区" <c:if test="${resume.location == '友谊校区'}">selected</c:if>>友谊校区</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default personInfo-btn">修改</button>
                        <a href="#" onclick="javascript:history.back();"><button type="button" class="btn btn-default personInfo-btn personInfo-btn-return">返回</button></a>
                    </form>
                </div>
            </div>
        </section>
        <!-- /个人信息 -->
    </div>
</div>

<!--侧边栏-->
<c:import url="admin-side.jsp"></c:import>
<!--/侧边栏-->
<link rel="stylesheet" href="/static/lib/toastr/toastr.css">
<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/static/lib/toastr/toastr.min.js"></script>
<style>
    .toast-center-center{
        top:20%;
        left:35%;
    }
    #deliver{
        color:#fff;
        cursor: pointer;
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
    $(function(){
        var msg = '${msg}';
        if(msg == "2"){
            toastr.info("信息不能为空！");
        }else if(msg == "1"){
            toastr.success("修改成功！");
        }else if(msg == "0"){
            toastr.error("修改失败！");
        }
    })
</script>
<script>NProgress.done()</script>
</body>
</html>

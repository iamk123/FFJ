<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/MyTag.tld" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>Comments &laquo; Admin</title>
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/lib/nprogress/nprogress.css">
    <link rel="stylesheet" href="/static/css/admin/admin.css">
    <link rel="stylesheet" href="/static/css/index.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">
    <link rel="stylesheet" href="/static/css/personInfo.css">
    <script src="/static/lib/nprogress/nprogress.js"></script>
</head>
<body>
<script>NProgress.start()</script>

<div class="main">

    <!--导航条-->
    <c:import url="admin-head.jsp"></c:import>
    <!--/导航条-->

    <!-- 个人信息 -->
    <section id="personInfo-session">
        <div class="container personInfo">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 personInfo-form">
                <form action="/admin/userAdd" method="post">
                    <div class="personInfo-form-title">添加用户</div>
                    <div class="form-group">
                        <label for="exampleInputEmail1"><h4>昵称</h4></label>
                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="name" name="name" value=${user1.name} >
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail2"><h4>学号</h4></label>
                        <input type="text" class="form-control" id="exampleInputEmail2" placeholder="userName" name="userName" value=${user1.userName}>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail3"><h4>密码</h4></label>
                        <input type="password" class="form-control" id="exampleInputEmail3" name="password" value=${user1.password}>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail4"><h4>邮箱</h4></label>
                        <input type="email" class="form-control" id="exampleInputEmail4" placeholder="email" name="email" value=${user1.email} >
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail5"><h4>联系电话</h4></label>
                        <input type="text" class="form-control" id="exampleInputEmail5" placeholder="phone" name="phone" value=${user1.phone} >
                    </div>
                    <div class="list-inline" >
                        <label style="margin-right: 20px;"><input name="userType" type="radio" value="0" checked/> 应聘者 </label>
                        <label style="margin-right: 20px;"><input name="userType" type="radio" value="1"/> 招聘者 </label>
                        <label><input name="userType" type="radio" value="2"/> 管理员 </label>
                    </div>
                    <div style="color:red;">${msg}</div>
                    <div style="display: flex;">
                        <button type="submit" class="btn btn-default personInfo-btn" style="margin-right: 20px;">添加</button>
                        <a href="/admin/userList"><button type="button" class="btn btn-default personInfo-btn">返回</button> </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- /个人信息 -->
</div>

<!--侧边栏-->
<c:import url="admin-side.jsp"></c:import>
<!--/侧边栏-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    function submitForm() {
        var form = document.getElementById("getJobList"); //获取form表单对象
        form.submit();//form表单提交
    }
    $(function select() {
        var select = document.getElementById("selectId");
        var test = window.location.search.substr(1);
        console.log(test);
        console.log(test.split("=")[0] == "status");
        if (test.split("=")[0] == "status") {
            console.log(select.options.length);
            for (var i = 1; i < select.length; i++) {
                if (select.options[i].value == test.split('=')[1]){
                    console.log(select.options[i].text);
                    select.options[0].text = select.options[i].text;
                    break;}
            }
        }
        else select.options[0].text = "不限";
    })
</script>
<script>NProgress.done()</script>
</body>
</html>

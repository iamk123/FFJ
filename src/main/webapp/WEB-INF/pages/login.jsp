<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/lib/animate/animate.css">
    <link rel="stylesheet" href="/static/css/login.css">
</head>
<body>
<div class="container margin-top70">
    <div class="row shake animated">
        <div class="col-md-offset-3 col-md-5 ">
            <div class="head-pic col-md-offset-4 col-sm-offset-5 col-xs-offset-5" id="head-icon">
                <img src="/static/img/nwpu.png" alt="">
            </div>
            <form class="form-horizontal" action="/login" method="POST">
                <span class="heading" style="margin-left:5%;"> Sign In To Education System</span>
                <div class="form-group">
                    <input type="text" class="form-control" id="inputEmail3" placeholder="用户名或电子邮件" name="userName">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="密　码" name="password">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <div class="main-checkbox">
                        <input type="checkbox" value="None" id="checkbox1" name="check"/>
                        <label for="checkbox1"></label>
                    </div>
                    <span class="text">Remember me</span>
                    <button type="submit" class="btn btn-default">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>

</html>
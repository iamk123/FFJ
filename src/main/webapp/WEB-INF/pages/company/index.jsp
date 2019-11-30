<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/MyTag.tld" %>
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

</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
    <jsp:include page="../head.jsp"></jsp:include>
    <!--/导航条-->
</header>
<!--/头部区域  -->

<div class="container" style="margin-top:50px;">
    <div class="col-md-10 col-md-offset-1">
        <div class="jumbotron">
            <h1>Hello, welcome!</h1>
            <p><a class="btn btn-primary btn-lg" href="/company/postJob" role="button">发布职位</a></p>
        </div>
    </div>
</div>




<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
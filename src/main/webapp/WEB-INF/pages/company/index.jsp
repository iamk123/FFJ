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

</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
<%--    <c:import url="head.jsp"></c:import>--%>
    <jsp:include page="head.jsp"></jsp:include>
    <!--/导航条-->
</header>
<!--/头部区域  -->

<h1>这是company的首页</h1>


<!--footer-->
<%--<c:import url="../user/footer.jsp"></c:import>--%>
<jsp:include page="../user/footer.jsp"></jsp:include>>
<!--/footer-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
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
    <c:import url="../head.jsp"></c:import>
    <!--/导航条-->

    <!-- 搜索栏 -->
    <section class="hearder-search container-fluid">
        <div class="hearder-search-area">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                <form action="/job/search" method="GET">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="Search for..." name="key">
                        <span class="input-group-btn"><button class="btn btn-default" type="submit">搜索</button></span>
                    </div>
                </form>
            </div>
            <div class="col-md-6 col-md-offset-2 col-sm-8 col-sm-offset-2 hot-search">
                <span>热门搜索：</span>
                <ul>
                    <a href="/job/search?key=互联网"><li>互联网+</li></a>
                    <a href="/job/search?key=数模"><li>数模</li></a>
                    <a href="/job/search?key=美赛"><li>美赛</li></a>
                    <a href="/job/search?key=程序设计"><li>程序设计</li></a>
                    <a href="/job/search?key=大创"><li>大创</li></a>
                </ul>
            </div>
        </div>

    </section>
    <!-- /搜索栏 -->
</header>
<!--/头部区域  -->

<!-- 职位分类 -->
<section class="job-classify">
    <div class="container">
        <div>
            <!-- 轮播图 -->
            <div class="col-md-12" id="home_banner">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="/static/img/game1.jpg" alt="..." style="width: 100%;height:100%;">
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="/static/img/game2.jpg" alt="..." style="width: 100%;height:100%;">
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="/static/img/game3.jpg" alt="..." style="width: 100%;height:100%;">
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <!-- /轮播图 -->
        </div>
    </div>
</section>
<!-- /职位分类 -->

<!-- 竞赛列表 -->
<section id="hot-company">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">热门比赛</div>
            <div class="panel-body" >

                <c:forEach var="company" items="${companies}">
                    <div class="col-md-3 col-sm-6">
                        <div class="hot-company-item">
                            <div class="hot-company-title">
                                <div class="company-icon pull-left">
                                    <img src="/static/img/nwpu.png" alt="">
                                </div>
                                <div class="pull-right">
                                    <span>${company.name}</span>
                                    <ul class="list-inline">
                                        <li>互联网</li>|
                                        <li>计算机软件</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="hot-conpany-info">
                                <p><span>${company.number}</span>个职位在招</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</section>
<!-- /热门企业 -->

<!-- 城市热招 -->
<section id="hot-city">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">城市热点</h3>
            </div>
            <div class="panel-body">
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_beijing.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_shanghai.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_chengdu.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_guangzhou.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_hangzhou.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_nanjing.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_qingdao.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_changsha.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_suzhou.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_tianjin.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_wuhan.png" alt=""></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 city-item">
                    <a href=""><img src="/static/img/city_xian.png" alt=""></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /城市热招 -->

<!--footer-->
<c:import url="footer.jsp"></c:import>
<!--/footer-->

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
    function tip() {
        toastr.info("请登录后再试！");
    }
</script>
</body>
</html>
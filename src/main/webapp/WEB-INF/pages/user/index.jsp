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
    <jsp:include page="head.jsp"></jsp:include>
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
                    <a href=""><li>java</li></a>
                    <a href=""><li>IOS</li></a>
                    <a href=""><li>架构设计</li></a>
                    <a href=""><li>C++</li></a>
                    <a href=""><li>Python</li></a>
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
            <!-- 分类 -->
            <div class="col-md-4" id="sidebar">
                <div class="sidebar-item">
                    <div class="sidebar-item-title">技术</div>
                    <div class="sidebar-item-list">
                        <a href="">Java</a>
                        <a href="">PHP</a>
                        <a href="">C++</a>
                        <a href="">区块链</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">产品</div>
                    <div class="sidebar-item-list">
                        <a href="">产品总监</a>
                        <a href="">产品经理</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">设计</div>
                    <div class="sidebar-item-list">
                        <a href="">UI设计师</a>
                        <a href="">交互设计</a>
                        <a href="">网页设计师</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">运营</div>
                    <div class="sidebar-item-list">
                        <a href="">新媒体运营</a>
                        <a href="">编辑</a>
                        <a href="">数据运营</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">技术</div>
                    <div class="sidebar-item-list">
                        <a href="">Java</a>
                        <a href="">PHP</a>
                        <a href="">C++</a>
                        <a href="">区块链</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">产品</div>
                    <div class="sidebar-item-list">
                        <a href="">产品总监</a>
                        <a href="">产品经理</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">设计</div>
                    <div class="sidebar-item-list">
                        <a href="">UI设计师</a>
                        <a href="">交互设计</a>
                        <a href="">网页设计师</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <div class="sidebar-item-title">运营</div>
                    <div class="sidebar-item-list">
                        <a href="">新媒体运营</a>
                        <a href="">编辑</a>
                        <a href="">数据运营</a>
                    </div>
                </div>
            </div>
            <!-- /分类 -->
            <!-- 轮播图 -->
            <div class="col-md-8" id="home_banner">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="/static/img/home_banner1.JPG" alt="...">
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="/static/img/home_banner2.JPG" alt="...">
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

<!-- 热门企业 -->
<section id="hot-company">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">热门企业</div>
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
                <h3 class="panel-title">城市热招</h3>
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
<jsp:include page="footer.jsp"></jsp:include>
<!--/footer-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
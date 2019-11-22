<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NWPU校园招聘</title>
    <link rel="icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">
    <link rel="stylesheet" href="/static/css/search.css">
    <link rel="stylesheet" href="/static/css/public.css">

</head>

<body>
<!-- 头部区域 -->
<header>
    <!-- 导航条 -->
    <nav class="navbar navbar-nwpu">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">职位</a></li>
                    <li><a href="#">职位</a></li>
                    <li><a href="#">职位</a></li>
                    <li><a href="#">职位</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">消息</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户昵称 <span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-mean-nwpu">
                            <li><a href="#">个人中心</a></li>
                            <li><a href="#">账号设置</a></li>
                            <li><a href="#">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /导航条 -->
    <!-- 搜索栏 -->
    <section class="hearder-search container-fluid">
        <form action="/job/search" method="GET">
            <div class="hearder-search-area">
                <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="Search for..." value="<c:if test="${conditionMap.get('key') != ''}">${conditionMap.get('key')}</c:if>" name="key">
                        <span class="input-group-btn"><button class="btn btn-default" type="submit">搜索</button></span>
                    </div>
                </div>

                <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2" style="margin-top:20px;display: flex;align-items:center">
                    <div>地点: </div>
                    <div class="search-option">
                        <select name="address">
                            <option value="">不限</option>
                            <option value="长安校区" <c:if test="${conditionMap.get('address').equals('长安校区')}">selected</c:if>>长安校区</option>
                            <option value="友谊校区" <c:if test="${conditionMap.get('address').equals('友谊校区')}">selected</c:if>>友谊校区</option>
                        </select>
                    </div>

                    <div style="margin-left: 20px;">类别：</div>
                    <div class="search-option">
                        <select name="kind">
                            <option value="">不限</option>
                            <option value="语言" <c:if test="${conditionMap.get('kind').equals('语言')}">selected</c:if>>语言</option>
                            <option value="文档" <c:if test="${conditionMap.get('kind').equals('文档')}">selected</c:if>>文档</option>
                            <option value="设计" <c:if test="${conditionMap.get('kind').equals('设计')}">selected</c:if>>设计</option>
                            <option value="编程" <c:if test="${conditionMap.get('kind').equals('编程')}">selected</c:if>>编程</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <!-- /搜索栏 -->
</header>
<!--/头部区域  -->

<!-- 职位列表 -->
<section class="section-main">
    <div class="container-fluid">
            <div class="row">
                <!--left 工作列表-->
                <div class="col-md-6 col-md-offset-2 col-sm-8 col-sm-offset-2 section-body">
                    <c:forEach var="pb" items="${job.list}">
                        <div class="job-item">
                            <div>
                                <a href="/job/jobDetail/${pb.id}">
                                    <p><span style="color:#00c2b3;font-size: 16px;">${pb.jobName}</span>  <span style="color: #fc703e; font-size: 16px">${pb.salary}</span></p>
                                    <p style="color:#9fa3b0; font-size: 12px;"><span>${pb.location}</span> | <span>${pb.needNum} 人</span> | <span>${pb.jobRequire}</span> | <span>${pb.kind}</span> </p>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                    <!--分页-->
                    <c:if test="${job.totalPage != 1}">

                    </c:if>
                    <c:if test="${job.totalPage > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <!--前一页禁用-->
                                <c:if test="${job.currentPage <= 1}">
                                    <li class="disabled">
                                        <a href="javascript:void(0);" aria-label="Previous">
                                </c:if>
                                <c:if test="${job.currentPage > 1}">
                                    <li>
                                        <a href="/job/search2?currentPage=${job.currentPage-1}&&key=${conditionMap.get('key')}&&address=${conditionMap.get('address')}&&kind=${conditionMap.get('kind')}" aria-label="Previous">
                                </c:if>

                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${job.totalPage}" var="i">
                                    <li><a href="/job/search2?currentPage=${job.currentPage=i}&&key=${conditionMap.get('key')}&&address=${conditionMap.get('address')}&&kind=${conditionMap.get('kind')}">${i}</a></li>
                                </c:forEach>
                                <!--后一页禁用-->
                                <c:if test="${conditionMap.get('currentPage') >= job.totalPage}">
                                    <li class="disabled">
                                        <a href="javascript:void(0);" aria-label="Next">
                                </c:if>
                                <c:if test="${conditionMap.get('currentPage') < job.totalPage}">
                                    <li>
                                        <a href="/job/search2?currentPage=${job.currentPage+1}&&key=${conditionMap.get('key')}&&address=${conditionMap.get('address')}&&kind=${conditionMap.get('kind')}" aria-label="Next">
                                </c:if>
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>

                        </nav>
                        <h5>当前第${conditionMap.get("currentPage")}页，共${job.totalPage}页!</h5>
                    </c:if>

                </div>
                <!--right 广告图-->
                <div class="col-md-3 hidden-sm hidden-xs job-item-banner">
                    <div class="banner-item">
                        <img src="/static/img/city_guangzhou.png" alt="">
                    </div>
                    <div class="banner-item">
                        <img src="/static/img/city_chengdu.png" alt="">
                    </div>
                    <div class="banner-item">
                        <img src="/static/img/city_xian.png" alt="">
                    </div>
                </div>
            </div>


    </div>
</section>
<!-- /职位列表 -->


<!-- footer -->
<footer id="footer">
    <div class="container hidden-xs hidden-sm">
        <div class="col-md-2 footer-item">
            <dl>企业服务</dl>
            <dd>
                <a href="">职业搜索</a>
                <a href="">新闻资讯</a>
                <a href="">NWPU招聘</a>
            </dd>
        </div>
        <div class="col-md-2 footer-item">
            <dl>使用与帮助</dl>
            <dd>
                <a href="">用户协议与隐私政策</a>
                <a href="">防骗指南</a>
                <a href="">职位发布规则</a>
                <a href="">使用帮助</a>
            </dd>
        </div>
        <div class="col-md-4 footer-item">
            <dl>联系NWPU招聘</dl>
            <dd>
                <a href="">陕西NWPU校园招聘</a>
                <a href="">公司地址 陕西省西安市长安区西北工业大学</a>
                <a href="">联系电话 14792076163</a>
                <a href="">违法和不良信息举报邮箱 1249248952@qq.com</a>
            </dd>
        </div>
        <div class="col-md-4  footer-item footer-companyInfo">
            <dl>NWPU招聘</dl>
            <dd>
                <p>
                    企业服务热线和举报电话
                    <span>400 000 000</span>
                </p>
                <p>
                    工作日
                    <span>8:00-24:00</span>
                </p>
                <p>
                    休息9:30-18:30
                    <span></span>
                </p>
                <!-- 	<p class="footer-icon">
                        <a href=""></a>
                    </p> -->
            </dd>
        </div>
    </div>
</footer>
<!-- /footer -->
<!-- copyright -->
<div class="copyright container hidden-xs hidden-sm">
    <p>
        <span>Copyright © 2019 NWPU招聘</span>
        <span>京ICP备14013441号-5</span>
        <span>京ICP证150923号</span>
        <span><a href=""><i class="glyphicon glyphicon-bullhorn"></i> 电子营业执照</a></span>
        <span><a href=""><i class="glyphicon glyphicon-align-justify"></i> 京公网安备11010502032801</a></span>
        <span><a href="http://sdwj.zhipin.com/web/index.html"><i class="glyphicon glyphicon-user"></i> 首都网警</a></span>
        <span><a href=""><i class="glyphicon glyphicon-tag"></i> 人力资源服务许可证</a></span>
    </p>
</div>
<!-- /copyright -->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
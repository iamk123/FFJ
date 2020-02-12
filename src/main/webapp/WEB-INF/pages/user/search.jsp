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
    <script>
        function submitForm() {
            console.log("1");
            var form = $("#jobList");
            console.log("2");
            form.submit();
        }
    </script>
</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
    <c:import url="../head.jsp"></c:import>
    <!--/导航条-->
    <!-- 搜索栏 -->
    <section class="hearder-search container-fluid">
        <form action="/job/search" method="GET" id="jobList">
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
                        <select name="address" onchange="submitForm()">
                            <option value="">不限</option>
                            <option value="长安校区" <c:if test="${conditionMap.get('address').equals('长安校区')}">selected</c:if>>长安校区</option>
                            <option value="友谊校区" <c:if test="${conditionMap.get('address').equals('友谊校区')}">selected</c:if>>友谊校区</option>
                        </select>
                    </div>

                    <div style="margin-left: 20px;">类别：</div>
                    <div class="search-option">
                        <select name="kind" onchange="submitForm()">
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
                    <c:forEach var="jobs" items="${pb.list}">
                        <div class="job-item">
                            <div>
                                <a href="/job/jobDetail/${jobs.id}">
                                    <p><span style="color:#00c2b3;font-size: 16px;">${jobs.jobName}</span>  <span style="color: #fc703e; font-size: 16px">${jobs.salary}</span></p>
                                    <p style="color:#9fa3b0; font-size: 12px;"><span>${jobs.location}</span> | <span>${jobs.needNum} 人</span> | <span>${jobs.jobRequire}</span> | <span>${jobs.kind}</span> </p>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                    <!--分页-->
                    <c:if test="${pb.totalPage != 1}">

                    </c:if>
                    <c:if test="${pb.totalPage > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <!--前一页禁用-->
                                <c:if test="${pb.currentPage <= 1}">
                                    <li class="disabled">
                                        <a href="javascript:void(0);" aria-label="Previous">
                                </c:if>
                                <c:if test="${pb.currentPage > 1}">
                                    <li>
                                        <a href="/job/search?key=${conditionMap.get('key')}&&address=${conditionMap.get('address')}&&kind=${conditionMap.get('kind')}&&currentPage=${pb.currentPage-1}" aria-label="Previous">
                                </c:if>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                                    <li class="<c:if test='${pb.currentPage == i}'>active</c:if>"><a href="/job/search?key=${conditionMap.get('key')}&&address=${conditionMap.get('address')}&&kind=${conditionMap.get('kind')}&&currentPage=${i}">${i}</a></li>
                                </c:forEach>
                                <!--后一页禁用-->
                                <c:if test="${pb.currentPage >= pb.totalPage}">
                                    <li class="disabled">
                                        <a href="javascript:void(0);" aria-label="Next">
                                </c:if>
                                <c:if test="${pb.currentPage < pb.totalPage}">
                                    <li>
                                        <a href="/job/search?key=${conditionMap.get('key')}&&address=${conditionMap.get('address')}&&kind=${conditionMap.get('kind')}&&currentPage=${pb.currentPage+1}" aria-label="Next">
                                </c:if>
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>

                        </nav>

                    </c:if>
                    <h5>当前第${pb.currentPage}页，共${pb.totalPage}页!</h5>
                    <!--/分页-->
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
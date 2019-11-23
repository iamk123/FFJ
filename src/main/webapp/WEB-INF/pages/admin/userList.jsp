<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>Comments &laquo; Admin</title>
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/lib/nprogress/nprogress.css">
    <link rel="stylesheet" href="/static/css/admin/admin.css">
    <script src="/static/lib/nprogress/nprogress.js"></script>
</head>
<body>
<script>NProgress.start()</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>
<div class="main">
    <nav class="navbar">
        <button class="btn btn-default navbar-btn fa fa-bars"></button>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="profile.html"><i class="fa fa-user"></i>个人中心</a></li>
            <li><a href="login.html"><i class="fa fa-sign-out"></i>退出</a></li>
        </ul>
    </nav>
    <div class="container-fluid">
        <div class="page-title">
            <div class="pull-left"><h1>所有用户</h1></div>
            <div class="pull-right">
                <a href="post-add.html" class="btn btn-success btn-md">添加</a>
            </div>
        </div>
        <!-- 有错误信息时展示 -->
        <!-- <div class="alert alert-danger">
          <strong>错误！</strong>发生XXX错误
        </div> -->
        <div class="page-action">
            <!-- show when multiple checked -->
            <div class="btn-batch" style="display: none">
                <button class="btn btn-info btn-sm">批量批准</button>
                <button class="btn btn-warning btn-sm">批量拒绝</button>
                <button class="btn btn-danger btn-sm">批量删除</button>
            </div>
            <div style="display: flex;">
                <div style="margin-right:20px;">用户类型: </div>
                <div class="search-option">
                    <form action="${pageContext.request.contextPath}userList" method="GET"  id="getUserList">
                        <select id="selectId" name="userType" onchange="submitForm();">
                            <option disabled="disabled" selected="selected"></option>
                            <option value="3" id="op3">不限</option>
                            <option value="0" id="op0">应聘者</option>
                            <option value="1" id="op1">招聘者</option>
                            <option value="2" id="op2">管理员</option>

                        </select>

                        <script type="text/javascript">
                            function submitForm() {
                                var form = document.getElementById("getUserList"); //获取form表单对象
                                form.submit();//form表单提交
                            }
                            $(function select() {
                                var select = document.getElementById("selectId");
                                var test = window.location.search.substr(1);
                                console.log(test);
                                console.log(test.split("=")[1]);
                                console.log(test.split("=")[0] == "userType");
                                if (test.split("=")[0] == "userType") {
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

                    </form>
                </div>
            </div>
            <div class="pull-right">
                当前第${users.currentPage}页，共${users.totalPage}页！
                <c:if test="${users.totalPage > 1 }">
                    <ul class="pagination">
                        <!--前一页禁用-->
                        <c:if test="${users.currentPage == 1}">
                        <li class="disabled">
                            </c:if>
                            <c:if test="${users.currentPage != 1}">
                        <li>
                            </c:if>
                            <a href="userList?<c:if test="${param.userType}!=''">${param.userType}&currentPage=${users.currentPage-1}</c:if>
                            userType=${users.list[0].userType}&currentPage=${users.currentPage-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${users.totalPage}" var="i">
                            <li><a href="userList?<c:if test="${param.userType}!=''">${param.userType}&currentPage=${i}</c:if>
                            userType=${users.list[0].userType}&currentPage=${i}">${i}
                            </a></li>
                        </c:forEach>
                        <!--后一页禁用-->
                        <c:if test="${users.currentPage == users.totalPage}">
                        <li class="disabled">
                            </c:if>
                            <c:if test="${users.currentPage != users.totalPage}">
                        <li>
                            </c:if>
                            <a href="userList?<c:if test="${param.userType}!=''">${param.userType}&currentPage=${users.currentPage+1}</c:if>
                            userType=${users.list[0].userType}&currentPage=${users.currentPage+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </c:if>
            </div>
        </div>
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="40"><input type="checkbox"></th>
                <th>id</th>
                <th>name</th>
                <th>username</th>
                <%-- <th>password</th>--%>
                <th>email</th>
                <th>phone</th>
                <th>userType</th>
                <th class="text-center" width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users.list}" var="user" varStatus="i">
                <c:if test="${i.count%2 == 0}">
                    <tr>
                </c:if>
                <c:if test="${i.count%2 == 1}">
                    <tr class="warning">
                </c:if>
                    <td class="text-center"><input type="checkbox"></td>
                    <th>${user.id}</th>
                    <th>${user.name}</th>
                    <th>${user.userName}</th>
                        <%--<th>password</th>--%>
                    <th>${user.email}</th>
                    <th>${user.phone}</th>
                    <th>
                        <c:choose>
                            <c:when test="${user.userType == 0}">应聘者</c:when>
                            <c:when test="${user.userType == 1}">招聘者</c:when>
                            <c:when test="${user.userType == 2}">管理员</c:when>
                        </c:choose>
                    </th>
                    <td class="text-center">
                        <a href="post-add.html" class="btn btn-info btn-xs">修改</a>
                        <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="aside">
    <div class="profile">
        <img class="avatar" src="/static/img/rng.jpg">
        <h3 class="name">小明</h3>
    </div>
    <ul class="nav">
        <li>
            <a href="index.html"><i class="fa fa-dashboard"></i>首页</a>
        </li>
        <li>
            <a href="#menu-posts" class="collapsed" data-toggle="collapse">
                <i class="fa fa-thumb-tack"></i>xx<i class="fa fa-angle-right"></i>
            </a>
            <ul id="menu-posts" class="collapse">

                <li><a href="posts.html">xx</a></li>
                <li><a href="post-add.html">xx</a></li>
                <li><a href="categories.html">xx</a></li>
            </ul>
        </li>
        <li class="active">
            <a href="/admin/userList"><i class="fa fa-comments"></i>用户列表</a>
        </li>
        <li>
            <a href="users.html"><i class="fa fa-users"></i>xx</a>
        </li>
        <li>
            <a href="#menu-settings" class="collapsed" data-toggle="collapse">
                <i class="fa fa-cogs"></i>设置<i class="fa fa-angle-right"></i>
            </a>
            <ul id="menu-settings" class="collapse">
                <li><a href="nav-menus.html">导航菜单</a></li>
                <li><a href="slides.html">图片轮播</a></li>
                <li><a href="settings.html">网站设置</a></li>
            </ul>
        </li>
    </ul>
</div>

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script>NProgress.done()</script>
</body>
</html>
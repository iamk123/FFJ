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

<div class="main">
     <c:import url="admin-head.jsp"></c:import>
    <div class="container-fluid">
        <div class="page-title">
            <h1>所有职位</h1>
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
                    <form action="${pageContext.request.contextPath}jobList" method="GET"  id="getJobList">
                    <select id="selectId" name="status" onchange="submitForm();">
                        <option disabled="disabled" selected="selected"></option>
                        <option value="3">不限</option>
                        <option value="0">未处理</option>
                        <option value="1">约请面试</option>
                        <option value="2">抱歉</option>
                    </select>
                    </form>
                </div>
            </div>
            <ul class="pagination pagination-sm pull-right">
                当前第${jobs.currentPage}页，共${jobs.totalPage}页！
                <c:if test="${jobs.totalPage > 1 }">
                <ul class="pagination">
                    <!--前一页禁用-->
                    <c:if test="${jobs.currentPage == 1}">
                    <li class="disabled">
                        </c:if>
                        <c:if test="${jobs.currentPage != 1}">
                    <li>
                        </c:if>
                        <a href="jobList?<c:if test="${param.status}!=''">${param.status}&currentPage=${jobs.currentPage-1}</c:if>
                            status=${jobs.list[0].get("status")}&currentPage=${jobs.currentPage-1}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${jobs.totalPage}" var="i">
                        <li><a href="jobList?<c:if test="${param.status}!=''">${param.status}&currentPage=${i}</c:if>
                            status=${jobs.list[0].get("status")}&currentPage=${i}">${i}
                        </a></li>
                    </c:forEach>
                    <!--后一页禁用-->
                    <c:if test="${jobs.currentPage == jobs.totalPage}">
                    <li class="disabled">
                        </c:if>
                        <c:if test="${jobs.currentPage != jobs.totalPage}">
                    <li>
                        </c:if>
                        <a href="jobList?<c:if test="${param.status}!=''">${param.status}&currentPage=${jobs.currentPage+1}</c:if>
                            status=${jobs.list[0].get("status")}&currentPage=${jobs.currentPage+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
                </c:if>
        </div>
            </ul>
        </div>
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="40"><input type="checkbox"></th>
                <th>id</th>
                <th>职位名称</th>
                <th>公司</th>
                <th>应聘者<th>
                <th>创建时间</th>
                <th>状态</th>
                <th class="text-center" width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${jobs.list}" var="job" varStatus="i">
            <tr class="danger">
                <td class="text-center"><input type="checkbox"></td>
                <th>#${i.count}</th>
                <th><a href="/admin/jobHandle?jobName=${job.get("jobName")}&name=${job.get("name")}">${job.get("jobName")}</a></th>
                <th>${job.get("name")}</th>
                <th>${job.get("userName")}</th>
                <th>${job.get("createTime")}</th>
                <th>
                    <c:choose>
                        <c:when test="${job.get('status') == 0}">未处理</c:when>
                        <c:when test="${job.get('status') == 1}">约请面试</c:when>
                        <c:when test="${job.get('status') == 2}">抱歉</c:when>
                    </c:choose>
                </th>
                <td class="text-center">
                    <a href="post-add.html" class="btn btn-info btn-xs">详情</a>
                    <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<c:import url="admin-side.jsp"></c:import>
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

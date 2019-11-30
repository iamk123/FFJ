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
    <script src="/static/lib/nprogress/nprogress.js"></script>
</head>
<body>
<script>NProgress.start()</script>

<div class="main">

    <!--导航条-->
    <c:import url="admin-head.jsp"></c:import>
    <!--/导航条-->

    <div class="container-fluid">
        <div class="page-title">
            <h1>所有职位</h1>
        </div>
        <div class="pull-right">
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
                            <a href="jobList?<c:if test="${param.status}!=''">${param.status}&currentPage=${pb.currentPage-1}</c:if>
                            &currentPage=${pb.currentPage-1}"
                               aria-label="Previous" aria-label="Previous">
                                </c:if>
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${pb.totalPage}" var="i">
                            <li class="<c:if test='${pb.currentPage == i}'>active</c:if>"><a href="jobList?<c:if test="${param.status}!=''">${param.status}&currentPage=${i}</c:if>&currentPage=${i}">${i}</a></li>
                        </c:forEach>
                        <!--后一页禁用-->
                        <c:if test="${pb.currentPage >= pb.totalPage}">
                        <li class="disabled">
                            <a href="javascript:void(0);" aria-label="Next">
                                </c:if>
                                <c:if test="${pb.currentPage < pb.totalPage}">
                        <li>
                            <a href="jobList?<c:if test="${param.status}!=''">${param.status}&currentPage=${pb.currentPage+1}</c:if>
                            &currentPage=${pb.currentPage+1}" aria-label="Next">
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
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" width="40"><input type="checkbox"></th>
                    <th>id</th>
                    <th>职位名称</th>
                    <th>公司名称</th>
                    <th>类别</th>
                    <th>工作地址</th>
                    <th>薪水</th>
                    <th>联系人</th>
                    <th>创建时间</th>
                    <th class="text-center" width="100">操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${pb.list}" var="job" varStatus="i">
                <c:if test="${i.count%2 == 0}">
                    <tr>
                </c:if>
                <c:if test="${i.count%2 == 1}">
                    <tr class="warning">
                </c:if>
                    <td class="text-center"><input type="checkbox"></td>
                    <th>#${i.count}</th>
                    <th>${job.jobName}</th>
                    <th>${job.company.name}</th>
                    <th>${job.kind}</th>
                    <th>${job.location}</th>
                    <th>${job.salary}</th>
                    <th>${job.contact}</th>
                    <th><mytag:dateFormat date="${job.createTime}"></mytag:dateFormat></th>
                    <td class="text-center">
                        <a href="/admin/jobDetail/${job.id}" class="btn btn-info btn-xs">详情</a>
                        <a href="/job/deleteJob/${job.id}/${pb.currentPage}" class="btn btn-danger btn-xs">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!--侧边栏-->
<c:import url="admin-side.jsp"></c:import>
<!--/侧边栏-->

<link rel="stylesheet" href="/static/lib/toastr/toastr.css">
<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/static/lib/toastr/toastr.min.js"></script>
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
    $(function(){
        var msg = '${msg}';
        if(msg == "1"){
            toastr.success("操作成功");
        }
    })
</script>
<script>NProgress.done()</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NWPU校园招聘</title>
    <link rel="icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/css/public.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">
<script>
    function submitForm() {
        var form = $("#getDeliverList");
        form.submit();
    }
</script>

</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
    <c:import url="head.jsp"></c:import>
    <!--/导航条-->
</header>
<!--/头部区域  -->

<!--register-->
<section style="margin-top:20px;">
    <div class="container">
        <div class="">
            <div class="panel panel-default">
                <div class="panel-heading" >我的应聘<div class="pull-right"><a href="/company" class="btn btn-success btn-xs">返回</a></div></div>
                <div class="panel-body">
                    <div style="display: flex;">
                        <div style="margin-right:20px;">简历状态: </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" width="40"><input type="checkbox"></th>
                            <th>职位名称</th>
                            <th>人数</th>
                            <th>薪水</th>
                            <th>类别</th>
                            <th>创建时间</th>
                            <th class="text-center" width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${pb.list}">
                            <tr class="">
                                <td class="text-center"><input type="checkbox"></td>
                                <th>${list.jobName}</th>
                                <th>${list.needNum}</th>
                                <th>${list.salary}</th>
                                <th>${list.kind}</th>
                                <th>${list.createTime}</th>
                                <td class="text-center">
                                    <a href="/company/jobHandle?jobId=${list.id}" class="btn btn-info btn-xs">详情</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div style="margin-left: 20px;">
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
                                    <a href="/company/postJobList?currentPage=${pb.currentPage-1}" aria-label="Previous">
                                        </c:if>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                                    <li class="<c:if test='${pb.currentPage == i}'>active</c:if>"><a href="/company/postJobList?currentPage=${i}">${i}</a></li>
                                </c:forEach>
                                <!--后一页禁用-->
                                <c:if test="${pb.currentPage >= pb.totalPage}">
                                <li class="disabled">
                                    <a href="javascript:void(0);" aria-label="Next">
                                        </c:if>
                                        <c:if test="${pb.currentPage < pb.totalPage}">
                                <li>
                                    <a href="/company/postJobList?currentPage=${pb.currentPage+1}" aria-label="Next">
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
            </div>
        </div>
    </div>
    </div>
</section>
<!--/register-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
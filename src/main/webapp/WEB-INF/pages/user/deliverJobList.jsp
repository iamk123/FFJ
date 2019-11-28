<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
                <div class="panel-heading" >我的应聘<div class="pull-right"><a href="/user" class="btn btn-success btn-xs">返回</a></div></div>
                <div class="panel-body">
                    <div style="display: flex;">
                        <div style="margin-right:20px;">简历状态: </div>
                        <form action="/user/deliverJobList" id="getDeliverList" method="GET">
                            <div class="search-option">
                                <select name="status" onchange="submitForm()">
                                    <option value="3" <c:if test="${status==3}">selected</c:if>>不限</option>
                                    <option value="0" <c:if test="${status==0}">selected</c:if>>未处理</option>
                                    <option value="1" <c:if test="${status==1}">selected</c:if>>约请面试</option>
                                    <option value="2" <c:if test="${status==2}">selected</c:if>>抱歉</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" width="40"><input type="checkbox"></th>
                            <th>职位名称</th>
                            <th>公司</th>
                            <th>投递时间</th>
                            <th>状态</th>
                            <th class="text-center" width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${pb.list}">
                            <tr class="">
                                <td class="text-center"><input type="checkbox"></td>
                                <th>${list.jobName}</th>
                                <th>${list.companyName}</th>
                                <th>${list.createTime}</th>
                                <th>
                                    <c:if test="${list.status == 0}">未处理</c:if>
                                    <c:if test="${list.status == 1}">约请面试</c:if>
                                    <c:if test="${list.status == 2}">抱歉</c:if>
                                </th>
                                <td class="text-center">
                                    <a href="/job/jobDetail/${list.jobId}" class="btn btn-info btn-xs">详情</a>
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
                                    <a href="/user/deliverJobList?currentPage=${pb.currentPage-1}&&status=${status}" aria-label="Previous">
                                        </c:if>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                                    <li class="<c:if test='${pb.currentPage == i}'>active</c:if>"><a href="/user/deliverJobList?currentPage=${i}&&status=${status}">${i}</a></li>
                                </c:forEach>
                                <!--后一页禁用-->
                                <c:if test="${pb.currentPage >= pb.totalPage}">
                                <li class="disabled">
                                    <a href="javascript:void(0);" aria-label="Next">
                                        </c:if>
                                        <c:if test="${pb.currentPage < pb.totalPage}">
                                <li>
                                    <a href="/user/deliverJobList?currentPage=${pb.currentPage+1}&&status=${status}" aria-label="Next">
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
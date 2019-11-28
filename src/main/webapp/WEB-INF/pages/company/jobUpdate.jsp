<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="/static/img/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
    <link rel="stylesheet" href="/static/css/public.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">
    <link rel="stylesheet" href="/static/css/positionInfo.css">
</head>

<body>
<!-- 头部区域 -->
<header>
    <!--导航条-->
    <c:import url="head.jsp"></c:import>
<%--    <jsp:include page="head.jsp"></jsp:include>--%>
    <!--/导航条-->
</header>
<!--/头部区域  -->

    <div class="container-fluid">
        <div class="page-title">
            <h1>编辑招聘信息</h1>
        </div>
        <!-- 有错误信息时展示 -->
        <!-- <div class="alert alert-danger">
          <strong>错误！</strong>发生XXX错误
        </div> -->
        <form class="row">
            <div class="col-md-9">
                <h3>公司名称</h3>
                <div class="form-group">
                    <label for="name">职位名称</label>
                    <input id="name" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="jobNum">招聘人数</label>
                    <input id="jobNum" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="jobRequire">工作需求</label>
                    <input id="jobRequire" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="salary">薪水</label>
                    <input id="salary" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="location">地址</label>
                    <input id="location" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="contact">联系人</label>
                    <input id="contact" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="kind">类别</label>
                    <input id="kind" class="form-control " name="title" type="text" value="职位名称">
                </div>
                <div class="form-group">
                    <label for="jobInfo">工作介绍</label>
                    <textarea id="jobInfo" class="form-control input-lg" name="content" cols="10" rows="5" placeholder="内容"></textarea>
                </div>
                <button class="btn btn-primary" type="submit">保存</button>
            </div>

                    </form>
                 </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--/register-->

<!--footer-->
<c:import url="../user/footer.jsp"></c:import>
<%--<jsp:include page="../user/footer.jsp"></jsp:include>--%>
<!--/footer-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
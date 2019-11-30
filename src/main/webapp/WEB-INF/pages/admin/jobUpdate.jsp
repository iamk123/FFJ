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
    <link rel="stylesheet" href="/static/css/public.css">
    <link rel="stylesheet" href="/static/css/positionInfo.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">
    <script src="/static/lib/nprogress/nprogress.js"></script>
</head>
<body>
<script>NProgress.start()</script>

<div class="main">

    <!--导航条-->
    <c:import url="admin-head.jsp"></c:import>
    <!--/导航条-->

   <div class="container-fluid">
       <section style="margin-bottom: 20px;margin-top:20px;">
           <div class="container">
               <div class="page-title">
               </div>
               <form class="row" action="/admin/updateJob?jobId=${jobDetail.id}" method="POST">
                   <div class="col-md-9">
                       <input type="text" name="id" class="sr-only" value="${jobDetail.id}">
                       <div class="form-group">
                           <label for="name">职位名称</label>
                           <input id="name" class="form-control " name="jobName" type="text" value="${jobDetail.jobName}">
                       </div>
                       <div class="form-group">
                           <label for="jobNum">招聘人数</label>
                           <input id="jobNum" class="form-control " name="needNum" type="text" value="${jobDetail.needNum}">
                       </div>
                       <div class="form-group">
                           <label for="jobRequire">工作需求</label>
                           <input id="jobRequire" class="form-control " name="jobRequire" type="text" value="${jobDetail.jobRequire}">
                       </div>
                       <div class="form-group">
                           <label for="salary">薪水</label>
                           <input id="salary" class="form-control " name="salary" type="text" value="${jobDetail.salary}">
                       </div>
                       <div class="form-group">
                           <label for="location">地址</label>
                           <input id="location" class="form-control " name="location" type="text" value="${jobDetail.location}">
                       </div>
                       <div class="form-group">
                           <label for="contact">联系人</label>
                           <input id="contact" class="form-control " name="contact" type="text" value="${jobDetail.contact}">
                       </div>
                       <div class="form-group">
                           <label for="kind">类别</label>
                           <input id="kind" class="form-control " name="kind" type="text" value="${jobDetail.kind}">
                       </div>
                       <div class="form-group">
                           <label for="jobInfo">工作介绍</label>
                           <textarea id="jobInfo" class="form-control input-lg" name="jobInfo" cols="10" rows="5" ></textarea>
                       </div>
                       <button class="btn btn-primary" type="submit" style="margin-right:20px;">保存</button>
                       <a href="/admin/jobList"><button class="btn btn-primary" type="button">返回</button></a>
                   </div>
               </form>
           </div>

       </section>
   </div>
</div>

<!--侧边栏-->
<c:import url="admin-side.jsp"></c:import>
<!--/侧边栏-->

<link rel="stylesheet" href="/static/lib/toastr/toastr.css">
<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/static/lib/toastr/toastr.min.js"></script>
<script>
    $(function () {
        var jobInfo = '${jobDetail.jobInfo}';
        $("#jobInfo").val(jobInfo);
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
        console.log(msg);
        if(msg == "2"){
            toastr.info("信息不能为空！");
        }else if(msg == "1"){
            toastr.success("修改成功！");
        }else if(msg == "0"){
            toastr.error("修改失败！");
        }
    })
</script>

<script>NProgress.done()</script>
</body>
</html>

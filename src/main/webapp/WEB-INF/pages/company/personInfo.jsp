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
	<link rel="stylesheet" href="/static/css/personInfo.css">

</head>

<body>
<!-- 头部区域 -->
<header>
	<!--导航条-->
	<c:import url="../head.jsp"></c:import>
	<!--/导航条-->

</header>
<!--/头部区域  -->


<!-- 个人信息 -->
<section id="personInfo-session">
	<div class="container personInfo">
		<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 personInfo-form" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius:10px;">
			<form method="POST" action="/company/updateUserInfo">
				<input type="text" name="id" value="${sessionScope.user.id}" class="sr-only">
				<div class="personInfo-form-title">基本信息</div>
				<div class="form-group">
					<label for="exampleInputEmail1">昵称</label>
					<input type="text" class="form-control" id="exampleInputEmail1" name="name" placeholder="name" value="${user.name}">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail2">账号</label>
					<input type="text" class="form-control" readonly="readonly" id="exampleInputEmail2" name="userName" placeholder="userName" value="${user.userName}">
				</div>
				<input type="text" class="sr-only" name="password" value="${user.password}">
				<div class="form-group">
					<label for="exampleInputEmail5">邮箱</label>
					<input type="email" class="form-control" id="exampleInputEmail5" name="email" placeholder="email" value="${user.email}">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail6">联系方式</label>
					<input type="text" class="form-control" id="exampleInputEmail6" placeholder="phone" name="phone" value="${user.phone}">
				</div>
				<button type="submit" class="btn btn-default personInfo-btn">修改</button>
				<a href="/company"><button type="button" class="btn btn-default personInfo-btn personInfo-btn-return">返回</button></a>
			</form>
		</div>
	</div>
</section>
<!-- /个人信息 -->

<!--footer-->
<c:import url="../user/footer.jsp"></c:import>
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
	$(function(){
		var msg = '${msg}';
		if(msg == "2"){
			toastr.info("信息不能为空！");
		}else if(msg == "1"){
			toastr.success("修改成功！");
		}else if(msg == "0"){
			toastr.error("修改失败！");
		}
	})
</script>
</body>
</html>
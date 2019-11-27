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
	<c:import url="head.jsp"></c:import>
	<!--/导航条-->

</header>
<!--/头部区域  -->


<!-- 个人信息 -->
<section id="personInfo-session">
	<div class="container personInfo">
		<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 personInfo-form" style="box-shadow: 5px 5px 5px 5px #ccc;border-radius:10px;">
			<form method="POST" action="/user/updateUserInfo">
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
				<div class="form-group">
					<label for="exampleInputEmail5">邮箱</label>
					<input type="email" class="form-control" id="exampleInputEmail5" name="email" placeholder="email" value="${user.email}">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail6">联系方式</label>
					<input type="text" class="form-control" id="exampleInputEmail6" placeholder="phone" name="phone" value="${user.phone}">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail7">年级</label>
					<input type="text" class="form-control" id="exampleInputEmail7" placeholder="grade" name="grade" value="${resume.grade}">
				</div>
				<div class="form-group">
					<p>地址</p>
					<div>
						<select name="location">
							<option value="长安校区" <c:if test="${resume.location.equals('长安校区')}">selected</c:if>>长安校区</option>
							<option value="友谊校区" <c:if test="${resume.location.equals('友谊校区')}">selected</c:if>>友谊校区</option>
						</select>
					</div>
				</div>
				<div style="color:red;"><h5>${msg}</h5></div>
				<button type="submit" class="btn btn-default personInfo-btn">修改</button>
				<a href="/user"><button type="button" class="btn btn-default personInfo-btn personInfo-btn-return">返回</button></a>
			</form>
		</div>
	</div>
</section>
<!-- /个人信息 -->

<!--footer-->
<c:import url="footer.jsp"></c:import>
<!--/footer-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
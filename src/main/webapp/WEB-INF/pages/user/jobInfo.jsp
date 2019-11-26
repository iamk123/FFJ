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
	<link rel="stylesheet" href="/static/css/public.css">
	<link rel="stylesheet" href="/static/css/header.css">
	<link rel="stylesheet" href="/static/css/footer.css">
	<link rel="stylesheet" href="/static/css/positionInfo.css">
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
			console.log("userID" + ${sessionScope.user.id});
			$("#deliver").click(function () {
				$.ajax({
					type:"POST",
					url:"/job/deliver",
					dataType:"json",
					data:{userId : ${sessionScope.user.id}, jobId:${jobDetail.id}},
					success:function (data) {
						console.log(data);
						if("0" == data){
							toastr.error("已经投递！请勿重复投递!");
						}else if("1" == data){
							console.log("投递成功！");
							toastr.success("投递成功！等待通知!");
						}else{
							console.log("请等待...");
							toastr.info("请等待...")
						}
					},
					error:function () {
						toastr.warning("请稍后再试...")
					}
				})
			});
		})
	</script>


</head>

<body>
<!-- 头部区域 -->
<header>
	<!--导航条-->
	<c:import url="../head.jsp"></c:import>
	<!--/导航条-->

</header>
<!--/头部区域  -->

<!-- 个人简历 -->
<section class="section-main">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 position-head">
				<div class="position-content">
					<div class="position-content-l pull-left">
						<div class="job-name" title="java开发工程师">
							<h2>${jobDetail.jobName}</h2>
							<h5 style="color:#555;">${jobDetail.company.name}</h5>
						</div>
						<dd>
							<h5 style="color:#555;">
								<span style="color:#fd5f39;">${jobDetail.salary} </span>
								<span> / ${jobDetail.location} /</span>
								<span>${jobDetail.needNum}人 /</span>
								<span>${jobDetail.kind}</span>
							</h5>
						</dd>
					</div>
					<div class="position-content-r pull-right">
						<div class="position-deal">
							<div class="job-collection pull-left">
								<i class="glyphicon glyphicon-star-empty" style="margin-right: 5px;"></i>收藏
							</div>
							<div class="resume-deliver pull-right" id="deliver">
								投个简历
							</div>
						</div>
						<div class="tool-icon">
							<ul class="list-inline">
								<li><a href=""><i class="glyphicon glyphicon-thumbs-down"></i></a></li>
								<li><a href=""><i class="glyphicon glyphicon-thumbs-up"></i></a></li>
								<li><a href=""><i class="glyphicon glyphicon-share"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</section>
<section class="section-main section-main-color">
	<div class="container">
		<div class="row job-info">
			<div class="col-md-6 col-md-offset-1 job-detail">
				<dt></dt>
				<dd>
					<h4><strong>职位描述</strong></h4>
					<br>
					<div>
						<h5><strong>技能要求：</strong></h5>
						<p>${jobDetail.jobRequire}</p>
						<br>
						<h5><strong>工作描述：</strong></h5>
						<p>${jobDetail.jobInfo}</p>
						<br>
						<h5><strong>工作地点：</strong></h5>
						<p>${jobDetail.location}</p>
						<br>
						<h5><strong>其他：</strong></h5>
						<p>无</p>
					</div>
				</dd>
			</div>
			<div class="col-md-4 job-companyInfo">
				<div class="job-company">
					<dt>
						<a href="">
							<div>
								<div class="company-icon"><img src="/static/img/company1.png" alt=""></div>
								<div><h4>${jobDetail.company.name}<i class="glyphicon glyphicon-check" style="margin-left: 10px; color:#00b38a;"></i></h4></div>
							</div>
						</a>
					</dt>
					<br>
					<dd>
						<ul>
							<li>地址： ${jobDetail.company.location}</li>
							<li>简介： <p>${jobDetail.company.companyInfo}</p></li>
							<li>联系人： ${companyUser.name}</li>
							<li>联系电话： ${companyUser.phone}</li>
						</ul>
					</dd>
				</div>
				<div class="job-similar">
					<h5>相似岗位</h5>
					<ul class="media-list">
					  <li class="media">
					    <div class="media-left">
					      <a href="#">
					        <div class="media-left-img"><img class="media-object" src="/static/img/nwpu.png" alt="..."></div>
					      </a>
					    </div>
					    <div class="media-body">
					      <p style="font-size: 14px;"><strong>java开发工程师</strong></p>
					      <p style="color:#fd5f39;">10k-100k</p>
					      <p>西北工业大学...</p>
					    </div>
					  </li>
					  <li class="media">
					    <div class="media-left">
					      <a href="#">
					        <div class="media-left-img"><img class="media-object" src="/static/img/nwpu.png" alt="..."></div>
					      </a>
					    </div>
					    <div class="media-body">
					      <p style="font-size: 14px;"><strong>java开发工程师</strong></p>
					      <p style="color:#fd5f39;">10k-100k</p>
					      <p>西北工业大学...</p>
					    </div>
					  </li>
					  <li class="media">
					    <div class="media-left">
					      <a href="#">
					        <div class="media-left-img"><img class="media-object" src="/static/img/nwpu.png" alt="..."></div>
					      </a>
					    </div>
					    <div class="media-body">
					      <p style="font-size: 14px;"><strong>java开发工程师</strong></p>
					      <p style="color:#fd5f39;">10k-100k</p>
					      <p>西北工业大学...</p>
					    </div>
					  </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /个人简历 -->

<!--footer-->
<c:import url="footer.jsp"></c:import>
<!--/footer-->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
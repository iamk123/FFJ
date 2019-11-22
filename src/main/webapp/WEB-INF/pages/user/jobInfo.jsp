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



</head>

<body>
<!-- 头部区域 -->
<header>
	<!-- 导航条 -->
	<nav class="navbar navbar-nwpu">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Brand</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
	        <li><a href="#">职位</a></li>
	        <li><a href="#">职位</a></li>
	        <li><a href="#">职位</a></li>
	        <li><a href="#">职位</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">消息</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户昵称 <span class="caret"></span></a>
	          <ul class="dropdown-menu dropdown-mean-nwpu">
	            <li><a href="#">个人中心</a></li>
	            <li><a href="#">账号设置</a></li>
	            <li><a href="#">修改密码</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">退出登录</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- /导航条 -->

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
							<div class="resume-deliver pull-right">
								<a href="">投个简历</a>
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

<!-- footer -->
<footer id="footer">
	<div class="container hidden-xs hidden-sm">
		<div class="col-md-2 footer-item">
			<dl>企业服务</dl>
			<dd>
				<a href="">职业搜索</a>
				<a href="">新闻资讯</a>
				<a href="">NWPU招聘</a>
			</dd>
		</div>
		<div class="col-md-2 footer-item">
			<dl>使用与帮助</dl>
			<dd>
				<a href="">用户协议与隐私政策</a>
				<a href="">防骗指南</a>
				<a href="">职位发布规则</a>
				<a href="">使用帮助</a>
			</dd>
		</div>
		<div class="col-md-4 footer-item">
			<dl>联系NWPU招聘</dl>
			<dd>
				<a href="">陕西NWPU校园招聘</a>
				<a href="">公司地址 陕西省西安市长安区西北工业大学</a>
				<a href="">联系电话 14792076163</a>
				<a href="">违法和不良信息举报邮箱 1249248952@qq.com</a>
			</dd>
		</div>
		<div class="col-md-4  footer-item footer-companyInfo">
			<dl>NWPU招聘</dl>
			<dd>
				<p>
					企业服务热线和举报电话
					<span>400 000 000</span>
				</p>
				<p>
					工作日
					<span>8:00-24:00</span>
				</p>
				<p>
					休息9:30-18:30
					<span></span>
				</p>
			<!-- 	<p class="footer-icon">
					<a href=""></a>
				</p> -->
			</dd>
		</div>
	</div>
</footer>
<!-- /footer -->

<!-- copyright -->
<div class="copyright container hidden-xs hidden-sm">
	<p>
		<span>Copyright © 2019 NWPU招聘</span>
		<span>京ICP备14013441号-5</span>
		<span>京ICP证150923号</span>
		<span><a href=""><i class="glyphicon glyphicon-bullhorn"></i> 电子营业执照</a></span>
		<span><a href=""><i class="glyphicon glyphicon-align-justify"></i> 京公网安备11010502032801</a></span>
		<span><a href="http://sdwj.zhipin.com/web/index.html"><i class="glyphicon glyphicon-user"></i> 首都网警</a></span>
		<span><a href=""><i class="glyphicon glyphicon-tag"></i> 人力资源服务许可证</a></span>
	</p>
</div>
<!-- /copyright -->

<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
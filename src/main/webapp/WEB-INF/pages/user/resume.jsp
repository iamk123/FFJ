<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/lib/bootstrap/css/bootstrap.css" >
	<link rel="stylesheet" href="/static/css/index.css">
	<link rel="stylesheet" href="/static/css/header.css">
	<link rel="stylesheet" href="/static/css/footer.css">
	<link rel="stylesheet" href="/static/css/resume.css">

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
<section id="resume">
	<div class="container userInfo-container">
		<div class="col-md-8 col-md-offset-2 userInfo-title">当前简历信息不完善,影响聊天回复率,修改后你将获得更多的求职机会
		<a href=""><i class="glyphicon glyphicon-pencil"></i>修改</a>
		</div>
		<div class="col-md-8 col-md-offset-2 userInfo-box">
			<div class="media userInfo">
			  <div class="media-body">
			    <h2 class="media-heading">${sessionScope.user.name}</h2>
				<div class="userInfo-labels">
					<p><span><i class="glyphicon glyphicon-briefcase"></i>${resume.grade}</span></p>
					<p><span><i class="glyphicon glyphicon-education"></i>${resume.location}</span></p>
					<p><span><i class="glyphicon glyphicon-earphone"></i>${sessionScope.user.phone}</span></p>
				</div>
			  </div>
			  <div class="media-right">
			    <div class="user-icon">
			    	<img class="media-object" src="/static/img/nwpu.png" alt="...">
			    </div>
			  </div>
			</div>
			<div id="edit-logo">
				<a href=""><i class="glyphicon glyphicon-pencil"></i>编辑</a>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2 user-resume">
			<div class="summary user-resume-item">
				<h3><i class="glyphicon glyphicon-tags"></i> 个人优势</h3>
				<ul class="list-inline">
					<c:forEach items="${advantages}" var="advantage">
					<li><i class="glyphicon glyphicon-heart-empty"></i> ${advantage.name}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="edit-logo">
				<a href=""><i class="glyphicon glyphicon-pencil"></i>添加</a>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2 user-resume">
			<div class="summary user-resume-item">
				<h3><i class="glyphicon glyphicon-tags"></i> 期望职位</h3>
				<ul class="list-inline">
					<c:forEach items="${jobNames}" var="jobName">
					<li><i class="glyphicon glyphicon-heart-empty"></i> ${jobName}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="edit-logo">
				<a href=""><i class="glyphicon glyphicon-pencil"></i>添加</a>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2 user-resume">
			<div class="summary user-resume-item">
				<h3><i class="glyphicon glyphicon-tags"></i> 项目经历</h3>
				<ul class="list-inline">
					<c:forEach items="${projects}" var="project">
					<li><i class="glyphicon glyphicon-heart-empty"></i> ${project.name}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="edit-logo">
				<a href=""><i class="glyphicon glyphicon-pencil"></i>添加</a>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2 user-resume">
			<div class="summary user-resume-item">
				<h3><i class="glyphicon glyphicon-tags"></i> 资格证书</h3>
				<ul class="list-inline">
					<c:forEach items="${honors}" var="honor">
					<li><i class="glyphicon glyphicon-heart-empty"></i> ${honor.name}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="edit-logo">
				<a href=""><i class="glyphicon glyphicon-pencil"></i>添加</a>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2 user-resume">
			<div class="summary user-resume-item">
				<h3><i class="glyphicon glyphicon-tags"></i> 实习经历</h3>
				<ul class="social_work">
					<c:forEach items="${socialWorks}" var="socialWork">
					<li>
						<div>
							<p>${socialWork.name}</p>
							<p>${socialWork.description}</p>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div id="edit-logo">
				<span  data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-pencil"></i>添加</span>
			</div>
			<!-- 实习经历模态框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h3 class="modal-title" id="myModalLabel"><strong>添加实习经历</strong></h3>
			      </div>
			      <div class="modal-body">
			        <form>
					  <div class="form-group">
					    <label for="exampleInputText1">实习单位</label>
					    <input type="text" class="form-control" id="exampleInputText1" placeholder="Email">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputText2">负责任务</label>
					    <input type="text" class="form-control" id="exampleInputText2" placeholder="Email">
					  </div>
					  <div class="form-group">
					  	<label for="exampleInputText3">实习介绍</label>
					  	<textarea class="form-control" rows="3" id="exampleInputText2"></textarea>
					  </div>
					  <button type="submit" class="btn btn-default">添加</button>
					</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- /实习经历模态框 -->
		</div>
		<div class="col-md-8 col-md-offset-2 user-resume">
			<div class="summary user-resume-item">
				<h3><i class="glyphicon glyphicon-tags"></i> 获奖情况</h3>
				<ul class="list-inline">
					<li><i class="glyphicon glyphicon-heart-empty"></i> 校数模一等奖</li>
					<li><i class="glyphicon glyphicon-heart-empty"></i> 校数模二等奖</li>
					<li><i class="glyphicon glyphicon-heart-empty"></i> 校数模三等奖</li>
				</ul>
			</div>
			<div id="edit-logo">
				<a href=""><i class="glyphicon glyphicon-pencil"></i>添加</a>
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
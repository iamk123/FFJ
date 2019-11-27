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
    <link rel="stylesheet" href="/static/css/positionInfo.css">
    <link rel="stylesheet" href="/static/css/header.css">
    <link rel="stylesheet" href="/static/css/footer.css">


</head>

<body>

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
                                编辑
                            </div>
                            <div class="resume-deliver pull-right" onclick="javascript:history.back()">
                                <a href="javascript:;">返回</a>
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

            </div>
        </div>
    </div>
    <div style="height: 50px; background-color: #f6f6f8;"></div>
</section>
<!-- /个人简历 -->

<script type="text/javascript">
    function submitForm() {
        var form = document.getElementById("getJobHandle"); //获取form表单对象
        form.submit();//form表单提交
    }
</script>


<script type="text/javascript" src="/static/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>
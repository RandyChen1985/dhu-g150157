<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 	
<html lang="en"> <!--<![endif]-->
<head>

	<!-- General Metas -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	<!-- Force Latest IE rendering engine -->
	<title>教务管理系统-用户登录</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="/resource/commons/css/login/base.css">
	<link rel="stylesheet" href="/resource/commons/css/login/skeleton.css">
	<link rel="stylesheet" href="/resource/commons/css/login/layout.css">
	
</head>
<body>

	<!-- 错误消息提示框 -->
	<#if errMsg != '' >
		<div class="notice">
			<a href="javascript:;" class="close">close</a>
			<p class="warn">${errMsg}</p>
		</div>
	</#if>

	<!-- Primary Page Layout -->
	<div class="container">
		
		<div class="form-bg">
			<form action="/logincheck" autocomplete="on" method="post">
				<h2>登录</h2>
				<p><input type="text" placeholder="账号名" id="username" name="username"></p>
				<p><input type="password" placeholder="密码" id="password" name="password"></p>
				<button type="submit"></button>
			<form>
		</div>
	</div><!-- container -->

	<!-- JS  -->
	<script src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
	<script src="/resource/commons/js/login/app.js"></script>
	
<!-- End Document -->
</body>
</html>
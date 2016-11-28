<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>DHU学籍管理管理-主界面</title>
<link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/resource/commons/css/mainhome/mainhome.css">
<script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resource/commons/js/mainhome/mainhome.js"></script>
</head>
<body class="easyui-layout">
	<div region="north" border="true" class="cs-north">
		<div class="cs-north-bg">
		<div class="cs-north-logo">DHU学籍管理系统-${version}</div>
		<p class="user-infor">${Session.user.username}当前已登录 <a href="/logout?username=${Session.user.username}">退出</a></p>	
		</div>
	</div>
	<div region="west" border="true" split="true" title="菜单导航" class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">
				<div title="学生管理">
					<a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">easyloader</a></p>
					<a href="javascript:void(0);" src="demo/draggable.html" class="cs-navi-tab">draggable</a></p>
					<a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">droppable</a></p>
					<a href="javascript:void(0);" src="demo/droppable1.html" class="cs-navi-tab">droppable1</a></p>
					<a href="javascript:void(0);" src="demo/droppable2.html" class="cs-navi-tab">droppable2</a></p>
					<a href="javascript:void(0);" src="demo/resizable.html" class="cs-navi-tab">resizable</a></p>
					<a href="javascript:void(0);" src="demo/pagination.html" class="cs-navi-tab">pagination</a></p>
					<a href="javascript:void(0);" src="demo/searchbox.html" class="cs-navi-tab">searchbox</a></p>
					<a href="javascript:void(0);" src="demo/progressbar.html" class="cs-navi-tab">progressbar</a></p>
				</div>
				<div title="教师管理">
					<a href="javascript:void(0);" src="demo/accordion.html" class="cs-navi-tab">accordion</a></p>
					<a href="javascript:void(0);" src="demo/layout.html" class="cs-navi-tab">layout</a></p>
					<a href="javascript:void(0);" src="demo/layout1.html" class="cs-navi-tab">layout1</a></p>
					<a href="javascript:void(0);" src="demo/layout2.html" class="cs-navi-tab">layout2</a></p>
					<a href="javascript:void(0);" src="demo/panel.html" class="cs-navi-tab">panel</a></p>
					<a href="javascript:void(0);" src="demo/panel2.html" class="cs-navi-tab">panel1</a></p>
					<a href="javascript:void(0);" src="demo/tabs.html" class="cs-navi-tab">tabs</a></p>
				</div>
				<div title="系统管理">
					<a href="javascript:void(0);" src="/admin/sysadmin/accountpage" class="cs-navi-tab">账号管理</a></p>
					<a href="javascript:void(0);" src="demo/menubutton.html" class="cs-navi-tab">登录日志</a></p>
				</div>
		</div>
	</div>
	<!--默认页面-->
	<div id="mainPanle" region="center" border="true" border="false">
		 <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
                <div title="HOME">
				<div class="cs-home-remark">
					 欢迎你使用学籍管理系统!<br/>
					 上次登录时间: ${Session.user.lastlogin_time} </br>
					 上次登录IP: ${Session.user.lastloginip} </br>
				</div>
				</div>
        </div>
	</div>
	<!--底部-->
	<div region="south" border="false" class="cs-south">陈小龙 # g150157@mail.dhu.edu.cn</div>
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
</body>
</html>
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
		<div class="cs-north-logo">DHU教务管理系统-${version}</div>
		<p class="user-infor">${Session.user.realname}(${Session.user.username})当前已登录 <a id="btnLogout" href="#" title="点击退出系统" class="easyui-tooltip">退出</a></p>	
		</div>
	</div>
	<div region="west" border="true" split="true" title="菜单导航" class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">
				<div title="教务管理">
					<a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">学生管理</a></p>
					<a href="javascript:void(0);" src="demo/draggable.html" class="cs-navi-tab">学籍管理</a></p>
					<a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">课程管理</a></p>
					<a href="javascript:void(0);" src="demo/droppable1.html" class="cs-navi-tab">成绩管理</a></p>
				</div>
				<div title="报表中心">
					<a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">成绩排名</a></p>
				</div>
				<#if Session ["user"].user_type = 1> 
					<!--管理员的功能-->
				 	<div title="系统管理">
						<a href="javascript:void(0);" src="/admin/sysadmin/accountpage" class="cs-navi-tab">账号管理</a></p>
						<a href="javascript:void(0);" src="/admin/sysadmin/logspage" class="cs-navi-tab">日志管理</a></p>
						<a href="javascript:void(0);" src="/swagger/index.html" class="cs-navi-tab">接口中心</a></p>
					</div>
				</#if> 
		</div>
	</div>
	<!--默认页面-->
	<div id="mainPanle" region="center" border="true" border="false">
		 <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
                <div title="HOME">
				<div class="cs-home-remark">
					 欢迎你使用教务管理系统!<br/>
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
	
	<div id="dlg" class="easyui-dialog" style="padding:5px;width:400px;height:200px;"
        title="提示" iconCls="icon-ok"  buttons="#dlg-buttons" data-options="modal:true">
    是否真的要退出系统呢?
	</div>
	<div id="dlg-buttons">
    <a href="/logout?username=${Session.user.username}" class="easyui-linkbutton" iconCls="icon-ok">Ok</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>
</body>

<!--控制退出按钮-->
<script type="text/javascript">
    $(document).ready(function () {
        $('#dlg').dialog('close');
    });
    $(document).ready(function () {
            $("#btnLogout").click(function () {
                $("#dlg").show();//必须先显示，再弹出
                $("#dlg").dialog();
            });
    });
</script>
</html>
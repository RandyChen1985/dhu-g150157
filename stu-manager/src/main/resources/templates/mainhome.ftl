<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教务管理管理-主界面</title>
<link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/resource/commons/css/mainhome/mainhome.css">
<script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resource/commons/js/mainhome/mainhome.js"></script>
<script type="text/javascript">
        var url;
        //修改密码
        function editPasswd(){
	         $('#dlg-updatePasswd').dialog('open').dialog('center').dialog('setTitle','修改密码');
	         url = '/admin/service/updateUserPasswd';
        }
        //编辑修改密码
        function saveUpdatePasswd(){
            $('#fm-updatePasswd').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.success){
                    	//成功
                        $('#dlg-updatePasswd').dialog('close');        // close the dialog
                        $.messager.show({    
                                    title: '提示',
                                    msg: '密码修改成功!'
                                });
                    } else {
                    	//失败
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    }
                }
            });
        }
</script>        
</head>
<body class="easyui-layout">
	<div region="north" border="true" class="cs-north">
		<div class="cs-north-bg">
		<div class="cs-north-logo">教务管理系统-${version}</div>
		<p class="user-infor">${Session.user.realname}(${Session.user.username})当前已登录  <a href="javascript:void(0)" onclick="editPasswd()">修改密码</a>  <a id="btnLogout" href="#" title="点击退出系统" class="easyui-tooltip">退出</a></p>	
		</div>
	</div>
	<div region="west" border="true" split="true" title="菜单导航" class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">
				<div title="教务管理">
					<a href="javascript:void(0);" src="/admin/stuadmin/studentpage" class="cs-navi-tab">学生管理</a></p>
					<a href="javascript:void(0);" src="/admin/stuadmin/termpage" class="cs-navi-tab">学籍管理</a></p>
					<a href="javascript:void(0);" src="/admin/stuadmin/coursepage" class="cs-navi-tab">课程管理</a></p>
					<a href="javascript:void(0);" src="/admin/stuadmin/scorepage" class="cs-navi-tab">成绩管理</a></p>
				</div>
				<div title="报表中心">
					<a href="javascript:void(0);" src="/admin/sturpt/termCourseScore" class="cs-navi-tab">成绩分布统计</a></p>
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
	
	<!--退出提示对话框-->
	<div id="dlg" class="easyui-dialog" style="padding:5px;width:400px;height:200px;"
        title="提示" iconCls="icon-ok"  buttons="#dlg-buttons" data-options="modal:true">
    是否真的要退出系统呢?
	</div>
	<div id="dlg-buttons">
    <a href="/logout?username=${Session.user.username}" class="easyui-linkbutton" iconCls="icon-ok">确认</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	
	<!--修改密码-->
    <div id="dlg-updatePasswd" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-updatePasswd-buttons">
        <form id="fm-updatePasswd" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">密码信息</div>
            <div style="margin-bottom:10px">
                <input name="username" class="easyui-textbox" required="true" value="${Session.user.username}" editable="false" label="账号名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="newpassword" class="easyui-passwordbox" prompt="Password" required="true" label="新密码:" style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-updatePasswd-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUpdatePasswd()" style="width:90px">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-updatePasswd').dialog('close')" style="width:90px">取消</a>
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
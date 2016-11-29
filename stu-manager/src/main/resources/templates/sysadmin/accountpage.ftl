<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>账号管理</title>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/dhu.css">
    <script type="text/javascript">
        var url;
        //打开新增账号框
        function newUser(){
            $('#dlg-add').dialog('open').dialog('center').dialog('setTitle','添加用户');
            $('#fm-add').form('clear');
            url = '/admin/service/addUser';
        }
        //编辑用户
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg-edit').dialog('open').dialog('center').dialog('setTitle','修改用户');
                $('#fm-edit').form('load',row);
                url = 'update_user.php?id='+row.id;
            }
        }
        //添加用户
        function saveUser(){
            $('#fm-add').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.success){
                    	//成功
                        $('#dlg-add').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '账号添加成功!'
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
        ///删除账号
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','真的要删除账号 ' + row.username + ' 么?',function(r){
                    if (r){
                        $.post('/admin/service/deleteUserByName/' + row.username,{username:row.username},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                                $.messager.show({    
                                    title: '提示',
                                    msg: '账号 ' + row.username + ' 删除成功!'
                                });
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
        //格式化身份类型
        function formatUserType(val,row){
			if (val == 1){
				return '<span style="color:red;">管理员</span>';
			} else {
				return '<span style="color:blue;">普通用户</span>';
			}
		}
    </script>
</head>
<body>
    <table id="dg" title="账号管理" class="easyui-datagrid" style="width:100%;height:480px"
            url="/admin/service/getUsers" method="get"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="username" width="30">账号名</th>
                <th field="realname" width="30">真实姓名</th>
                <th field="user_type" width="20" formatter="formatUserType">身份类型</th>
                <th field="create_time" width="50">创建时间</th>
                <th field="lastloginip" width="50">最后登录IP</th>
                <th field="lastlogin_time" width="50">最后登录时间</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增账号</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改账号</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除账号</a>
    </div>
    
    <!--新增-->
    <div id="dlg-add" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-add-buttons">
        <form id="fm-add" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
            <div style="margin-bottom:10px">
                <input name="realname" class="easyui-textbox" required="true" label="真实姓名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="username" class="easyui-textbox" required="true" label="账号名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="password" class="easyui-passwordbox" prompt="Password" required="true" label="密码:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <select class="easyui-combobox" name="user_type" editable="false" panelheight="80" required="true" label="账号类别:" style="width:100%">
				    <option value="0">普通用户</option>
				    <option value="1">管理员</option>
				</select>
            </div>
        </form>
    </div>
    <div id="dlg-add-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-add').dialog('close')" style="width:90px">取消</a>
    </div>
    
    <!--修改-->
    <div id="dlg-edit" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-edit-buttons">
        <form id="fm-edit" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
            <div style="margin-bottom:10px">
                <input name="username" class="easyui-textbox" required="true" editable="false" label="账号名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="realname" class="easyui-textbox" required="true" label="真实姓名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <select class="easyui-combobox" name="user_type" editable="false" panelheight="80" required="true" label="账号类别:" style="width:100%">
				    <option value="0">普通用户</option>
				    <option value="1">管理员</option>
				</select>
            </div>
        </form>
    </div>
    <div id="dlg-edit-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-edit').dialog('close')" style="width:90px">取消</a>
    </div>
</body>
</html>
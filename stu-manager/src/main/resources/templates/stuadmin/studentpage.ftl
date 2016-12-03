<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/dhu.css">
    <script type="text/javascript">
	$.fn.datebox.defaults.formatter = function(date){
	        var y = date.getFullYear();
	        var m = date.getMonth()+1;
	        var d = date.getDate();
	        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	    };
	    $.fn.datebox.defaults.parser = function(s){
	        if (!s) return new Date();
	        var ss = s.split('-');
	        var y = parseInt(ss[0],10);
	        var m = parseInt(ss[1],10);
	        var d = parseInt(ss[2],10);
	        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
	            return new Date(y,m-1,d);
	        } else {
	            return new Date();
	        }
	    };
	 </script>
    <script type="text/javascript">
        var url;
        //打开新增学生信息框
        function newStudent(){
            $('#dlg-add').dialog('open').dialog('center').dialog('setTitle','新增学生');
            $('#fm-add').form('clear');
            url = '/admin/service/addStudent';
        }
        //编辑学生
        function editStudent(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg-edit').dialog('open').dialog('center').dialog('setTitle','修改学生');
                $('#fm-edit').form('load',row);
                url = '/admin/service/editStudent';
            }
        }
        //添加学生
        function saveNewStudent(){
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
                        $('#dg').datagrid('reload');    // reload the Student data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '学生信息添加成功!'
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
        //编辑学生
        function saveEditStudent(){
            $('#fm-edit').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.success){
                    	//成功
                        $('#dlg-edit').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the Student data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '学生信息修改成功!'
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
        ///删除学生信息
        function destroyStudent(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','真的要删除学生ID ' + row.studentId + ' 么?',function(r){
                    if (r){
                        $.post('/admin/service/deleteStudentById/' + row.studentId,{studentId:row.studentId},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                                $.messager.show({    
                                    title: '提示',
                                    msg: '学生编号 ' + row.studentId + ' 删除成功!'
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
        //格式化性别类型
        function formatUserGendar(val,row){
			if (val == 1){
				return '<span style="color:blue;">男</span>';
			} else if (val == 2){
				return '<span style="color:green;">女</span>';
			} else {
				return '<span style="color:red;">未知</span>';
			}
		}
    </script>
</head>
<body>
    <table id="dg" title="学生管理" class="easyui-datagrid" style="width:100%;height:480px"
            url="/admin/service/getStudents" method="get"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="studentId" width="30">学生编号</th>
                <th field="stuName" width="30">真实姓名</th>
                <th field="stuGendar" width="20" formatter="formatUserGendar">性别</th>
                <th field="stuBirth" width="50">出生年月</th>
                <th field="mobile" width="50">手机号</th>
                <th field="idcard" width="50">身份证编号</th>
                <th field="createTime" width="50">添加时间</th>
                <th field="updateTime" width="50">最后修改时间</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newStudent()">新增学生</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editStudent()">修改学生</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyStudent()">删除学生</a>
    </div>
    
    <!--新增-->
    <div id="dlg-add" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-add-buttons">
        <form id="fm-add" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">学生信息</div>
            <div style="margin-bottom:10px">
                <input name="studentId" class="easyui-textbox" required="true" label="学生编号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="stuName" class="easyui-textbox" required="true" label="真实姓名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <select class="easyui-combobox" name="stuGendar" editable="false" panelheight="80" required="true" label="性别:" style="width:100%">
				    <option value="1">男</option>
				    <option value="2">女</option>
				</select>
            </div>
            <div style="margin-bottom:10px">
                <input name="stuBirth" class="easyui-datebox" required="true" label="出生年月:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="mobile" class="easyui-textbox" required="true" label="手机:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="idcard" class="easyui-textbox" required="true" label="身份证:" style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-add-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveNewStudent()" style="width:90px">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-add').dialog('close')" style="width:90px">取消</a>
    </div>
    
    <!--修改学生-->
    <div id="dlg-edit" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-edit-buttons">
        <form id="fm-edit" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">学生信息</div>
            <div style="margin-bottom:10px">
                <input name="studentId" class="easyui-textbox" required="true" editable="false" label="学生编号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="stuName" class="easyui-textbox" required="true" label="真实姓名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <select class="easyui-combobox" name="stuGendar" editable="false" panelheight="80" required="true" label="性别:" style="width:100%">
				    <option value="1">男</option>
				    <option value="2">女</option>
				</select>
            </div>
            <div style="margin-bottom:10px">
                <input name="stuBirth" class="easyui-datebox" required="true" label="出生年月:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="mobile" class="easyui-textbox" required="true" label="手机:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="idcard" class="easyui-textbox" required="true" label="身份证:" style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-edit-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveEditStudent()" style="width:90px">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-edit').dialog('close')" style="width:90px">取消</a>
    </div>
</body>
</html>
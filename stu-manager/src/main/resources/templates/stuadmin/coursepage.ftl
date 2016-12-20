<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>课程管理</title>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/dhu.css">
    <script type="text/javascript">
        var url;
        //打开新增课程信息框
        function newCourse(){
            $('#dlg-add').dialog('open').dialog('center').dialog('setTitle','新增课程');
            $('#fm-add').form('clear');
            url = '/admin/service/addCourse';
        }
        //编辑课程
        function editCourse(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg-edit').dialog('open').dialog('center').dialog('setTitle','修改课程');
                $('#fm-edit').form('load',row);
                url = '/admin/service/editCourse';
            }
        }
        //添加课程
        function saveNewCourse(){
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
                        $('#dg').datagrid('reload');    // reload the Course data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '课程信息添加成功!'
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
        //编辑课程
        function saveEditCourse(){
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
                        $('#dg').datagrid('reload');    	   // reload the Course data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '课程信息修改成功!'
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
        ///删除课程信息
        function destroyCourse(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','真的要删除课程ID ' + row.courseId + ' 么?',function(r){
                    if (r){
                        $.post('/admin/service/deleteCourseById/' + row.courseId,{courseId:row.courseId},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                                $.messager.show({    
                                    title: '提示',
                                    msg: '课程编号 ' + row.courseId + ' 删除成功!'
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
    </script>
</head>
<body>
    <table id="dg" title="课程管理" class="easyui-datagrid" style="width:100%;height:480px"
            url="/admin/service/getCourses" method="get"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="courseId" width="30">课程编号</th>
                <th field="courseName" width="60">课程名称</th>
                <th field="courseNotes" width="50">备注信息</th>
                <th field="createTime" width="50">添加时间</th>
                <th field="createUser" width="50">添加人</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCourse()">新增课程</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCourse()">修改课程</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyCourse()">删除课程</a>
    </div>
    
    <!--新增-->
    <div id="dlg-add" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-add-buttons">
        <form id="fm-add" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">课程信息</div>
            <div style="margin-bottom:10px">
                <input name="courseName" class="easyui-textbox" required="true" label="课程名称:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="courseNotes" class="easyui-textbox" required="true" style="width:100%;height:60px" data-options="multiline:true" label="备注:">
            </div>
        </form>
    </div>
    <div id="dlg-add-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveNewCourse()" style="width:90px">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-add').dialog('close')" style="width:90px">取消</a>
    </div>
    
    <!--修改课程-->
    <div id="dlg-edit" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-edit-buttons">
        <form id="fm-edit" method="post" novalidate style="margin:0;padding:20px 50px">
        	<div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">课程信息</div>
            <div style="margin-bottom:10px">
                <input name="courseId" class="easyui-textbox" required="true" editable="false" label="课程编号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="courseName" class="easyui-textbox" required="true" label="课程名称:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="courseNotes" class="easyui-textbox" required="true" style="width:100%;height:60px" data-options="multiline:true" label="备注:">
            </div>
        </form>
    </div>
    <div id="dlg-edit-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveEditCourse()" style="width:90px">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-edit').dialog('close')" style="width:90px">取消</a>
    </div>
</body>
</html>
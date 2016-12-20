<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分数管理</title>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/dhu.css">
    <script type="text/javascript">
        var url;
        //打开新增分数信息框
        function newScore(){
            $('#dlg-add').dialog('open').dialog('center').dialog('setTitle','新增学生分数');
            $('#fm-add').form('clear');
            url = '/admin/service/addStudentScore';
        }
        //编辑分数
        function editScore(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg-edit').dialog('open').dialog('center').dialog('setTitle','修改学生分数');
                $('#fm-edit').form('load',row);
                url = '/admin/service/editStudentScore';
            }
        }
        //添加分数
        function saveNewScore(){
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
                        $('#dg').datagrid('reload');    // reload the Score data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '学生分数信息添加成功!'
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
        //编辑分数
        function saveEditScore(){
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
                        $('#dg').datagrid('reload');    	   // reload the Score data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '分数信息修改成功!'
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
        //格式化成绩
		function cellStyler(value,row,index){
            if (value >= 60){
                return 'background-color:#ffee00;color:red;';
            } else {
            	return 'background-color:LightGreen';
            }
        }
    </script>
</head>
<body>
    <table id="dg" title="分数管理" class="easyui-datagrid" style="width:100%;height:480px"
            url="/admin/service/getStudentScores" method="get"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="termId" width="30" hidden="true">学籍编号</th>
                <th field="courseId" width="30" hidden="true">课程编号</th>
                <th field="studentId" width="30" hidden="true">学生编号</th>
                <th field="termName" width="60">学籍名称</th>
                <th field="courseName" width="50">课程名称</th>
                <th field="stuName" width="50">学生姓名</th>
                <th field="score" width="20" styler="cellStyler">分数</th>
                <th field="createTime" width="60">添加时间</th>
                <th field="createUser" width="50">添加人</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newScore()">新增分数</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editScore()">修改分数</a>
    </div>
    
    <!--新增-->
    <div id="dlg-add" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-add-buttons">
        <form id="fm-add" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">分数信息</div>
            <div style="margin-bottom:10px">
                <input class="easyui-combobox" label="学籍信息:" name="termId" required="true" style="width:100%" editable="false" data-options="valueField:'termId',textField:'termName',method:'get',panelHeight:'auto',url:'/admin/service/getTerms'"/>
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-combobox" label="课程信息:" name="courseId" required="true" style="width:100%" editable="false" data-options="valueField:'courseId',textField:'courseName',method:'get',panelHeight:'auto',url:'/admin/service/getCourses'"/>
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-combobox" label="学生信息:" name="studentId" required="true" style="width:100%" editable="false" data-options="valueField:'studentId',textField:'stuName',method:'get',panelHeight:'auto',url:'/admin/service/getStudents'"/>
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-numberbox" label="分数:" name="score" required="true" style="width:100%" data-options="min:0,max:100">
            </div>
        </form>
    </div>
    <div id="dlg-add-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveNewScore()" style="width:90px">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-add').dialog('close')" style="width:90px">取消</a>
    </div>
    
    <!--修改分数-->
    <div id="dlg-edit" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-edit-buttons">
        <form id="fm-edit" method="post" novalidate style="margin:0;padding:20px 50px">
        	<div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">分数信息</div>
            <div style="margin-bottom:10px">
                <input class="easyui-combobox" label="学籍信息:" name="termId" required="true" style="width:100%" editable="false" data-options="valueField:'termId',textField:'termName',method:'get',panelHeight:'auto',url:'/admin/service/getTerms'"/>
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-combobox" label="课程信息:" name="courseId" required="true" style="width:100%" editable="false" data-options="valueField:'courseId',textField:'courseName',method:'get',panelHeight:'auto',url:'/admin/service/getCourses'"/>
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-combobox" label="学生信息:" name="studentId" required="true" style="width:100%" editable="false" data-options="valueField:'studentId',textField:'stuName',method:'get',panelHeight:'auto',url:'/admin/service/getStudents'"/>
            </div>
            <div style="margin-bottom:10px">
                <input class="easyui-numberbox" label="分数:" name="score" required="true" style="width:100%" data-options="min:0,max:100">
            </div>
        </form>
    </div>
    <div id="dlg-edit-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveEditScore()" style="width:90px">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-edit').dialog('close')" style="width:90px">取消</a>
    </div>
</body>
</html>
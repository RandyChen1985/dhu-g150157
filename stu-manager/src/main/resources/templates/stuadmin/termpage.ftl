<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学籍管理</title>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/dhu.css">
    <script type="text/javascript">
        var url;
        //打开新增学籍信息框
        function newTerm(){
            $('#dlg-add').dialog('open').dialog('center').dialog('setTitle','新增学籍');
            $('#fm-add').form('clear');
            url = '/admin/service/addTerm';
        }
        //编辑学籍
        function editTerm(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg-edit').dialog('open').dialog('center').dialog('setTitle','修改学籍');
                $('#fm-edit').form('load',row);
                url = '/admin/service/editTerm';
            }
        }
        //添加学籍
        function saveNewTerm(){
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
                        $('#dg').datagrid('reload');    // reload the Term data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '学籍信息添加成功!'
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
        //编辑学籍
        function saveEditTerm(){
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
                        $('#dg').datagrid('reload');    	   // reload the Term data
                        $.messager.show({    
                                    title: '提示',
                                    msg: '学籍信息修改成功!'
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
        ///删除学籍信息
        function destroyTerm(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','真的要删除学籍ID ' + row.termId + ' 么?',function(r){
                    if (r){
                        $.post('/admin/service/deleteTermById/' + row.termId,{termId:row.termId},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                                $.messager.show({    
                                    title: '提示',
                                    msg: '学籍编号 ' + row.termId + ' 删除成功!'
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
    //打开新增课程分配信息框
    function newTermCourseDispatcher(){
    	var row = $("#dg").datagrid('getSelected');
		if(row){
			$('#dlg-courseSetting').dialog('open').dialog('center').dialog('setTitle','分配课程');
			$('#inr').datagrid({    
			    url:'/admin/service/getCourseInTerm?termId='+row.termId,        
			});
			$('#notr').datagrid({    
			    url:'/admin/service/getCourseNotInTerm?termId='+row.termId,        
			});
			}
	}
    
    function leftRole(){
    	var row = $("#dg").datagrid('getSelected'); 
    	var row1 = $("#notr").datagrid('getSelected');
    	if(row1){
    	 	$.post('/admin/service/addTermCourse',{termId:row.termId,courseId:row1.courseId},function(result){
    			$('#inr').datagrid('reload');
        		$('#notr').datagrid('reload');
    		},'json');
    	}
    }
    
   function rightRole(){
    	var row = $("#dg").datagrid('getSelected'); 
    	var row1 = $("#inr").datagrid('getSelected');

        if (row1){
		    $.messager.confirm('确认','真的要删除课程 ' + row1.courseName + ' 么?',function(r){
		        if (r){
		            $.post('/admin/service/removeTermCourse',{termId:row.termId,courseId:row1.courseId},function(result){
		                if (result.success){
		                    $('#inr').datagrid('reload');
	        				$('#notr').datagrid('reload');
		                    $.messager.show({    
		                        title: '提示',
		                        msg: '课程 ' + row1.courseName + ' 删除成功!'
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
    <table id="dg" title="学籍管理" class="easyui-datagrid" style="width:100%;height:480px"
            url="/admin/service/getTerms" method="get"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="termId" width="30">学籍编号</th>
                <th field="termName" width="60">学籍名称</th>
                <th field="termNotes" width="50">备注信息</th>
                <th field="createTime" width="50">添加时间</th>
                <th field="createUser" width="50">添加人</th>
                <th field="op" width="50">操作</th>
            </tr>
        </thead>   
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newTerm()">新增学籍</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editTerm()">修改学籍</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyTerm()">删除学籍</a>
    </div>
    
    <!--新增-->
    <div id="dlg-add" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-add-buttons">
        <form id="fm-add" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">学籍信息</div>
            <div style="margin-bottom:10px">
                <input name="termId" class="easyui-textbox" required="true" label="学籍编号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="termName" class="easyui-textbox" required="true" label="学籍名称:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="termNotes" class="easyui-textbox" required="true" style="width:100%;height:60px" data-options="multiline:true" label="备注:">
            </div>
        </form>
    </div>
    <div id="dlg-add-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveNewTerm()" style="width:90px">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-add').dialog('close')" style="width:90px">取消</a>
    </div>
    
    <!--修改学籍-->
    <div id="dlg-edit" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-edit-buttons">
        <form id="fm-edit" method="post" novalidate style="margin:0;padding:20px 50px">
        	<div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">学籍信息</div>
            <div style="margin-bottom:10px">
                <input name="termId" class="easyui-textbox" required="true" editable="false" label="学籍编号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="termName" class="easyui-textbox" required="true" label="学籍名称:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="termNotes" class="easyui-textbox" required="true" style="width:100%;height:60px" data-options="multiline:true" label="备注:">
            </div>
        </form>
    </div>
    <div id="dlg-edit-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveEditTerm()" style="width:90px">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-edit').dialog('close')" style="width:90px">取消</a>
    </div>
    
    
     <!-- 这是为学期添加课程的 -->
     <div id="dlg-courseSetting" class="easyui-dialog" style="width: 600px;height: 400px;"closed="true" buttons="#dlg-courseSetting-buttons">
		<div id="cc" class="easyui-layout" fit="true">     
		    <div data-options="region:'east'" style="width:200px;">
		    	<!-- 已分配的课程 -->
		    	<table id="inr" class="easyui-datagrid" singleSelect="true" method="get">
					<thead>
					<tr>
					<th field="courseId"  align="center" hidden="true">编号</th>
					<th field="courseName" width="170" align="center">已选课程</th>
					</tr>
					</thead>
				</table>
		    </div>   
		    <div data-options="region:'west'" style="width:200px;">
		    	<!--待分配的课程-->
		    	<table id="notr" class="easyui-datagrid" singleSelect="true" method="get">
					<thead>
					<tr>
					<th field="courseId"  align="center" hidden="true">编号</th>
					<th field="courseName" width="170" align="center">未选课程</th>
					</tr>
					</thead>
				</table>	    
		    </div>   
		    <div data-options="region:'center'">
				<div align="center" style="height:200px;padding:50px;">
				<a href="javascript:leftRole()" class="easyui-linkbutton">&gt;&gt;</a>
				</div>
				<div align="center">
				<a href="javascript:rightRole()" class="easyui-linkbutton">&lt;&lt;</a>
				</div>	    
		    </div>   
		</div> 
		</div>
		<div id="dlg-courseSetting-buttons">
        	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-courseSetting').dialog('close')" style="width:90px">关闭</a>
        </div>
		
</body>
</html>
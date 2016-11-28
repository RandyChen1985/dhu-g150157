<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>日志管理</title>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resource/commons/jeasyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/resource/commons/jeasyui/themes/dhu.css">
</head>
<body>
    <table id="dg" title="日志管理" class="easyui-datagrid" style="width:100%;height:350px"
            url="/admin/service/getLogs" method="get" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="logtime" width="50">日志时间</th>
                <th field="logip" width="30">登录IP</th>
                <th field="username" width="30">账号名</th>
                <th field="logtype" width="30">日志类别</th>
                <th field="logstatus" width="10" formatter="formatOppStatus">状态</th>
                <th field="notes" width="100">备注</th>
            </tr>
        </thead>
    </table>
    <script type="text/javascript">
        //格式化状态
        function formatOppStatus(val,row){
			if (val == 1){
				return '<span style="color:red;">失败</span>';
			} else {
				return '<span style="color:green;">成功</span>';
			}
		}
    </script>
</body>
</html>
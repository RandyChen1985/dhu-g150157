<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>成绩统计报表</title>
<script type="text/javascript" src="/resource/commons/jeasyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resource/echarts/js/echarts.js"></script>
<script type="text/javascript" src="/resource/echarts/theme/macarons.js"></script>
</head>
<body style="height: 100%; margin: 0">
       <div id="container" style="height: 500px"></div>
       <script type="text/javascript">
	    var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		option = null;
		
	    option = {
	    	backgroudColor:'#f3f3f3',
	        tooltip : {
	            trigger: 'axis',
	            axisPointer:{
	            	type:'shadow'
	            }
	        },
	        toolbox: {
	            show : true,
	            feature : {
	                mark : {show: true},
	                dataView : {show: true, readOnly: false},
	                magicType: {show: true, type: ['line', 'bar']},
	                restore : {show: true},
	                saveAsImage : {show: true}
	            }
	        },
	        calculable : true,
	        legend: {
	        	top:30,
	        	x: '4%',
	            data:[]
	        },
	        grid: {
	        	show:true,
	            top: 50,
	            left: '1%',
	            right: '10%',
	            containLabel: true
	        },
	        xAxis: 
	            {
	            	type:'category',
	            	name: '分数',
	            	show:true,
	            	data:[]
	        	}
	        ,
	        yAxis: 
	            {
	            	name: '人数',
	                type : 'value'
	            }
	        ,
	        dataZoom: [
	            {
	                show: true,
	                start: 94,
	                end: 100
	            },
	            {
	                type: 'inside',
	                start: 94,
	                end: 100
	            },
	            {
	                show: true,
	                yAxisIndex: 0,
	                filterMode: 'empty',
	                width: 30,
	                height: '80%',
	                showDataShadow: false,
	                left: '93%'
	            }
	        ],
	        series : [
	            {
	                name: '',
	                stack:'',
	                type: 'line',
	                itemStyle:{
	                	"normal":{
	                		"lable":{
	                			"show":true
	                		}
	                	}
	                },
	                data: []
	            }
	        ]
	    };
	
	    myChart.setOption(option);
		if (option && typeof option === "object") {
		    myChart.setOption(option, true);
		}
		
		initData(myChart,option);
		
		//处理数据
		function initData(myChart,option) {
			myChart.setOption(option,true);
			$.ajax({
				type: 'GET',
				url: '/admin/service/getRptTermCourseScores',
				async: false,
				dataType: 'json',
				beforeSend: function(xhr){
					myChart.showLoading();
				},
				complete:function() {
					myChart.hideLoading();
				},
				success: function(response) {
					
					var data = response;
					//系列名称--学期#课程
					var legend_data = (function(){
						var tmp_legend_data = new Array();
						for (var i = 0 ; i < data.length; i ++) {
							if ($.inArray(data[i].termCourse,tmp_legend_data) == -1) {
								tmp_legend_data.push(data[i].termCourse);
							}
						}
						tmp_legend_data.sort(); //排序
						return tmp_legend_data;			
					}());
					
					
					//横坐标--分数
					var x_axis_data = (function(){
						var tmp_x_axis_data = new Array();
						for (var i = 0 ; i < data.length; i ++) {
							if ($.inArray(data[i].score,tmp_x_axis_data) == -1) {
								tmp_x_axis_data.push(data[i].score);
							}
						}
						tmp_x_axis_data.sort(); //排序
						return tmp_x_axis_data;			
					}());
					
					
					//数据
					var series = (function(){
						var temp_series = [];
						for(var legend_data_key in legend_data) {
							var legend_data_value = legend_data[legend_data_key];
							var serie_data = [];
							for (var x_axis_data_index in x_axis_data) {
								var serie_data_value = "0";
								for (var i = 0 ; i < data.length; i ++) {
									if (legend_data_value == data[i].termCourse && x_axis_data[x_axis_data_index] == data[i].score) {
										serie_data_value = data[i].cnt + "";
										break;
									}
								}
								//
								serie_data.push(serie_data_value);
							}
							//某个系列
							temp_series.push({
								'name':legend_data_value,
								'type':"line",
								'stack':legend_data_value,
								'data':serie_data
							});
						}
						return temp_series;
					}());

					//赋值
					option.legend.data = legend_data;
					option.xAxis.data = x_axis_data;
					option.series = series;
					myChart.setOption(option,true);
				},
				error:function() {
					//提示错误
					window.alert('获取数据失败了!!');
				}
			});
		}
       </script>
</body>
</html>
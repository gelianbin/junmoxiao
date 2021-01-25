<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="js/proTree.js" ></script>
<script src="js/jquery.easy-pie-chart.min.js"></script>
  <!-- 引入 ECharts 文件 -->
    <script src="js/echarts.min.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>订单列表</title>
</head>
<body>
<div class="margin" id="page_style">
<form action="selectForderList.do" method="post">
 <div class="operation clearfix mb15 same_module">
<ul class="choice_search">

  <!--     <li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label class="label_name ">入住时间：</label>
      <input class="inline laydate-icon form-control Select_Date" id="start" name="stime1">
      </li>
       <li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label class="label_name ">截止时间：</label>
      <input class="inline laydate-icon form-control Select_Date" id="end" name="etime1">
      </li>
      <li class="clearfix col-xs-2 col-lg-3 col-ms-3 ">
       <button type="submit" class="btn button_btn bg-deep-blue "><i class="icon-search"></i>查询</button></li> -->
    </ul>
	</div>
	</form>

<!--列表展示-->
<div class="h_products_list clearfix" id="Sellerber">
 
<div class="list_Exhibition list_show padding15" style="width:100%;" >

 <div class="datalist_show">
  <div class=" confirm" style="width:100%;">
   <div class="chart-panel panel panel-default">
                <div class="panel-body" id="chart" style="height: 376px;">
                </div>
            </div>
  
 
    </div>
    </div>
	</div>
   </div>
 </div>
 
<script src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
    // 直接页面写的调用ajax的方法
    function callbackFn(myChart, jsonURL) {
    	
        $.ajax({
            url: jsonURL,
            dataType: "json",
            success: function (jsonData) {

                myChart.setOption({
                    xAxis: {
                        data: jsonData.sj
                    },
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '营业额',
                        data: jsonData.hp
                    },
                       /*  {
                            // 根据名字对应到相应的系列
                            name: '差评量',
                            data: jsonData.cp
                        }, */
                    ]
                });
                // 设置加载等待隐藏
                myChart.hideLoading();
            }
        });
    }

    // 初始化echar报表的方法
    function initReport(myChart) {

        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            title: {
                text: '酒店菜品营业额统计'
            },
            tooltip: {},
            legend: {
                data: ['营业额']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '营业额',
                type: 'bar',
                //type: 'line', //折线
                data: []
            }/* , {
                name: '差评量',
                type: 'bar',
                //type: 'line', //折线
                data: []
                } */

            ]
        });
    }

    function createTestReport(showDivId, jsonURL) {
        var myChart = echarts.init(document.getElementById(showDivId));
        // 初始化report对象
        initReport(myChart);
        myChart.showLoading({text: '正在努力的读取数据中...'});
        // 调用后台获取json数据
        callbackFn(myChart, jsonURL);
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var showDivId = 'chart';
        var jsonURL = "tj3.do";
        createTestReport(showDivId, jsonURL);
    });
</script>
<script type="text/javascript">
	//设置内页框架布局
/* $(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:200,//菜单栏宽度
		minStatue:true,
		
	});
}); */

	/******时间设置*******/
  var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
   // min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    //min: laydate.now(),
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);

</script>
</body>
</html>


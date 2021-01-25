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
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>订单列表</title>
</head>
<body>
<div class="margin" id="page_style">
<form action="selectForderList_cp.do" method="post">
 <div class="operation clearfix mb15 same_module">
<ul class="choice_search">
<!-- <li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label class="label_name ">品牌名称：</label>
      <input placeholder="输入品牌名称"  name="" type="text" class="form-control col-xs-8 col-lg-8 col-ms-8">
	<select name="status" class="margin-right l_f select_style" >
 	<option value="">请选择订单状态</option>
 	<option value="预约">预约</option>
 	<option value="已住">已住</option>
 	<option value="历史记录">历史记录</option>
    </select>
    </li> -->
     <li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label class="label_name ">订单号：</label>
      <input placeholder="订单号"  name="ono" type="text" class="form-control col-xs-8 col-lg-8 col-ms-8">
      </li>
      <!-- <li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label class="label_name ">入住时间：</label>
      <input class="inline laydate-icon form-control Select_Date" id="start" name="stime1">
      </li>
       <li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label class="label_name ">截止时间：</label>
      <input class="inline laydate-icon form-control Select_Date" id="end" name="etime1">
      </li> -->
      <li class="clearfix col-xs-2 col-lg-3 col-ms-3 ">
     <!--  <select name="status" class="margin-right l_f select_style" >
 	<option value="">请选择订单状态</option>
 	<option value="待支付">待支付</option>
 	<option value="已支付，待确认">已支付，待确认</option>
 	<option value="已住">已住</option>
 	<option value="成功订单">成功订单</option>
    </select> -->
       
       <button type="submit" class="btn button_btn bg-deep-blue "><i class="icon-search"></i>查询</button></li>
    </ul>
	</div>
	</form>

<!--列表展示-->
<div class="h_products_list clearfix" id="Sellerber">
 
<div class="list_Exhibition list_show padding15" style="width:100%;" >
<%--
    <button class="btn button_btn bg-deep-blue " onclick="window.location.href='exportForder.do'" type="button"><i class="fa  fa-search"></i>&nbsp;导出</button>
--%>
 <div class="datalist_show">
  <div class=" confirm" style="width:100%;"><!-- datatable_height -->
 <table class="table table_list table_striped table-bordered" id="covar_list" >
  <thead>
    <tr>
		<!-- <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
		<th >编号</th>
		<th>下单人</th>
	<%--	<th>普通管理员</th>--%>
		<th>电话</th>
		<th>身份证号</th>
		<th>名称</th>
		<th>图片</th>
		<th>下单时间</th>
		<!-- <th>预订时间</th>
		<th>到期时间</th> -->
		<th>总价</th>
		<!-- <th>人数</th> -->
		<th>数量</th>
		<th >目前状态</th>				
		<!-- <th width="180px">所属类型</th>
		<th width="80px">数量</th> -->
		<!-- <th width="70px">状态</th>  -->               
		<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="o">
     <tr>
    <!--  <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td> -->
     <td>${o.ono}</td>
     <td>
     <c:forEach items="${ulist }" var="u">
     	<c:if test="${u.uid==o.uid }">
     		${u.tname }
     	</c:if>
     </c:forEach>
     </td>
     <%--<td>
     <c:forEach items="${ulist }" var="u">
     	<c:if test="${u.uid==o.qid }">
     		${u.tname }
     	</c:if>
     </c:forEach>
     </td>--%>
     <td>
     <c:forEach items="${ulist }" var="u">
     	<c:if test="${u.uid==o.uid }">
     		${u.tel }
     	</c:if>
     </c:forEach>
     </td>
     <td>
     <c:forEach items="${ulist }" var="u">
     	<c:if test="${u.uid==o.uid }">
     		${u.idnumber }
     	</c:if>
     </c:forEach>
     </td>
     <td>
     <c:forEach items="${hlist }" var="h">
     	<c:if test="${h.id==o.fid }">
     		${h.name }
     	</c:if>
     </c:forEach>
     </td>
     <td><c:forEach items="${hlist }" var="h">
     	<c:if test="${h.id==o.fid }">
     		<img src="../upload/${h.img }" width="30" height="30"/>
     	</c:if>
     </c:forEach>
     </td>
     <td>${o.pubtime }</td>
    <%--  <td>${o.stime }</td>
     <td>${o.etime }</td> --%>
     <td>${o.zprice }</td>
     <%-- <td>${o.amount }</td> --%>
     <td>${o.day }</td>
     <td>${o.status }</td>
     <td>
      <c:if test="${o.status=='已支付，待确认' }">
     	<a title="确认"  href="order_admin_chuFang_cp.do?id=${o.id }" class="btn btn-xs btn-status" >确认</a>
     </c:if>
      <c:if test="${o.status=='已评价' }">
     	<a title="回复"  href="doAddOrderPj.do?id=${o.id }"  class="btn btn-xs btn-status" >回复</a> 
     </c:if>
     </td>
     </tr>
    </c:forEach>
    <c:if test="${sessionScope.p==1 }">
    	<tr>
    <td colspan="20">
               当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="orderList_cp.do?page=1" >首页</a>
             	<a href="orderList_cp.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="orderList_cp.do?page=${page.page+1 }">下一页</a>
				<a href="orderList_cp.do?page=${page.totalPage }">末页</a>
		    	</c:if> 
				
    </td>
    </tr>
    </c:if>	
     <c:if test="${sessionScope.p==2 }">
    	<tr>
    <td colspan="20">
    
				<c:if test="${page.page>1}">
              	<a href="selectForderList_cp.do?page=1" >首页</a>
             	<a href="selectForderList_cp.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="selectForderList_cp.do?page=${page.page+1 }">下一页</a>
				<a href="selectForderList_cp.do?page=${page.totalPage }">末页</a>
		    	</c:if> 
				
    </td>
    </tr>
    </c:if>	
     </tbody>
     </table>
    </div>
    </div>
	</div>
   </div>
 </div>
  <!--发货-->
 

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


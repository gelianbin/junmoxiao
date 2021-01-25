<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
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
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>房间列表--排行榜</title>
</head>
<body>
<div class="margin" id="page_style">
<form method="post" action="vagueHouseList.do">
<div class="operation clearfix mb15 same_module">
<ul class="choice_search">
      <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">房间名称：</label><input name="name" type="text" class="form-control col-xs-8 col-lg-8 col-ms-8"/></li>
      <li class="clearfix col-xs-4 col-lg-3 col-ms-3 ">
      <select name="status" class="input w50" style="width:150px;" >
          <option value="">请选择目前状态</option>
          <option value="可用房间">可用房间</option>
          <option value="预订出">预订出</option>
          <option value="已住">已住</option>
        </select>
        </li>
      <li class="clearfix col-xs-4 col-lg-3 col-ms-3 ">
      <select name="bid" class="input w50" style="width:150px;" >
          <option value="">请选择分类</option>
         <c:forEach items="${adlist }" var="ad">
          <option value="${ad.id }">${ad.name }</option>
          </c:forEach>
        </select>
      <!-- <label class="label_name ">添加时间：</label>  -->
      <!-- <input class="laydate-icon col-xs-4 col-lg-3 form-control Select_Date" id="start" >
      <span style=" float:left; padding:0px 10px; line-height:32px;">至</span>
      <input class="laydate-icon col-xs-4 col-lg-3 form-control Select_Date" id="end"> -->
       <button class="btn button_btn bg-deep-blue " onclick="" type="submit"><i class="fa  fa-search"></i>&nbsp;搜索</button></li>
    </ul>
</div>
</form>
<!--列表展示-->
<div class="h_products_list clearfix" id="Sellerber">
 <!--  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div> 
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
        <div class="column_title"><h4 class="lighter smaller">房间类型列表</h4></div>
       <div class="st_tree_style tree">
      </div>
    </div>
  </div>
 </div>
</div> -->
<div class="list_Exhibition list_show padding15">
<!-- <div class="operation clearfix mb15 searchs_style">
<button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
<span class="submenu">add_product.html
<a href="doAddHouse.do" name="" class="btn button_btn bg-deep-blue" title="添加房间"><i class="fa  fa-edit"></i>&nbsp;添加房间</a>
<a href="add_product.html" name="" class="btn button_btn bg-deep-blue" title="添加房间"><i class="fa  fa-edit"></i>&nbsp;添加分类</a>
</span>
<div class="search  clearfix">
 <label class="label_name">商品搜索：</label><input name="" type="text"  class="form-control col-xs-5"/><button class="btn button_btn bg-deep-blue " onclick=""  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
 <span></span>
</div>
</div> -->
 <div class="datalist_show">
  <div class="datatable_height confirm">
 <table class="table table_list table_striped table-bordered" id="">
  <thead>
  <tr>
   <!--  <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
	<th>名次</th>
	<!-- <th width="80px">房间编号</th> -->
	<th >分类</th>
	<th >房间名称</th>
	<th>房间图片</th>
	<th>价格</th>
	<!-- <th>会员价</th> -->
	<th>人数</th>				
	<th>房间数</th>				
	<th>位置</th>
	<th>发布时间</th>
	<th>预订次数</th>                
	<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  
  <c:forEach items="${list }" var="h" varStatus="num">
     <tr>
       <!--  <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td> -->
        <td >${num.count }</td>    
        <td >${h.name }</td> 
        <td>
        <c:forEach items="${adlist }" var="t">
        	<c:if test="${t.id==h.bid }">
        		${t.name }
        	</c:if>
        </c:forEach>
        </td>               
        <td><img src="../upload/${h.img}" width="50" height="50" /></td>                
        <!-- <td width="250px"><u style="cursor:pointer" class="text-primary cor_bule" onclick="">小米 Max 全网通 高配版 3GB内存 64GB ROM 金色 移动联通电信4G手机Y</u></td> -->
        <%-- <td>${h.bprice }</td> --%>
        <td>${h.price }</td> 
        <td>${h.area }</td>         
        <td>${h.fjnum }</td>         
        <td>${h.addr }</td>
        <td>${h.pubtime }</td>
        <td>${h.onum }</td>
         <!-- class="text-l" -->
      <!--   <td class="td-status"><span class="label label-success radius">上架</span></td> -->
        <td class="td-manage">
        <a title="编辑"  href="doUpdateHouse_phb.do?id=${h.id }"  class="btn btn-xs btn-info" >编辑</a> 
        <%-- <a title="删除" href="deleteHouse.do?id=${h.id }"  onclick="return del(1,1,1)" class="btn btn-xs btn-delete" >删除</a> --%>
        <!-- <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a> -->
       </td>
	  </tr>
	  </c:forEach> 
	   <tr>
     <c:if test="${sessionScope.p==1 }">
		<td colspan="12">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
              <a href="HouseList.do?page=1" >首页</a>
             <a href="HouseList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="HouseList.do?page=${page.page+1 }">下一页</a>
			<a href="HouseList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="12">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
    <a href="vagueHouseList.do?page=1" >首页</a>
    <a href="vagueHouseList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="vagueHouseList.do?page=${page.page+1 }">下一页</a>
			<a href="vagueHouseList.do?page=${page.totalPage }">末页</a>
		</c:if> 
		</td>
		</c:if>
      </tr>
	   
     </tbody>
     </table>
    </div>
    </div>
	</div>
   </div>
 </div>

<script type="text/javascript">

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}else{
		return false;
	}
}
	//设置内页框架布局
$(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:200,//菜单栏宽度
		
	});
});
//后台传入的 标题列表
var arr = [{
		id: 1,
		name: "食品/酒类/特产",
	    amount:234,
		pid: 0,
	    
	}, {
		id: 2,
		name: "数码家电",
		amount:64,
		pid: 0,
		
	}, {
		id: 3,
		name: "家具/家居",
		amount:64,
		pid: 0,
		
	}, {
		id: 4,
		name: "电脑办公",
		amount:64,
		pid: 0,
		
	}, {
		id: 5,
		name: "图书影响",
		amount:64,
		pid: 0,
		
	}, {
		id: 6,
		name: "母婴用品",
		amount:64,
		pid: 0,
		
	}, {
		id: 13,
		name: "牛奶",
		amount:64,
		pid:1
	}, {
		id: 14,
		name: "面包",
		amount:64,
		pid:1
	}, {
		id: 15,
		name: "饼干",
		amount:64,
		pid:1
	}, {
		id: 16,
		name: "白酒",
		amount:64,
		pid:1
	}, {
		id: 17,
		name: "啤酒",
		amount:64,
		pid:1
	},  {
		id: 18,
		name: "红酒",
		amount:64,
		pid:1
	}, {
		id: 19,
		name: "音响",
		amount:64,
		pid:2
	}, {
		id: 20,
		name: "冰箱",
		amount:64,
		pid:2
	}, {
		id: 21,
		name: "洗衣机",
		amount:64,
		pid:2
	}, {
		id: 21,
		name: "洗衣机",
		amount:64,
		pid:3
	}, {
		id: 21,
		name: "洗衣机",
		amount:64,
		pid:4
	}, {
		id: 21,
		name: "洗衣机",
		amount:64,
		pid:5
	}

];
//树状图插件
$(".tree").ProTree({
	arr: arr,//数据
	simIcon: "fa fa-file-text-o",//单个标题字体图标 不传默认glyphicon-file
	mouIconOpen: "fa fa-folder-open",//含多个标题的打开字体图标  不传默认glyphicon-folder-open
	mouIconClose:"fa fa-folder",//含多个标题的关闭的字体图标  不传默认glyphicon-folder-close

})
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
/*房间-停用*/
function member_stop(obj,id){
	layer.confirm('确认要下架该房间吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="上架">上架</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}
/*房间-启用*/
function member_start(obj,id){
	layer.confirm('确认要上架改该房间吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-status" onClick="member_stop(this,id)" href="javascript:;" title="下架">下架</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上架</span>');
		$(obj).remove();
		layer.msg('已上架!',{icon: 6,time:1000});
	});
}
/*房间-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*房间-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
</body>
</html>

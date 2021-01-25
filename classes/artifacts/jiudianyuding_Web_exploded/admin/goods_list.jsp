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
<title>菜品列表</title>
</head>
<body>
<div class="margin" id="page_style">
<form method="post" action="vagueGoodsList.do">
<div class="operation clearfix mb15 same_module">
<ul class="choice_search">
      <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">菜品名称：</label><input name="name" type="text" class="form-control col-xs-8 col-lg-8 col-ms-8"/></li>
      <li class="clearfix col-xs-4 col-lg-3 col-ms-3 ">
      <select name="fid" class="input w50" style="width:150px;" >
          <option value="">请选择...</option>
          <c:forEach items="${clist }" var="ad">
              <option value="${ad.id }">${ad.name }</option>
          </c:forEach>
        </select>
        </li>
      <li class="clearfix col-xs-4 col-lg-3 col-ms-3 ">
       <button class="btn button_btn bg-deep-blue " onclick="" type="submit"><i class="fa  fa-search"></i>&nbsp;搜索</button></li>
    </ul>
</div>
</form>
<!--列表展示-->
<div class="h_products_list clearfix" id="Sellerber">
 
<div class="list_Exhibition list_show padding15">
<%--
<button class="btn button_btn bg-deep-blue " onclick="window.location.href='exportHouse.do'" type="button"><i class="fa  fa-search"></i>&nbsp;导出</button>
--%>
 <div class="datalist_show">
  <div class="datatable_height confirm">
 <table class="table table_list table_striped table-bordered" id="">
  <thead>
  <tr>
   <!--  <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
	<th>序号</th>
	<!-- <th width="80px">菜品编号</th> -->
      <th>菜品名</th>
      <th>图片</th>
      <th>所属类型</th>
      <th>价格</th>
	<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  
  <c:forEach items="${list }" var="jz" varStatus="num">
     <tr>
       <!--  <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td> -->
        <td >${num.count }</td>
         <td>${jz.name}</td>
         <td><img src="../upload/${jz.img}" width="50" height="50"></td>
         <td><c:forEach items="${clist }" var="ad">
             <c:if test="${jz.fid==ad.id }">
                 ${ad.name}
             </c:if>
         </c:forEach></td>
         <td>${jz.price}</td>
        
        <td class="td-manage">
        <a title="编辑"  href="doUpdateGoods.do?id=${jz.id }"  class="btn btn-xs btn-info" >编辑</a>
        <a title="删除" href="deleteGoods.do?id=${jz.id }"  onclick="return del(1,1,1)" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
	  </c:forEach> 
	  <!-- <tr>
	  <td colspan="15">
<img alt="" src="../images/zhifu.png" width="600px;" height="300px;">
	  </td>
	  </tr> -->
	   <tr>
     <c:if test="${sessionScope.p==1 }">
		<td colspan="15">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
              <a href="GoodsList.do?page=1" >首页</a>
             <a href="GoodsList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="GoodsList.do?page=${page.page+1 }">下一页</a>
			<a href="GoodsList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="15">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
    <a href="vagueGoodsList.do?page=1" >首页</a>
    <a href="vagueGoodsList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="vagueGoodsList.do?page=${page.page+1 }">下一页</a>
			<a href="vagueGoodsList.do?page=${page.totalPage }">末页</a>
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
/*菜品-停用*/
function member_stop(obj,id){
	layer.confirm('确认要下架该菜品吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="上架">上架</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}
/*菜品-启用*/
function member_start(obj,id){
	layer.confirm('确认要上架改该菜品吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-status" onClick="member_stop(this,id)" href="javascript:;" title="下架">下架</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上架</span>');
		$(obj).remove();
		layer.msg('已上架!',{icon: 6,time:1000});
	});
}
/*菜品-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*菜品-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
</body>
</html>

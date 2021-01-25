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
<title>地区列表</title>
</head>
<body>
<div class="margin" id="page_style">

<!--列表展示-->
<div class="h_products_list clearfix" id="Sellerber">
  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div> 
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
        <div class="column_title"><h4 class="lighter smaller">地区列表</h4></div>
       <div class="st_tree_style tree">
      </div>
    </div>
  </div>
 </div>
</div>
<div class="list_Exhibition list_show padding15">
<div class="operation clearfix mb15 searchs_style">
<span class="submenu">
<a href="type_add_dq.jsp"  class="btn button_btn bg-deep-blue" title="添加地区"><i class="fa  fa-edit"></i>&nbsp;添加地区</a>
</span>
</div>
 <div class="datalist_show">
  <div class="datatable_height confirm">
 <table class="table table_list table_striped table-bordered" id="">
  <thead>
  <tr>
  <!--   <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
	<th>地区编号</th>
	<th>地区名称</th>
	<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  
  <c:forEach items="${list }" var="t">
        <tr>
          <td>${t.id }</td>
          <td>${t.name }</td>
          <td class="td-manage">
       <!--  <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a>  -->
        <a title="编辑" onclick="member_edit1('编辑','member-add.html','4','','510')" href="doUpdateBtype_dq.do?id=${t.id }"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="deleteBtype_dq.do?id=${t.id }"  onclick="return del(1,1,1)" class="btn btn-xs btn-delete" >删除</a>
       </td>
        </tr>
       </c:forEach>
   		
      <tr>
         <c:if test="${sessionScope.p==1 }">
		<td colspan="3">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
              <a href="fBtypeList.do?page=1" >首页</a>
             <a href="fBtypeList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="fBtypeList.do?page=${page.page+1 }">下一页</a>
			<a href="fBtypeList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="3"> <c:if test="${page.page>1}">
    <a href="vagueBtypeList.do?page=1" >首页</a>
    <a href="vagueBtypeList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="vagueBtypeList.do?page=${page.page+1 }">下一页</a>
			<a href="vagueBtypeList.do?page=${page.totalPage }">末页</a>
		</c:if> 
		</td>
		</c:if>
 
	     
     </tbody>
     </table>
    </div>
    </div>
	</div>
   </div>
 </div>

<script type="text/javascript">
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


//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}else{
		return false;
	}
}
</script>

</body>
</html>
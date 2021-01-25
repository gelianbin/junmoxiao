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
<title>日志列表</title>
</head>
<body>
<div class="margin" id="page_style">
<form method="post" action="sysLogListQuery.do">
<div class="operation clearfix mb15 same_module">
<ul class="choice_search">
     <!--  <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">房间名称：</label><input name="name" type="text" class="form-control col-xs-8 col-lg-8 col-ms-8"/></li> -->
      <li class="clearfix col-xs-4 col-lg-3 col-ms-3 ">
      <select name="btype" class="input w50" style="width:150px;" >
          <option value="">请选择状态</option>
          <option value="后台登录">后台登录</option>
          <option value="前台登录">前台登录</option>
          <option value="后台注销">后台注销</option>
          <option value="前台注销">前台注销</option>
        </select>
        </li>
      <li class="clearfix col-xs-4 col-lg-3 col-ms-3 ">
      <select name="uid" class="input w50" style="width:150px;" >
          <option value="">请选择用户</option>
         <c:forEach items="${ulist }" var="ad">
          <option value="${ad.uid }">${ad.tname }</option>
          </c:forEach>
        </select>
       <button class="btn button_btn bg-deep-blue " onclick="" type="submit"><i class="fa  fa-search"></i>&nbsp;搜索</button></li>
    </ul>
</div>
</form>
<!--列表展示-->
<div class="h_products_list clearfix" id="Sellerber">
 
<div class="list_Exhibition list_show padding15">
<div class="operation clearfix mb15 searchs_style">
<!-- <button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button> -->
<span class="submenu">

<!-- <a href="add_product.html" name="" class="btn button_btn bg-deep-blue" title="添加日志"><i class="fa  fa-edit"></i>&nbsp;添加分类</a> -->
</span>
<!-- <div class="search  clearfix">
 <label class="label_name">用户搜索：</label>
 
 <input name="" type="text"  class="form-control col-xs-5"/>
 <button class="btn button_btn bg-deep-blue " onclick=""  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
 <span></span>
</div> -->
</div>
 <div class="datalist_show">
  <div class="datatable_height confirm">
 <table class="table table_list table_striped table-bordered" id="">
  <thead>
  <tr>
   <!--  <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
	<th>序号</th>
	<th>用户</th>
	<th>时间</th>
	<th>目前状态</th>
	<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  
  <c:forEach items="${list }" var="h" varStatus="num">
     <tr>
         
        <td >${num.count }</td>
        <td><c:forEach items="${ulist }" var="t">
        	<c:if test="${t.uid==h.uid }">
        		${t.tname }</c:if></c:forEach></td>
        <td>${h.pubtime }</td>
        <td>${h.btype }</td>
        <td class="td-manage">
        <a title="删除" href="deleteSysLog.do?id=${h.id }"  onclick="return del(1,1,1)" class="btn btn-xs btn-delete" >删除</a>
         
       </td>
	  </tr>
	  </c:forEach> 
	   <tr>
     <c:if test="${sessionScope.p==1 }">
		<td colspan="12">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
              <a href="sysLogList.do?page=1" >首页</a>
             <a href="sysLogList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="sysLogList.do?page=${page.page+1 }">下一页</a>
			<a href="sysLogList.do?page=${page.totalPage }">末页</a>
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

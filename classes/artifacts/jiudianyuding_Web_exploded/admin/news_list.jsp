<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
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
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="js/proTree.js" ></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>公告列表</title>
</head>
<body>
<div class="clearfix" id="page_style">
 <div class="Advertising_list  clearfix" id="Sellerber">
 <!--   <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div> 
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
       <div class="column_title"><h4 class="lighter smaller">广告分类</h4></div>
       <div class="st_tree_style tree"></div>
     </div>
    </div>
   </div>
  </div> -->
  <div class="list_Exhibition list_show padding15">
  <div class="operation clearfix mb15 searchs_style">
   <!--  <button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;批量删除</button> -->
   <%-- <c:if test="${sessionScope.auser.utype=='高级管理员' }"> --%>
    <a href="doAddNews.do" onClick="add_ads();" class="btn button_btn bg-deep-blue" title="添加公告"><i class="fa  fa-edit"></i>&nbsp;添加公告</a>
   <%-- </c:if> --%></div>
   <!--数据展示-->
    <div class="datalist_show">
      <div class="datatable_height confirm gallery">
        <table class="table table_list table_striped table-bordered " id="sample-table">
		<thead>
		 <tr>
                <th width="120px">序号</th>
                <th width="120px">标题</th>
                <th width="120px">发布人</th>
				<th width="100">分类</th>
				<th width="220px">图片</th>
				<th width="180px">添加时间</th>
				<th width="250px">操作</th>
			</tr>
		</thead>
	<tbody>
	 <c:forEach items="${list }" var="n" varStatus="num" >
      <tr>
       <td>${num.count }</td>
       <td>${n.name }</td>
       <td>
       <c:forEach items="${ulist }" var="u">
       <c:if test="${u.uid==n.uid }">
       ${u.utype }
       </c:if>
       </c:forEach>
       ${n.name }</td>
       <td>${n.btype }</td>
       <td><img src="../upload/${n.img}" alt="" width="80" height="50" /></td>
       <td>${n.pubtime }</td>
      <td class="td-manage">
       <%-- <c:if test="${sessionScope.auser.utype=='高级管理员' }"> --%>
    	<a title="编辑"  href="doUpdateNews.do?id=${n.id }"  class="btn btn-xs btn-info" >编辑</a> 
    	<%-- <c:if test="${n.btype=='公告动态' }"> --%>
       		 <a title="删除" href="deleteNews.do?id=${n.id }"  onclick="return del(1,1,1)" class="btn btn-xs btn-delete" >删除</a>	
         <%-- </c:if> --%>
         <%-- </c:if> --%>
        <a title="查看"  href="lookNews.do?id=${n.id }"  class="btn btn-xs btn-info" >查看</a> 
       </td>
      </tr>
      </c:forEach>
      
        <tr>
   		 <c:if test="${sessionScope.p==1 }">
		<td colspan="7"> <c:if test="${page.page>1}">
              <a href="newsList.do?page=1" >首页</a>
             <a href="newsList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="newsList.do?page=${page.page+1 }">下一页</a>
			<a href="newsList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
     </tbody>
     </table>
      <div class="clear"></div>
	</div>
   </div>
  </div>
 </div>
</div>
<!--添加广告样式-->
<form action="addNews.do" method="post" enctype="multipart/form-data" >
<div id="Advert_add_style" class="Advert_add_style padding display" >
 <div class="add_style">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-2">标题：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="name" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">类型：&nbsp;&nbsp;</label>
   <span class="cont_style col-xs-9">
   	<select name="btype" class="col-xs-10 col-sm-5">
   		<option value="公告动态">公告动态</option>
   	</select></span>
   
   <!-- <input name="btype" type="text" id="form-field-1" placeholder="0" class="col-xs-10 col-sm-5" style="width:50px"></span> --></li>
  <!--<li class="clearfix"><label class="label_name col-xs-2">链接地址：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="地址" type="text" id="form-field-1" placeholder="地址" class="col-xs-10 col-sm-5" style="width:450px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">状&nbsp;&nbsp;态：&nbsp;&nbsp;</label>
   <div class="Add_content col-xs-9">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace">
     <span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1" type="radio" class="ace">
     <span class="lbl">隐藏</span></label>
     </div>
     </li > -->
    <!--  <li class="clearfix">
     <label class="label_name col-xs-2">设置时间：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <label class="l_f checkbox_time"><input type="checkbox" name="checkbox" class="ace" id="checkbox"><span class="lbl">是</span></label>
    <div class="Date_selection" style="display:none">
      <span class="label_name">开始日：</span><p class="laydate-icon" id="start" style="width:160px; margin-right:10px; height:30px; line-height:30px; float:left"></p>
      <span class="label_name">结束日：</span><p class="laydate-icon" id="end" style="width:160px;height:30px; line-height:30px; float:left"></p>
    </div>
    </div>   
    </li> -->
     <li class="clearfix"><label class="label_name col-xs-2">图&nbsp;&nbsp;片：&nbsp;&nbsp;</label>
     <span class="cont_style col-xs-9"> 
     	 <input type="file" name="file" id="upfile" class="upfile" />       
       <!-- <div id="preview" class="preview_img"><img id="imghead" border="0" src="images/image.png" /></div> -->
      <!--  <div class="fileInput ">
        <input type="file" onchange="previewImage(this)" name="upfile" id="upfile" class="upfile"/>
        <input class="upFileBtn" type="button" value="上传图片" onclick="document.getElementById('upfile').click()" />
        </div> -->
       
      </span>
  </li>
  <li><button type="submit" class="layui-layer-btn0" >提交</button></li>
 </ul>
 </div>
</div>
</form>
<script type="text/javascript">

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}else{
		return false;
	}
}

</script>

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
		minStatue:true,
	});
}); 
	//后台传入的 标题列表


/*******添加广告*********/
function add_ads(){
	  layer.open({
        type: 1,
        title: '添加公告',
		maxmin: true, 
		shadeClose: false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#Advert_add_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_adverts input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
}
	
  /******时间设置*******/
  var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //设定最小日期为当前日期
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
    min: laydate.now(),
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

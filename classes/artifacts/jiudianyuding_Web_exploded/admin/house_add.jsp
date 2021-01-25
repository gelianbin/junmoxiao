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
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script src="js/hsCheckData.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>添加房间</title>
</head>

<body>
<div class="margin inside_pages clearfix">
<div class="add_style clearfix relative">
 <ul>
   <li class="clearfix"><label class="label_name col-xs-1"><!-- 设置时间： -->&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-11">
    <label class="l_f checkbox_time"><!-- <input type="checkbox" name="checkbox" class="ace" id="checkbox"> --><span class="lbl"></span></label>
    <div class="Date_selection" style="display:none">
      <span class="label_name">开始日：</span><p class="laydate-icon" id="start" style="width:200px; margin-right:10px; height:30px; line-height:30px; float:left"></p>
      <span class="label_name">结束日：</span><p class="laydate-icon" id="end" style="width:200px;height:30px; line-height:30px; float:left"></p>
    </div>
    </div>   
    </li>
 </ul>
</div>
</div>
<div class="margin inside_pages clearfix">
<form method="post"  action="addHouse.do"  enctype="multipart/form-data"> 
<div class="add_style clearfix relative">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>房间名称：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="name" type="text"  class="col-xs-6"/></div></li>
   
   <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>地区：&nbsp;&nbsp;</label><div class="Add_content col-xs-11">
     <select name="addr2" class="input w50">
        <c:forEach items="${dlist }" var="t">
       <option value="${t.id }">${t.name }</option>
       </c:forEach> 
        </select>
    </div>
     </li>
  <li class="clearfix">
  <label class="label_name col-xs-1"><i>*</i>房间位置：&nbsp;&nbsp;</label>
  <div class="Add_content col-xs-11">
  <input name="addr" type="text" class="col-xs-4"/>
  </div>
  </li> 
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>分类：&nbsp;&nbsp;</label><div class="Add_content col-xs-11">
     <select name="bid" class="input w50">
        <c:forEach items="${tlist }" var="t">
       <option value="${t.id }">${t.name }</option>
       </c:forEach> 
        </select>
     
    </div>
     </li>
  
    
     <li class="clearfix">
    <!--   <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>diq：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="addr2" type="text"  class="col-xs-7"/>
    </div>   
    </div> -->
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>价格：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="price" type="text"  class="col-xs-7"/><em class="Prompt">元</em>
    </div>   
    </div>
    <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>人数：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
   <input name="unum" type="text"  class="col-xs-7"/><em class="Prompt">人</em>
    </div>   
    </div>
    </li>
    <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>面积：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="area" type="text"  class="col-xs-7"/><em class="Prompt">㎡</em>
    </div>   
    </div>
    </li>
    <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>房间数：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="fjnum" type="text"  class="col-xs-7"/>
    </div>   
    </div>
    </li>
    <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>卫生间类型：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <select name="wsjtype" class="col-xs-7">
    <option value="公用卫生间">公用卫生间</option>
    <option value="独立卫生间">独立卫生间</option>
    </select>
    </div>   
    </div>
    </li>
      <li class="clearfix">
     <label class="label_name col-xs-1"><i>*</i>房间主图片：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11" id="Upload">
     <div class="images_Upload clearfix margin-bottom" id="images_Upload">
      <span class="Upload_img"><input name="file" type="file" /></span>
    </div>
     </div>
     </li>
      <!-- <li class="clearfix">
     <label class="label_name col-xs-1"><i>*</i>图片：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11" id="Upload">
     <div class="images_Upload clearfix margin-bottom" id="images_Upload">
      <span class="Upload_img"><input name="file" type="file" /></span>
    </div>
     </div>
     </li> -->
     <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>房间副图片1：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="file1" type="file" />
    </div>   
    </div>
    <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>房间副图片2：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="file2" type="file" />
    </div>   
    </div>
    <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>房间副图片3：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="file3" type="file" />
    </div>   
    </div>
     <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>房间副图片4：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="file4" type="file" />
    </div>   
    </div>
    </li>
  	<li class="clearfix"><label class="label_name col-xs-1"><i>*</i>房间简介：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11">
     	<textarea  id="note" name="jianjie" style="width:80%;height:50px;" ></textarea>
     </div>
     </li> 
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>内容介绍：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11">
     	<textarea id="editor_id" id="note" name="note" style="width:80%;height:100px;" ></textarea>
     <!-- <script id="editor" type="text/plain" style="width:100%;height:500px;"></script> --></div>
     </li> 
     <li  class="clearfix"><label class="label_name col-xs-1"><i></i>&nbsp;&nbsp;</label>
 		<div class="Add_content col-xs-11">
   		 <button class="btn button_btn bg-deep-blue" type="submit">保存</button>
 	</div>
 	</li>
 </ul>
 
</div>
</form>
</div>
<!--复文本编辑框-->
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script>

  /******时间设置*******/
  var start = {
    elem: '#start',
    format: 'YYYY/MM/DD hh:mm:ss',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16 23:59:59', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY/MM/DD hh:mm:ss',
    min: laydate.now(),
    max: '2099-06-16 23:59:59',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
/*********滚动事件*********/
 $("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:true,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
}); 
</script>
<script charset="utf-8" src="/jiudianyuding/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/jiudianyuding/kindeditor/lang/zh-CN.js"></script>
<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/jiudianyuding/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/jiudianyuding/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
</body>
</html>
   

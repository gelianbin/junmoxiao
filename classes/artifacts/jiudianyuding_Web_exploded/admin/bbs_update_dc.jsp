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
<title>回复投诉反馈信息</title>
</head>

<body>
<div class="margin inside_pages clearfix">
<form method="post"  action="updateBbs.do" > 
<div class="add_style clearfix relative">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>标题：&nbsp;&nbsp;</label>
  	<div class="Add_content col-xs-11">
  	<input name="name" type="text" class="col-xs-6" value="${bbs.name }" readonly="readonly"/>
  	<input name="id" type="hidden"  value="${bbs.id }"/>
  	</div>
  </li>
    
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>内容：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11">
     ${bbs.note }
     </div>
     </li> 
      <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>回复内容：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11">
     	<textarea id="editor_id" id="note" name="note2" style="width:80%;height:100px;" ></textarea>
     </div>
     </li>
     <li>
     	<div class="Button_operation btn_width">
    		<button class="btn button_btn bg-deep-blue" type="submit">保存</button>
   <!--  <button class="btn button_btn bg-orange" type="button">保存草稿</button>
    <button class="btn button_btn bg-gray" type="button">取消添加</button> -->
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
   

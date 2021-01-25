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
<title>更新用户信息</title>
</head>

<body>
<div class="margin inside_pages clearfix">
<div class="add_style clearfix relative">
 <ul>
   <li class="clearfix"><!-- <label class="label_name col-xs-1">设置时间：&nbsp;&nbsp;</label>  -->
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
<form method="post"  action="updatePersionUser.do"  enctype="multipart/form-data" >  
<div class="add_style clearfix relative">
  <!--品牌展示 当通过品牌管理添加房间是显示该-->
 <!--  <div class="Brand_title">
  	 <div class="Brand_img"><img src="product_img/logo/458.jpg"><h3>卡姿兰</h3></div>
  </div> -->
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>用户名：&nbsp;&nbsp;</label><div class="Add_content col-xs-11">
          <input type="hidden"  value="${user.uid }" name="uid" /><input value="${user.uname }" readonly="readonly"  type="text"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>密码：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input value="${user.pwd }" name="pwd" type="text" class="col-xs-4"/></div></li> 
     <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>电话：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="tel" type="text" name="tel"value="${user.tel }"  class="col-xs-7"/>
    </div>   
    </div>
    <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>性别：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
   <input type="text" name="sex" value="${user.sex }"  class="col-xs-7"/><em class="Prompt"></em>
    </div>   
    </div>
    </li>
  <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>姓名：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="tname" type="text" name="tel"value="${user.tname }"  class="col-xs-7"/>
    </div>   
    </div>
    </li>
      <li class="clearfix">
     <label class="label_name col-xs-1"><i>*</i>图片：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11" id="Upload">
     <div class="images_Upload clearfix margin-bottom" id="images_Upload">
      <span class="Upload_img"><input name="file" type="file" /></span>
    </div>
     </div>
     </li>
     
     
 </ul>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue" type="submit">保存</button>
 </div>
</div>
</form>
</div>
<script>
var cityData=[
{
		"2":"食品/保健/酒/饮料",
		"childCity":[
			{"201":"面包"},
			{"202":"饼干"},
			{"203":"白酒"},
			{"204":"啤酒"},
			{"205":"葡萄酒"},
			{"206":"香肠"},
			{"207":"火腿肠"},
			{"208":"牛奶"},
		]},
	{
		"3":"数码影像",
		"childCity":[
			{"301":"面包"},
			{"302":"饼干"},
			{"303":"白酒"},
			{"304":"啤酒"},
			{"305":"葡萄酒"},
			{"306":"香肠"},
			{"307":"火腿肠"},
			{"308":"牛奶"},
		]},
];
	$('#cityDanXuan').hsCheckData({
		isShowCheckBox: false, //默认为false
		data: cityData
	});
$(function(){
 var ue = UE.getEditor('editor');
});
$(document).ready(function(){
    var spotMax = 8;
  if($('div.images_Upload').size() >= spotMax) {$(obj).hide();}
  $("#add_Upload").on('click',function(){ 
       var cid =$('.images_Upload').each(function(i){ $(this).attr('id',"Uimages_Upload_"+i)});
       addSpot(this, spotMax, cid);
  });
});
function addSpot(obj, sm ,sid) {
	  $("#Upload").append("<div class='images_Upload clearfix margin-bottom' id='"+sid+"'>"+
	  "<span class='Upload_img'><input name='' type='file' /></span>"+
	  "<a href='javascript:ovid()' class='operating delete_Upload'><i class='fa fa-remove'></i></a>"+
	  "<a href='javascript:ovid()' class='operating' onclick='preview_img(this.id)'><i class='fa  fa-image'></i></a>"+
	  "</div>&nbsp;")  
	.find(".delete_Upload").click(function(){
		if($('div.images_Upload').size()==1){
			layer.msg('请至少保留一张图片!',{icon:0,time:1000});			
			}
			else{
				 $(this).parent().remove();
                 $('#add_Upload').show();
				} 				
				
  });
  if($('.delete_Upload').size() >= sm) {$(obj).hide();layer.msg('当前为最大图片添加量!',{icon:0,time:1000});}}
 /*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Date_selection ').css('display','block');
		}
	else{
		
		 $('.Date_selection').css('display','none');
		}	
	});
function add_category(){
	 $(".add_category_style").toggle();
	
	}
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
	touchbehavior:false,  
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

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
<title>修改房间</title>
</head>

<body>
<div class="margin inside_pages clearfix">
<div class="add_style clearfix relative">
<form method="post"  action="updateHouse_phb.do"  > 
<div class="add_style clearfix relative">
  <!--品牌展示 当通过品牌管理添加房间是显示该-->
 <!--  <div class="Brand_title">
  	 <div class="Brand_img"><img src="product_img/logo/458.jpg"><h3>卡姿兰</h3></div>
  </div> -->
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>房间名称：&nbsp;&nbsp;</label>
  <div class="Add_content col-xs-11">
  <input name="name" type="text"  class="col-xs-6" value="${house.name }" readonly="readonly"/>
  <input type="hidden" name="id" value="${house.id }">
  </div>
  </li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>房间预订数：&nbsp;&nbsp;</label>
  <div class="Add_content col-xs-11">
  <input name="onum" type="text"  class="col-xs-6" value="${house.onum }" />
  </div>
  </li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>房间位置：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="addr" type="text"  value="${house.addr }" class="col-xs-4"/></div></li> 
 <!--   <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>关&nbsp;键&nbsp;字：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="" type="text" class="col-xs-4"/><em class="Prompt"> 请用","分隔关键字</em></div></li>-->
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>分类：&nbsp;&nbsp;</label><div class="Add_content col-xs-11">
     	<select name="bid" class="input w50" >
        <c:forEach items="${adlist }" var="ad">
        <c:if test="${ad.id==house.bid }">
        <option value="${ad.id }">${ad.name }</option>
        </c:if>
      <%--   <option value="${ad.id }">${ad.name }</option> --%>
          </c:forEach>
        </select>
   		</div>
     </li>
  
     <li class="clearfix">
    <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>价格：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
   <input name="price" type="text" value="${house.price }" class="col-xs-7" readonly="readonly"/><em class="Prompt">元</em>
    </div>   
    </div>
    <div class="col-xs-4">
    <label class="label_name col-xs-3"><i>*</i>人数：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
   <input name="unum" type="text" value="${house.unum }" class="col-xs-7" readonly="readonly"/><em class="Prompt">人</em>
    </div>   
    </div>
    </li>
    
    <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>面积：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="area" type="text" value="${house.area }"  class="col-xs-7" readonly="readonly"/><em class="Prompt">㎡</em>
    </div>   
    </div>
    </li>
   <li class="clearfix">
      <div class="col-xs-4">
     <label class="label_name col-xs-3"><i>*</i>房间数：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <input name="fjnum" type="text"  class="col-xs-7" value="${house.fjnum }" readonly="readonly"/>
    </div>   
    </div>
    </li>
  	<li class="clearfix"><label class="label_name col-xs-1"><i>*</i>房间简介：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11">
     ${house.jianjie }
     </div>
     </li> 
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>内容介绍：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11">
     	${house.note }
     <!-- <script id="editor" type="text/plain" style="width:100%;height:500px;"></script> --></div>
     </li>  
 </ul>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue" type="submit">保存</button>
   <!--  <button class="btn button_btn bg-orange" type="button">保存草稿</button>
    <button class="btn button_btn bg-gray" type="button">取消添加</button> -->
 </div>
</div>
</form>
</div>
</div>
<!--复文本编辑框-->
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script>

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
   

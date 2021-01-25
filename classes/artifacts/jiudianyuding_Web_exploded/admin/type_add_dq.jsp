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
<title>添加房间分类</title>

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	function checkName() {
		var name = $("#name").val();
		if(name==""||(name.length<1||name.length>12)){
			 $("#checku").html("名称不能为空且长度在1～12位之间！");
			 $("input[id=name]").focus();
		} else {
			$("#checku").html("");
			$.ajax({
				url : "addBtype_dq.do",
				type : "post",
				data : "name=" + name,
				dataType : "json",
				success:function(result){
				if(result.info=="ok"){
				$("#checku").html("名称存在，请更换！");
				return false;
				}else{
				$("#checku").html("添加成功！");
				return true;
				}
				},
				error:function(){
				alert("请求失败！");
				return false;
				}

			});
		}

	}
	</script>
</head>

<body>
<div class="margin inside_pages clearfix">
<form method="post"  action="" > 
<div class="add_style clearfix relative">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>地区：&nbsp;&nbsp;</label><div class="Add_content col-xs-11">
  <input name="name" id="name" data-validate="required:请输入地区" onblur="return checkName();"  type="text"  class="col-xs-6"/></div>
  <div class="tips" id="checku"></div>
  </li>
  </ul>
 <div class="Button_operation btn_width">
    <!-- <button class="btn button_btn bg-deep-blue" type="submit">保存</button> -->
 </div>
</div>
</form>
</div>
</body>
</html>
   

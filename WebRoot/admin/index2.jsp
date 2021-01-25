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
<link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css" rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script> 
<title>后台首页</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script type="text/javascript" src="js/PIE/PIE_IE678.js"></script>
 <![endif]-->
<body>
 <div class="Sellerber" id="Sellerber">
 <!--顶部-->
  <div class="Sellerber_header apex clearfix" id="Sellerber_header">
   <div class="l_f logo header"><a href="<%=basePath%>" target="_blank"><!-- <img src="images/logo2.png" /> --></a></div>
   <div class="r_f Columns_top clearfix header">
     <div class="administrator l_f"><!--  images/avatar.png -->
      <img src="../upload/${sessionScope.auser.img }"  width="36px"/><span class="user-info">欢迎你,${sessionScope.auser.utype }</span><i class="glyph-icon fa  fa-caret-down"></i>${sessionScope.auser.uname }
       <ul class="dropdown-menu">
        <li><a href="showUserInfo.do"><i class="fa fa-user"></i>个人信息</a></li>
        <!-- <li><a href="#"><i class="fa fa-cog"></i>系统设置</a></li> -->
        <li><a href="javascript:void(0)" id="Exit_system"><i class="fa fa-user-times"></i>退出</a></li>
       </ul>
     </div> 
   </div>
  </div>
<!--左侧-->
  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
    <div class="menu_style" id="menu_style">
    <div class="list_content">
    <!--栏目切换-->
    <div class="switch_style">
    	<em class="fa fa-th-large switch"></em>
    	<em class="fa fa-list switch_unfold"></em>
    </div>
    <div class="skin_select clearfix">
      <ul class="dropdown-menu dropdown-caret clearfix">
         <li><a class="colorpick-btn selected" href="javascript:void(0)" data-val="default"  id="default" style="background-color:#222A2D" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="blue" style="background-color:#438EB9;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="green" style="background-color:#72B63F;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="gray" style="background-color:#41a2ff;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="red" style="background-color:#FF6868;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="purple" style="background-color:#6F036B;" ></a></li>
        </ul>     
     </div>
     <!--左侧菜单栏目-->  
     <div class="column_list" >
		 <ul class="menuUl menu_list" id="column_list"> 	
		 </ul>
	 </div> 
    </div>
  </div>
 </div>
<!--内容-->
  <div class="Sellerber_content" id="contents">
    <div class="breadcrumbs" id="breadcrumbs">
       <a id="js-tabNav-prev" class="radius btn-default left_roll" href="javascript:;"><i class="fa fa-backward"></i></a>
       <div class="breadcrumb_style clearfix">
	     <ul class="breadcrumb clearfix" id="min_title_list">
          <li class="active home"><span title="我的桌面" data-href="info.jsp"><i class="fa fa-home home-icon"></i>首页</span></li>
         </ul>
      </div>
       <a id="js-tabNav-next" class="radius btn-default right_roll" href="javascript:;"><i class="fa fa-forward"></i></a>
       <div class="btn-group radius roll-right">
		 <a class="dropdown tabClose" data-toggle="dropdown" aria-expanded="false">页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i></a>
			<ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
				<li><a class="tabReload" href="javascript:void(0);">刷新当前</a></li>
				<li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li>
				<li><a class="tabCloseAll" href="javascript:void(0);">全部关闭(首页)</a></li>
				<li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a></li>
			</ul>
		</div>
		<a href="javascript:void()" class="radius roll-right fullscreen"><i class="fa fa-arrows-alt"></i></a>
    </div>
  <!--具体内容-->  
  <div id="iframe_box" class="iframe_content">
  <div class="show_iframe index_home" id="show_iframe">
       <iframe  class="simei_iframe"  src="info.jsp" name="iframepage" data-href="info.jsp"></iframe>
       </div>
      </div>
  </div>
<!--底部-->
  <div class="Sellerber_bottom info" id="bottom">
  <span class="l_f">版权所有：酒店管理系统 <input type="hidden" id="user" value="${sessionScope.auser.utype }"></span>
  </div>
 
 </div>
<!--  <script type="text/javascript" src="js/main.js"></script>  -->
 
 
 <script type="text/javascript">
 var user = $("#user").val();
 if (user == '高级管理员') {
 	// alert(user);
 	var data = [ {
 		id : 1,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-home',
 		name : '系统首页',
 	}, {
 		id : 10,
 		pid : 1,
 		icon : 'fa fa-angle-double-right',
 		url : 'info.jsp',
 		name : '首页',
 	}, {
 		id : 2,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-desktop',
 		name : '房间管理',
 	}, {
 		id : 21,
 		pid : 2,
 		icon : 'fa fa-angle-double-right',
 		url : 'doAddHouse.do',
 		name : '添加房间',
 	}, {
 		id : 22,
 		pid : 2,
 		icon : 'fa fa-angle-double-right',
 		url : 'HouseList.do',
 		name : '房间列表',
 	}, {
 		id : 23,
 		pid : 2,
 		icon : 'fa fa-angle-double-right',
 		url : 'fBtypeList.do',
 		name : '房间分类管理',
 	},
 	 {
 		id : 24,
 		pid : 2,
 		icon : 'fa fa-angle-double-right',
 		url : 'fBtypeList_dq.do',
 		name : '地区管理',
 	},
        {
            id : 4,
            pid : 0,
            url : "#",
            icon : 'fa fa-desktop',
            name : '菜品管理',
        }, {
            id : 41,
            pid : 4,
            icon : 'fa fa-angle-double-right',
            url : 'doAddGoods.do',
            name : '添加菜品',
        }, {
            id : 42,
            pid : 4,
            icon : 'fa fa-angle-double-right',
            url : 'GoodsList.do',
            name : '菜品列表',
        }, {
            id : 43,
            pid : 4,
            icon : 'fa fa-angle-double-right',
            url : 'fFtypeList.do',
            name : '菜品分类管理',
        },
        {
            id : 44,
            pid : 4,
            icon : 'fa fa-angle-double-right',
            url : 'GoodsList_jf.do',
            name : '礼品管理',
        },
        {
 		id : 3,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-database',
 		name : '订单管理',
 	}, {
 		id : 31,
 		pid : 3,
 		icon : 'fa fa-angle-double-right',
 		url : 'orderList.do',
 		name : '房间订单管理',
 	}, {
            id : 32,
            pid : 3,
            icon : 'fa fa-angle-double-right',
            url : 'orderList_cp.do',
            name : '菜品订单管理',
        },   {
            id : 33,
            pid : 3,
            icon : 'fa fa-angle-double-right',
            url : 'order_list_tj.jsp',
            name : '房间统计分析',
        },   {
            id : 34,
            pid : 3,
            icon : 'fa fa-angle-double-right',
            url : 'order_list_tj_cp.jsp',
            name : '菜品统计分析',
        }, {
 		id : 5,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-cogs',
 		name : '个人信息管理',
 	}, {
 		id : 51,
 		pid : 5,
 		icon : 'fa fa-angle-double-right',
 		url : 'showUserInfo.do',
 		name : '个人信息管理',
 	}, {
            id : 6,
            pid : 0,
            url : "#",
            icon : 'fa fa-cogs',
            name : '系统日志管理',
        }, {
            id : 61,
            pid : 6,
            icon : 'fa fa-angle-double-right',
            url : 'sysLogList.do',
            name : '日志管理',
        },  {
 		id : 8,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-user',
 		name : '用户管理',
 	}, {
 		id : 81,
 		pid : 8,
 		icon : 'fa fa-angle-double-right',
 		url : 'userList_qy.do',
 		name : '普通管理员列表',
 	}, {
 		id : 82,
 		pid : 8,
 		icon : 'fa fa-angle-double-right',
 		url : 'userList.do',
 		name : '会员列表',
 	}, {
 		id : 7,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-file-photo-o',
 		name : '公告管理',
 	}, {
 		id : 71,
 		pid : 7,
 		icon : 'fa fa-angle-double-right',
 		url : 'newsList.do',
 		name : '公告列表',
 	},{
 		id : 9,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-file-photo-o',
 		name : '用户投诉反馈管理',
 	}, {
 		id : 91,
 		pid : 9,
 		icon : 'fa fa-angle-double-right',
 		url : 'bbsList.do',
 		name : '投诉反馈列表',
 	}, {
 		id : 92,
 		pid : 9,
 		icon : 'fa fa-angle-double-right',
 		url : 'bbsList_dc.do',
 		name : '用户订餐列表',
 	},

 	]

 } else if (user == '普通管理员') {

 	var data = [ {
 		id : 1,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-home',
 		name : '系统首页',
 	}, {
 		id : 10,
 		pid : 1,
 		icon : 'fa fa-angle-double-right',
 		url : 'info.jsp',
 		name : '首页',
 	}, {
 		id : 2,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-desktop',
 		name : '个人信息管理',
 	},
 	{
 		id : 22,
 		pid : 2,
 		icon : 'fa fa-angle-double-right',
 		url : 'showUserInfo.do',
 		name : '个人基本信息',
 	}, {
 		id : 3,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-desktop',
 		name : '房间信息',
 	}, {
 		id : 31,
 		pid : 3,
 		icon : 'fa fa-angle-double-right',
 		url : 'doAddHouse.do',
 		name : '添加房间',
 	},{
 		id : 32,
 		pid : 3,
 		icon : 'fa fa-angle-double-right',
 		url : 'HouseList.do',
 		name : '房间列表',
 	}, {
 		id : 5,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-credit-card',
 		name : '公告管理',
 	}, {
 		id : 51,
 		pid : 5,
 		icon : 'fa fa-angle-double-right',
 		url : 'newsList.do',
 		name : '公告列表',
 	}, {
 		id : 6,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-database',
 		name : '订单管理',
 	}, {
 		id : 61,
 		pid : 6,
 		icon : 'fa fa-angle-double-right',
 		url : 'orderList.do',
 		name : '订单管理',
 	},{
 		id : 9,
 		pid : 0,
 		url : "#",
 		icon : 'fa fa-file-photo-o',
 		name : '用户投诉反馈管理',
 	}, {
 		id : 91,
 		pid : 9,
 		icon : 'fa fa-angle-double-right',
 		url : 'bbsList.do',
 		name : '投诉反馈列表',
 	}, {
 		id : 92,
 		pid : 9,
 		icon : 'fa fa-angle-double-right',
 		url : 'bbsList_dc.do',
 		name : '用户订餐列表',
 	}, ]
 }

//设置框架
 $(function() {  		 
	 $("#Sellerber").frame({
		float : 'left',//设置菜单栏目方向属性
		minStatue:true,//切换模式
		hheight:70,//设置顶部高度 高度为0时自动样式切换（达到另外一种界面效果）
		bheight:30,//设置底部高度
		mwidth:200,//菜单栏宽度（最好不要改动该数值，一般200的宽度值最好）
		switchwidth:50,//切换菜单栏目宽度
		color_btn:'.skin_select',//设置颜色
		menu_nav:'.menu_list',//设置栏目属性
		column_list:'.column_list',//设置栏目名称
		time:'.date_time',//设置时间属性(不填写不显示)
		/* logo_img:'images/logo2.png',//logo地址链接（当header为0时显示该属性） */
	    Sellerber_content:'.Sellerber_content',//右侧名称
		Sellerber_menu:'.list_content', //左侧栏目
		header:'.Sellerber_header',//顶部栏目	
		prompt:'.prompt_style',
		prompt_btn:'#promptbtn',//点击事件
		data:data,//数据
		mouIconOpen:"fa fa-angle-down",// 菜单(展开)图标
	    mouIconClose:"fa fa-angle-up" , // 菜单（隐藏）图标
		Rightclick:true//是否禁用右键
	 }); 
});
$('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="loginout.do";  
    });
});
</script>
</body>
</html>



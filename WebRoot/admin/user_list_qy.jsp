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
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="js/proTree.js" ></script>
<title>会员管理</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin" id="page_style">
	<form method="post" action="userList_qyQuery.do" >
   <div class="operation clearfix same_module mb15">
    <ul class="choice_search">
    <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">酒店名称：</label>
     <input placeholder="请输入搜索姓名" name="tname" type="text"  class="form-control col-xs-8 col-lg-8"/></li>
     <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">用户名：</label>
     <input placeholder="请输入搜索用户名" name="uname" type="text"  class="form-control col-xs-8 col-lg-8"/></li>
   
     <li><button class="btn button_btn bg-deep-blue " type="submit"><i class="fa  fa-search"></i>&nbsp;搜索</button></li>
    </ul>
  </div>
  </form>
 <div class="h_products_list clearfix" id="Sellerber">
 
<div class="bkg_List_style list_Exhibition list_show padding15">
 <div class="bkg_List_operation clearfix searchs_style">
  <ul class="bkg_List_Button_operation">
   <li class="btn bg-deep-blue"> <a href="javascript:ovid();" id="member_add" ><i class="icon-plus"></i>添加</a></li><!-- <em class="bkg_List_icon icon_add"></em>
   <li class="btn bg-deep-blue"><a href="javascrpt:void()" class="btn_add"><em class="bkg_List_icon icon_modify"></em>修改用户</a></li>
   <li class="btn btn-Dark-success"><a href="javascrpt:void()" class="btn_add"><em class="bkg_List_icon icon_close"></em>关闭用户</a></li>
  --></ul> 
 </div>
  <div class="datalist_show">
 <div class="bkg_List clearfix datatable_height confirm">
  <table class="table  table_list table_striped table-bordered">
   <thead>
    <tr>
     <!-- <th  width="40"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
     <th>用户名</th>
     <th>密码</th>
     <th>酒店名称</th>
     <th>图片</th>
     <th>电话</th>
     <th>邮箱</th>
     <th>地址</th>
     <th>是否删除</th>
     <th>操作</th>
    </tr>
   </thead>
   <tbody>
    <c:forEach items="${list }" var="u">
        <tr>
        <td>${u.uname }</td>
        <td>${u.pwd }</td>
        <td>${u.tname }</td>
        <td><img alt="" src="../upload/${u.img }" width="50" height="50"></td>
     	<td>${u.tel }</td>
     	<td>${u.email }</td>
     	<td>${u.address }</td>
     	<td>
     	<c:if test="${u.isdel=='1' }">
     	正常
     	</c:if>
     	<c:if test="${u.isdel=='0' }">
     	删除
     	</c:if></td>
     	<%-- <td>${u.pubtime }</td> --%>
        <td class="td-manage">
     <c:if test="${sessionScope.auser.utype=='高级管理员' }">
         <c:if test="${u.status=='待审核' }">
        <a title="通过审核"   href="user_shenHe_tongGuo.do?id=${u.uid }" class="btn btn-xs btn-status" >通过审核</a>
        <a title="通过失败"    href="user_shenHe_buTongGuo.do?id=${u.uid }" class="btn btn-xs btn-delete" >通过失败</a>
        </c:if>
        <c:if test="${u.isdel=='0' }">
        <a title="通过审核"   href="deleteUser_hf.do?id=${u.uid }" class="btn btn-xs btn-status" >恢复</a>
        </c:if>
        <a title="修改"   href="doUpdateUser_qy.do?id=${u.uid }" class="btn btn-xs btn-status" >修改</a>
        <a title="删除"    href="deleteUser_qy.do?id=${u.uid }" class="btn btn-xs btn-delete" >删除</a>
        </c:if>
        </td>
         </tr>
        </c:forEach> 
      <tr>
      <c:if test="${sessionScope.p==1 }">
		<td colspan="12"> 当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；<c:if test="${page.page>1}">
              <a href="userList_qy.do?page=1" >首页</a>
             <a href="userList_qy.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="userList_qy.do?page=${page.page+1 }">下一页</a>
			<a href="userList_qy.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="12">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
    <a href="userList_qyQuery.do?page=1" >首页</a>
    <a href="userList_qyQuery.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="userList_qyQuery.do?page=${page.page+1 }">下一页</a>
			<a href="userList_qyQuery.do?page=${page.totalPage }">末页</a>
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
<!--添加用户图层-->

<form action="addUser_qy.do" method="post" onsubmit="checkAll();">
<div class="add_menber" id="add_menber_style" style="display:none">
  
    <ul class=" page-content">
     <li><label class="label_name">
    	 用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input  name="uname" id="account" placeholder="请输入用户名" type="text"  class="text_add" onblur="checkName()" /></span><div id="checku" class="prompt r_f"></div></li>
     <li><label class="label_name">酒店名称：</label><span class="add_name"><input placeholder="请输入姓名" name="tname" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">密码：</label><span class="add_name"><input placeholder="请输入密码" name="pwd" type="password" id="pwd" class="text_add" onblur="checkPwd();"/></span><div class="prompt r_f" id="checkPwd"></div></li>
     <li><label class="label_name">重复密码：</label><span class="add_name"><input placeholder="请输入确认密码"  type="password" id="pwdc" class="text_add" onblur="checkPwdc();"/></span><div class="prompt r_f" id="checkPwdc"></div></li>
     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="sex" type="radio" checked="checked" class="ace" value="男"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="sex" type="radio" class="ace" value="女"><span class="lbl" >女</span></label>&nbsp;&nbsp;&nbsp;
     </span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电话：</label><span class="add_name"><input placeholder="请输入电话" type="text" name="tel" id="tel" class="text_add" onblur="checkTel();"/></span><div class="prompt r_f" id="checkTel"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input placeholder="请输入邮箱" type="text" name="email" id="email" onblur="checkEmail();" class="text_add"/></span><div class="prompt r_f" id="checkEmail"></div></li>
     <li><label class="label_name">地区：</label><span class="add_name">
     <select name="address">
     <c:forEach items="${tlist }" var="t">
     <option value="${t.name }">${t.name }</option>
      </c:forEach>
     </select>
     </span><div class="prompt r_f" id=""></div></li>
    
    
    <%--  <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li> --%>
     <li><label class="label_name"></label><span class="add_name"><button  class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存</button></span></li>
    </ul>
 </div>
 </form>
 <script type="text/javascript">
	function checkName() {
		var name = $("#account").val();
		if(name==""||(name.length<2||name.length>12)){
			 $("#checku").html("用户账号不能为空且长度在2～12位之间！");
			 $("input[id=uname]").focus();
		} else {
			 $("#checku").html("");
			$.ajax({
				url : "checkUname.do",
				type : "post",
				data:"uname="+name,
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
				  $("#checku").html("用户名存在，请更换！");
				}else{
				  $("#checku").html("可以用");
				}
				},
				error:function(){
				alert("error");
				}
			});
		}

	}
	
	 function checkPwd(){
		  var pwd=$("#pwd").val();
		  if(pwd==""||pwd.length<6||pwd.length>12){
		 $("#checkPwd").html("密码不能为空且长度在6～12位之间！");
		 $("input[id=pwd]").html("");
		  $("input[id=pwd]").focus();
		 return false;
		}else {
		 $("#checkPwd").html("密码格式正确！");
		return true;}
		}

		function checkPwdc(){
		var pwd=$("#pwd").val();
		var pwdc=$("#pwdc").val();
		if(pwdc==""||pwdc!=pwd){
		  $("#checkPwdc").html("两次密码要一致 ！");
		  $("input[id=txtConfirmPwd]");
		   // $("input[name=passwordc]").focus();
		  return false;
		  }else{
		  $("#checkPwdc").html("密码一致 ！");
		  return true;}

		}
		/* 电话号码的验证 */
		 function checkTel(){
		 var tel=$("#tel").val();
		 var regtel=/^(13|14|15|16|17|18|19)\d{9}$/;
		 if(tel==""||!regtel.test(tel)){
		  $("#checkTel").html("电话号码不能为空，且以13，14，15，16，17，18,19开头的11位");
		  $("input[id=tel]").html("");
		   $("input[id=tel]").focus();
		  return false;
		  }else{
		   $("#checkTel").html("电话号码格式正确！");
		  return true;
		  }

		 }
		 /* 身份证号码的验证 */
		 function checkIdnumber(){ 
			  var idnumber=$("#idnumber").val();
			  // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X 
			  var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
			  if(idnumber==""||!reg.test(idnumber)) 
			  { 
				  $("#checkIdnumber").html("身份证输入不合法");
				  $("input[id=idnumber]").html("");
				  $("input[id=idnumber]").focus();
			  		return false;
			  }else{
			  $("#checkIdnumber").html("身份证格式正确！");
			  return true;
			  }} 
		  //邮箱验证
		 function checkEmail(){ 
			  var email=$("#email").val();	
			  var reg =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; 
			  if(email==""||!reg.test(email)){
			  $("#checkEmail").html("邮箱格式不正确！");
			  $("input[id=email]").html("");
			   $("input[id=email]").focus();
			  return false;
			  }else{
			  $("#checkEmail").html("邮箱格式正确！");
			  return true;
			  }} 

	function checkAll(){
		//alert("kkkkk");
		var flag=false;
		var aa = $("#uname").val();
		var pwd=$("#pwd").val();
		var pwdc=$("#pwdc").val();
		var tel=$("#tel").val();
		var name1=$("#txtName1").val();
		var name2=$("#txtName2").val();
		 var regtel=/^(13|14|15|16|17|18|19)\d{9}$/;
		 if(aa!=""&&(tel!=""||regtel.test(tel))&&(name1!=""||name1.length>2)&&(name2!=""||name2.length>2)&&
				 (pwd!=""||pwd.length>6||pwd.length<12)&&(pwdc!=""||pwdc==pwd)){
			 flag=true;
		 }else{
			 alert("注册信息不完整或不合规范！");
			 flag=false;
		 }
		
		return flag;
		
	}
</script>
 <script>
 /*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		//btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
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
        	  return true;
			  /* layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  }); */
			   layer.close(index);	
		  }		  		     				
		}
    });
});
	//设置内页框架布局
/* $(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:200,//菜单栏宽度
		
	});
}); */
	
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
function userinfo(id){
	 layer.open({
        type: 1,
        title: '用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['600px' , ''],
        content:$('#userinfo_style'),
	 })
 /*用户-查看*/
 function member_show(title,url,id,w,h){
 	layer_show(title,url+'#?='+id,w,h);
 }			}
/*用户-编辑*/
function member_edit(id){
	  layer.open({
        type: 1,
        title: '修改用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
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


/********************列表操作js******************/
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
});
</script>
 
</body>
</html>


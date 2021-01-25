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
	<form method="post" action="userListQuery.do" >
   <div class="operation clearfix same_module mb15">
    <ul class="choice_search">
     <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">会员名称：</label>
     <input placeholder="请输入搜索用户名" name="uname" type="text"  class="form-control col-xs-8 col-lg-8"/></li>
     <li class="clearfix col-xs-3 col-lg-3 col-ms-3 "><label class="label_name ">姓名：</label>
     <input placeholder="请输入搜索姓名" name="tname" type="text"  class="form-control col-xs-8 col-lg-8"/></li>
      <!-- <li class="clearfix col-xs-4 col-lg-5 col-ms-5 "><label class="label_name ">注册时间：</label> 
     <input class="laydate-icon col-xs-4 col-lg-3" id="start" style=" margin-right:10px; height:28px; line-height:28px; float:left">
      <span  style=" float:left; padding:0px 10px; line-height:32px;">至</span>
      <input class="laydate-icon col-xs-4 col-lg-3" id="end" style="height:28px; line-height:28px; float:left"></li> -->
     <li><button class="btn button_btn bg-deep-blue " type="submit" ><i class="fa  fa-search"></i>&nbsp;搜索</button></li>
    </ul>
  </div>
  </form>
 <div class="h_products_list clearfix" id="Sellerber">

<div class="bkg_List_style list_Exhibition list_show padding15">

  <div class="datalist_show">
 <div class="bkg_List clearfix datatable_height confirm">
  <table class="table  table_list table_striped table-bordered">
   <thead>
    <tr>
     <!-- <th  width="40"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
     <th>用户名</th>
     <th>密码</th>
     <th>真实姓名</th>
     <th>性别</th>
     <th>电话</th>
     <th>邮箱</th>
     <th>地址</th>
     <th>加入时间</th>
     <th>角色</th>
     <!-- <th>状态</th> -->
     <th>操作</th>
    </tr>
   </thead>
   <tbody>
    <c:forEach items="${list }" var="u">
        <tr>
        <td>${u.uname }</td>
        <td>${u.pwd }</td>
        <td>${u.tname }</td>
     <!-- <td><a href="javascript:" onClick="userinfo(this,121)">张明珠</a></td> -->
     	<td>${u.sex }</td>
     	<td>${u.tel }</td>
     	<td>${u.email }</td>
     	<td>${u.address }</td>
     	<td>${u.pubtime }</td>
     	<td>${u.utype }</td>
     	<%-- <td>${u.pubtime }</td> --%>
        <td class="td-manage">
      <%--   <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">停用</a>  --%>
        <%-- <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;" href="doUpdateUser.do?id=${u.uid }"  class="btn btn-xs btn-info" >编辑</a>  --%>
        <c:if test="${u.utype!='高级管理员' }">
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" href="deleteUser.do?id=${u.uid }" class="btn btn-xs btn-delete" >删除</a>
        </c:if>
        </td>
          </tr>
        </c:forEach> 
      <tr>
      <c:if test="${sessionScope.p==1 }">
		<td colspan="12"> 当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；<c:if test="${page.page>1}">
              <a href="userList.do?page=1" >首页</a>
             <a href="userList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="userList.do?page=${page.page+1 }">下一页</a>
			<a href="userList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="12">当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录； <c:if test="${page.page>1}">
    <a href="userListQuery.do?page=1" >首页</a>
    <a href="userListQuery.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="userListQuery.do?page=${page.page+1 }">下一页</a>
			<a href="userListQuery.do?page=${page.totalPage }">末页</a>
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

<form action="addUser" method="post" onsubmit="checkAll();">
<div class="add_menber" id="add_menber_style" style="display:none">
  
    <ul class=" page-content">
     <li><label class="label_name">
   		<input type="hidden" name="utype" value="会员">  
    	 用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input  name="user.account" id="account" placeholder="请输入用户名" type="text"  class="text_add" onblur="checkName()" /></span><div id="checku" class="prompt r_f"></div></li>
     <li><label class="label_name">真实姓名：</label><span class="add_name"><input placeholder="请输入真实姓名" name="user.name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">密码：</label><span class="add_name"><input placeholder="请输入密码" name="user.pwd" type="password" id="pwd" class="text_add" onblur="checkPwd();"/></span><div class="prompt r_f" id="checkPwd"></div></li>
     <li><label class="label_name">重复密码：</label><span class="add_name"><input placeholder="请输入确认密码"  type="password" id="pwdc" class="text_add" onblur="checkPwdc();"/></span><div class="prompt r_f" id="checkPwdc"></div></li>
     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="user.sex" type="radio" checked="checked" class="ace" value="男"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="user.sex" type="radio" class="ace" value="女"><span class="lbl" >女</span></label>&nbsp;&nbsp;&nbsp;
     </span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电话：</label><span class="add_name"><input placeholder="请输入电话" type="text" name="tel" id="tel" class="text_add" onblur="checkTel();"/></span><div class="prompt r_f" id="checkTel"></div></li>
     <li><label class="label_name">地址：</label><span class="add_name"><input placeholder="请输入地址" type="text"  class="text_add" id="idnumber" name="address" /></span><div id="checkIdnumber" class="prompt r_f"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input placeholder="请输入邮箱" type="text" name="user.email" id="email" onblur="checkEmail();" class="text_add"/></span><div class="prompt r_f" id="checkEmail"></div></li>
    
    
    <%--  <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li> --%>
     <li><label class="label_name"></label><span class="add_name"><button  class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存</button></span></li>
    </ul>
 </div>
 </form>
 
 <script>
 //显示添加用户
 function addUser(){
	 alert("add");
	 $("#add_menber_style").style.display="block";
 }
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
	//后台传入的 标题列表


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
				}
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


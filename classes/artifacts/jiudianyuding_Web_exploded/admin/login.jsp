<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/public.js" type="text/javascript"></script>
<title>用户登录</title>
</head>
<script type="text/javascript">
function checkCode11(){
 	  //alert("ddd");
 	  var incode=$("#imgCode").val();
 	 // alert(incode);
 	  if(incode==""){
 	    $("#checkcode22").html("验证码不能为空！");
 	     $("input[id=imgCode]").focus();
 	  }else{
 	  $.ajax({
 	  url:"checkCode.do",
 	  type:"post",
 	  data:"code="+incode,
 	  dataType:"json",
 	  success:function(result){
 	  msga=result.res;
 	 // alert(msga);
 	    if(msga=="ok"){
 	    	
 	    $("#checkcode22").html("验证码正确！");
 	   return true;
 	    }else{
 	  	//alert("验证码不正确！请重新输入！");
 	    $("#checkcode22").html("验证码不正确！请重新输入！");
 	  // $("input[id=imgCode]").focus();
 	    return false;
 	    }
 	  },
 	  error:function(){
 	    alert("请求失败！");
 	  }
 	  })
 	  }
 	  }


//页面加载刷新图片验证码  
$("#img").click();  
//生成图片验证码  
function changeValidateCode(obj) {  
    //获取当前的时间作为参数，无具体意义     
    var timenow = new Date().getTime();  
   // alert("dddimg");
    //每次请求需要一个不同的参数，否则可能会返回同样的验证码     
    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。     
    obj.src = "autoCode.img?d=" + timenow;
<%--      <%
    String img=(String)session.getAttribute("autoCode");%>
    <%session.removeAttribute("autoCode");%> --%>
   return obj.src;
}  

</script>
<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎来到酒店预定系统后台管理界面平台</span>    
    <ul>
    <!-- <li><a href="#">返回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li> -->
    </ul>    
    </div>
    <div class="loginbody">
<div class="login-container"><!-- images/logo.png -->
	<div class="center"> <img src="images/logo2.png" /></div>
							<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box widget-box no-border visible">				
                                  <div class="login-main">
                                  <div class="clearfix">
                                  <div class="login_icon"><img src="images/login_img.png" /></div>
								 <form class=""  action="alogin.do" method="post" style=" width:300px; float:right; margin-right:50px;">
                                    <h4 class="title_name"><img src="images/login_title.png" /></h4>
										<fieldset>
										<ul>
								   <li class="frame_style form_error"><label class="user_icon"></label><input name="uname" type="text" data-name="用户名" id="username"/><i>用户名</i></li>
								   <li class="frame_style form_error"><label class="password_icon"></label><input name="pwd" type="password"   data-name="密码" id="userpwd"/><i>密码</i></li>
								   <li class="frame_style form_error"><label class="password_icon"></label>
								   <select name="utype">
								   	<option value="普通管理员">普通管理员</option>
								   	<option value="高级管理员">高级管理员</option>
								   </select>
								  </li>
								  
								  
								  
								  <!--  <li class="frame_style form_error"><label class="Codes_icon"></label>
								   <input type="text" class="input input-big" name="imgCode" id="imgCode" placeholder="验证码(忽略大小写)" data-validate="required:验证码(忽略大小写)"  onblur="checkCode11()"/>
								   <div class="Codes_region">
								   <img id="img" src="autoCode.img"  width="100%" height="38px" name="randImage"  onclick="changeValidateCode(this)"/>
								   </div></li>  -->
								  <!--  <li><div id="checkcode22"></div></li>  -->
								  </ul>
								    <div class="space"></div>
                              <div class="clearfix">
                                 <!--  <label class="inline">
                                      <input type="checkbox" class="ace">
                                      <span class="lbl">保存密码</span>
                                  </label> -->

                                 
                                 <!--  <button type="button" class="login_btn"  onclick="window.location.href='user_reg.jsp'"> 注&nbsp;册 </button> -->
                               		<button type="submit" class="login_btn" id="login_btn"> 登&nbsp;陆 </button>
                              </div>

                              <div class="space-4"></div>
                          </fieldset>
                      </form>
</div>
                      <div class="social-or-login center">
                          <span class="bigger-110">通知</span>
                      </div>

                      <div class="social-login ">
                      为了更好的体验性，本网站系统不再对IE8（含IE8）以下浏览器支持，请见谅。
                      </div>
                  </div><!-- /login-main -->

          
          <!-- /widget-body -->
          </div><!-- /login-box -->
      </div><!-- /position-relative -->
  </div>
 </div>
                        <div class="loginbm">版权所有  2020  酒店预定系统 <a href=""></a> </div><strong></strong>

<script type="text/javascript">
$('#login_btn').on('click', function(){
	     var num=0;
		 var str="";
     $("input[type$='text'],input[type$='password']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("data-name")+"请输入验证码!",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('登陆成功！',{
               title: '提示框',				
			   icon:1,		
			  });
	          location.href="shops_index.html";
			   layer.close(index);	
		  }		  		     								
	});
  $(document).ready(function(){
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
	});
 })
</script>
</body>
</html>

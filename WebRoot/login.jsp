<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>

<!--登录版块-->
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
 	  url:"checkCodeF.do",
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
    obj.src = "admin/autoCode.img?d=" + timenow;
<%--      <%
    String img=(String)session.getAttribute("autoCode");%>
    <%session.removeAttribute("autoCode");%> --%>
   return obj.src;
}  

</script>
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">登陆</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">登陆</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- Booking style-->
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>登陆</h2>
             <h3>deng lu</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-8">
         <form action="login.do" method="post">
         <div class="book-left-content input_form">
         
         <!--  <form action="sendemail.php" method="post" id="contactForm">   -->       
           <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>用户名：</span>
               <input type="text" class="form-control" id="name" name="uname" placeholder="请输入用户名"></div>   
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span>密码：</span>
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入密码"></div>
            </div> 
           <!--   <div class="row"> 
             <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span   >验证码：</span>
                <input type="text" class="input input-big" name="imgCode" id="imgCode" placeholder="验证码(忽略大小写)" data-validate="required:验证码(忽略大小写)"  onblur="checkCode11()"/>
                <div class="Codes_region" style="  width: 79px; height: 38px; margin-top: -28px;margin-left: 165px;">
				<img id="img" src="admin/autoCode.img"  width="100%" height="38px" name="randImage"  onclick="changeValidateCode(this)"/>
			   </div> 
               </div>
            </div>  -->
            <div id="checkcode22" style="color:#f00;"></div>
             <!-- <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span>忘记密码？</span>
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入密码"></div>
            </div>  -->
           <!--  <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <span>Subject</span>
                       <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
                    </div>
            </div> -->
              
            <!-- <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <span>Message</span>
                       <textarea class="form-control" rows="6" id="message" name="message" placeholder="Message"></textarea>
                    </div>
              </div> -->
              <div class="row" style="margin-top:20px;">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <button type="submit" class="res-btn">登陆</button>
                  <button type="button" class="res-btn" onclick="window.location.href='loss_pwd.jsp'">忘记密码?</button>
                  </div>
              </div>
              </div>
          </form>
          </div>
         </div>
     <!--  <div class="col-md-4">
         
          <div class="contact-info">
          
          <h2>Contact Info</h2>
          
           <div class="media-contact clearfix">
                            <div class="media-contact-icon">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                            </div>
                            <div class="media-contact-info">
                              <p>Lake Resort, Lorance 542B, Tailstoi Town 5248 MT, Wordwide Country</p>
                            </div>
              </div>   
            <div class="media-contact clearfix">
                            <div class="media-contact-icon">
                                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                            </div>
                            <div class="media-contact-info">
                              <p>
                                        <a href="mailto:Info@Resorthotel.Com">Info@Resorthotel.Com</a><br>
                                        <a href="mailto:support@Resorthotel.Com">support@Resorthotel.Com</a>
                                    </p>
                            </div>
              </div> 
              
              <div class="media-contact clearfix">
                            <div class="media-contact-icon">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                            </div>
                            <div class="media-contact-info">
                              <p>Monday to Friday : 8.00am to 5.00 pm<br>
                                  Saturday : 8.00am to 3.00 pm<br>
                                  Sunday : <span>closed</span>
                                        
                                    </p>
                            </div>
              </div> 
              
              <div class="media-contact clearfix">
                            <div class="media-contact-icon">
                                <i class="icon icon-Timer" aria-hidden="true"></i>
                            </div>
                            <div class="media-contact-info">
                              <p>
                                  <a href="tel:18005622487"><i>+ 1800 562 2487</i></a><br>
                                  <a href="tel:32155468975"><i>+ 3215 546 8975</i></a>
                                    </p>
                            </div>
              </div> 
              
          </div>
          
          
         
         </div>  --> 
      
      </div>
    
    </section> 
    
<!-- Booking style-->
    

   
  <!-- TT-CONTACT-MAP -->
            <div class="tt-contact-map map-block" id="map-canvas"  data-lat="51.477254" data-lng="-0.026888" data-zoom="14"></div>
            <div class="addresses-block">
                <a data-lat="51.477254" data-marker="images/marker.png" data-lng="-0.026888" data-string="1. Here is some address or email or phone or something else..."></a>                 
            </div>

    
  
  
 <!-- Welcome banner  style-->
<!-- <div class="nasir-subscribe-form-row row">
	<div class="container">
		<div class="row this-dashed">
			<div class="this-texts">
				<h2>STAY TUNED WITH US</h2>
				<h3>Get our updated offers, discounts, events and much more!</h3>
			</div>
			<form class="this-form input-group" action="#" method="post">
				<input type="email" class="form-control" placeholder="Enter your email address">
				<span class="input-group-addon">
					<button type="submit" class="res-btn">subscribe<i class="fa fa-arrow-right"></i></button>
				</span>
			</form>
		</div>
	</div>
</div> -->
    
 <!-- Welcome banner  style-->



<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

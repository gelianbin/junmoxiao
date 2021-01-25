<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript" src="js/regist.js"></script>
<!--登录版块-->
 
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">新用户注册</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">注册</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- Booking style-->
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>新用户注册</h2>
             <h3>Pick a room that best suits your taste and budget</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-8">
         
         <div class="book-left-content input_form">
         <form method="post" action="reg.do" onsubmit="return check();">
         <!--  <form action="sendemail.php" method="post" id="contactForm">   -->       
           <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>用户名：</span>
               <input type="text" class="form-control"  name="uname" placeholder="请输入用户名" id="username" onblur="return checkuname()"/>
               <span id='checku' class="spanInit" ></span>
            </div>   
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>真实姓名：</span>
               <input type="text" class="form-control" id="name" name="tname" placeholder="请输入用户名" id="" onblur="return checkuname2()"/>
               <span id='checku2' class="spanInit" ></span>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span>密码：</span>
                <input type="password" class="form-control" id="txtPwd"  onblur="return checkpwd()" name="pwd" placeholder="请输入密码">
            	<span id='prompt_pwd'  class="spanInit" ></span>
            </div>  
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span>确认密码：</span>
                <input type="password" class="form-control" id="txtConfirmPwd" onblur="return checkpwdc()" name="pwdc" placeholder="请再次输入密码"></div>
            	<span id='prompt_confirmpwd' class="spanInit"  ></span>
           </div> 
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>性 别：</span>
                <input name="sex" type="radio" id="radio" value="男" checked="checked" />
      			  男 <input type="radio" name="sex" id="radio2" value="女" /> 女
      </div>
     
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>手机号码：</span>
        <input name="tel" type="text" class="form-control" id="txtPhone" onblur="return checktel()" />
        <span id='prompt_phone' class="spanInit" ></span></div>
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
        	<span>生日：</span>
        <input name="age" type="text" class="form-control"  onblur="return checktel4()"/>
        <span id='' class="spanInit" ></span>
       </div>
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>电子邮箱：</span>
       		<input name="email" type="text" class="form-control" id="" />
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>所在地区：</span>
       		<input name="address" type="text" class="form-control" id="" />
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>身份证号：</span>
       		<input name="idnumber" type="text" class="form-control" id="" />
      </div>
    <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>预留问题：</span>
       		<input name="mbanswer" type="text" class="form-control" id="txtName1" onblur="return checkname1()" />
      </div>
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>问题答案 ：</span>
       		<input name="question" type="text" class="form-control" id="txtName2" onblur="return checkname2()" />
      </div>
      <!-- <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>充值金额：</span>
       		<input name="money" type="number" class="form-control" value="0.0" id="txtName2" min="0.0" readonly="readonly"/>
      </div> -->
    <!-- <li class="m">预留问题 </li>
      <li class="r"><input name="mbanswer" type="text" class="box txtInit" id="txtName1" onblur="return checkname1()"/>
        <span id='prompt_name1' class="spanInit"  ></span> </li>
    <li class="m">问题答案 </li>
      <li class="r"><input name="question" type="text" class="box txtInit" id="txtName2" onblur="return checkname2()"/>
        <span id='prompt_name2' class="spanInit"  ></span> </li> -->
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
              <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><button type="submit" class="res-btn">注册</button>
                  </div>
              </div>
          </form>
             <div id="success"><p>Your message sent successfully.</p></div>
             <div id="error"><p>Something is wrong. Message cant be sent!</p></div>
          </div>
         
         
         </div>
     
      </div>
    
    </section> 
    
<!-- Booking style-->
    

   
  <!-- TT-CONTACT-MAP -->
            <div class="tt-contact-map map-block" id="map-canvas"  data-lat="51.477254" data-lng="-0.026888" data-zoom="14"></div>
            <div class="addresses-block">
                <a data-lat="51.477254" data-marker="images/marker.png" data-lng="-0.026888" data-string="1. Here is some address or email or phone or something else..."></a>                 
            </div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>


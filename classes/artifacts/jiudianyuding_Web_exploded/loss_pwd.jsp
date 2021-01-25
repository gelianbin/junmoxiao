<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript" src="js/checkMibao.js"></script>

 
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">忘记密码</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">忘记密码</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- Booking style-->
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>忘记密码</h2>
             <h3>wang ji mi ma</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-8">
         
         <div class="book-left-content input_form">
         <form method="post" action="" onsubmit="return check2();" enctype="multipart/form-data">
         <!--  <form action="sendemail.php" method="post" id="contactForm">   -->       
           <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>输入用户名：</span>
               <input type="text" class="input-text" name="uname" id="username"  onblur="return checkuname()"  />
          		<div id='checku' class="tips"></div>
          </div>   
          <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12" id="mibao1" style="display:none;">
               <span>密保问题：</span>
                <input type="text" class="input-text" id="mbanswer"  />
		  		<input type="hidden"  id="mbquestion"  />
          </div>
          <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12" id="mibao2" style="display:none;">
               <span>密保答案：</span>
              <input type="text" class="input-text"   id="txtquestion"  onblur="return checkMiBao()"/>
		 		<div  id='prompt_question' class="tips"></div>
          </div>
            
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12" >
               <span></span>
          </div>
              <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><button type="button" class="res-btn" onClick="window.location.href='login.jsp'">返回登陆</button>
                </div>
              </div>
              </div>
          </form>
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
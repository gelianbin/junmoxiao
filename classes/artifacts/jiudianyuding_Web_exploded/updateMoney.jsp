<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>

<!--登录版块-->
 
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">充值</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">充值</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- Booking style-->
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>充值</h2>
             <h3>deng lu</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-8">
         <form action="chongZhi.do" method="post">
         <div class="book-left-content input_form">
         
         <!--  <form action="sendemail.php" method="post" id="contactForm">   -->       
           <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>用户名：</span>
               <input type="hidden" name="uid" value="${user.uid }">
               <input type="text" class="form-control" id="name" value="${user.uname}" readonly placeholder="请输入用户名"></div>
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span>姓名：</span>
                <input type="text" class="form-control" value="${user.tname}" readonly>
            </div>
             <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                 <span>用户余额：</span>
                 <input type="text" class="form-control" value="${user.money}" readonly>
         </div>
             <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                 <span>充值金额：</span>
                 <input  type="number" class="form-control"  name="money" min="1" value="1"  required="required" />
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

              <div class="row" style="margin-top:40px;">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:20px;">
                  <button type="submit" class="res-btn">充值</button>
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
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>

<script type="text/javascript" src="js/regist.js"></script>
<!--用户信息修改版块-->
 
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">用户信息修改</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">用户信息修改</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- Booking style-->
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>用户信息修改</h2>
             <h3>Pick a room that best suits your taste and budget</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-8">
         
         <div class="book-left-content input_form">
         <form method="post" action="updatePersionUser.do" onsubmit="return check2();" enctype="multipart/form-data">
         <!--  <form action="sendemail.php" method="post" id="contactForm">   -->       
           <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>用户名：</span>
               <input type="text" class="form-control" value="${user.uname }" readonly="readonly"  id="username" onblur="return checkuname0()"/>
                <input type="hidden"  value="${user.uid }" name="uid" />
               <span id='checku' class="spanInit" ></span>
            </div> 
               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <span>用户余额：</span>
               <input type="text" class="form-control" id="subject" value="${user.money }" readonly="readonly">
           </div>  
             <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <span>用户积分：(100=1元)</span>
               <input type="text" class="form-control" id="subject" value="${user.scope }" readonly="readonly">
               <c:if test="${user.scope>100 }">
               <a href="duiHuan.do">积分兑换</a>
               </c:if>
           </div>  --%>
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>真实姓名：</span>
               <input type="text" class="form-control" id="name" name="tname" value="${user.tname }" placeholder="请输入用户名" />
               <span id='checku2' class="spanInit" ></span>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>图像：</span>
               <img src="./upload/${user.img}" width="50" height="50">
               <input type="file" class="form-control"name="file"  />
            </div>
            
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
                <span>密码：</span>
                <input type="password" class="form-control" id="txtPwd"  value="${user.pwd }" onblur="return checkpwd0()" name="pwd" placeholder="请输入密码">
            	<span id='prompt_pwd'  class="spanInit" ></span>
            </div>  
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>性 别：</span>
                <input type="text" class="form-control"   value="${user.sex }"  name="sex" >
      </div>
     
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>手机号码：</span>
        <input name="tel" type="text" class="form-control" id="txtPhone"  value="${user.tel }"  onblur="return checktel()"/>
        <span id='prompt_phone' class="spanInit" ></span></div>
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
        	<span>年龄：</span>
        <input name="age" type="text" class="form-control" value="${user.age }"   onblur="return checktel4()"/>
        <span id='' class="spanInit" ></span>
       </div>
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>电子邮箱：</span>
       		<input name="email" type="text" class="form-control" value="${user.email }" />
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>所在地区：</span>
       		<input name="address" type="text" class="form-control" value="${user.address }"  />
      </div>
    <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>身份证号：</span>
       		<input name="idnumber" type="text" class="form-control" id="" value="${user.idnumber }"  />
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>预留问题：</span>
       		<input name="mbanswer" type="text" class="form-control" id="txtName1" onblur="return checkname1()" value="${user.mbanswer }"/>
      </div>
       <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
       		<span>问题答案 ：</span>
       		<input name="question" type="text" class="form-control" id="txtName2" onblur="return checkname2()" value="${user.question }"/>
      </div>
        
              
            <!-- <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <span>Message</span>
                       <textarea class="form-control" rows="6" id="message" name="message" placeholder="Message"></textarea>
                    </div>
              </div> -->
              <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><button type="submit" class="res-btn">提交</button>
                  </div>
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


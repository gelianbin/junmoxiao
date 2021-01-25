<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>


 
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">用户评价</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">用户评价</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- Booking style-->
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>用户评价</h2>
             <h3>yong hu ping jia</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-8">
         
         <div class="book-left-content input_form">
         <form method="post" action="updateUserOrderPj.do" onsubmit="return check2();" enctype="multipart/form-data">
         <!--  <form action="sendemail.php" method="post" id="contactForm">   -->       
           <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>房间名称：</span>
               <input type="text" class="form-control" value="${house.name }" readonly="readonly"   />
                <input type="hidden"  value="${order.id }" name="id" />
               <span id='checku' class="spanInit" ></span>
            </div>   
            <div class="col-lg-12 col-md-12 col-sm-12 m0 col-xs-12">
               <span>评分：</span>
               <c:if test="${order.scope==1 }">
               <input name="scope" type="radio" value="1" id="comment_rank1" checked="checked" />
               </c:if>
               <c:if test="${order.scope!=1 }">
               <input name="scope" type="radio" value="1" id="comment_rank1"  />
               </c:if>
               
				<img src="themes/ecmoban_m182012/images/stars1.gif" />
				<c:if test="${order.scope==2 }">
				<input name="scope" type="radio" value="2" id="comment_rank2" checked="checked"  />
				</c:if>
				<c:if test="${order.scope!=2 }">
				<input name="scope" type="radio" value="2" id="comment_rank2"   />
				</c:if>
               
				<img src="themes/ecmoban_m182012/images/stars2.gif" />
				<c:if test="${order.scope==3 }">
				<input name="scope" type="radio" value="3" id="comment_rank3" checked="checked"  />
				</c:if>
				<c:if test="${order.scope!=3 }">
				<input name="scope" type="radio" value="3" id="comment_rank3" />
				</c:if>
              
				<img src="themes/ecmoban_m182012/images/stars3.gif" />
				 <c:if test="${order.scope==4 }">
				<input name="scope" type="radio" value="4" id="comment_rank4" checked="checked" />
				</c:if>
				<c:if test="${order.scope==4 }">
				<input name="scope" type="radio" value="4" id="comment_rank4"  />
				</c:if>
               
				<img src="themes/ecmoban_m182012/images/stars4.gif" />
				<c:if test="${order.scope==5 }">
				<input name="scope" type="radio" value="5" checked="checked" id="comment_rank5" checked="checked" />
				</c:if>
				<c:if test="${order.scope!=5 }">
				<input name="scope" type="radio" value="5" checked="checked" id="comment_rank5" />
				</c:if>
				<img src="themes/ecmoban_m182012/images/stars5.gif" />
            </div>
            
           
           <!--  <div class="row">   
           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <span>Subject</span>
                       <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
                    </div>
            </div> -->
              
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <span>评价内容：</span>
                       <textarea class="form-control" rows="6" id="message" name="pj" placeholder="Message">
                       ${order.pj }
                       </textarea>
                    </div>
              </div>
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


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>


<!-- Header  Slider style-->
  
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">酒店房间列表</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">房间列表</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- About Resort style-->
  <section class="container clearfix common-pad-inner about-info-box">
    
<div class="row">
    <div class="col-lg-12 col-md-12 col-xs-12">
      
      <div class="sec-header3">
         <h2>${sessionScope.type }</h2>
             <!-- <h3>Pick a room that best suits your taste and budget</h3> -->
         </div>
      <!-- <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam.</p> -->
      </div>
    </div>
    </section> 
    
<!-- About Resort style-->
    

<!-- Room style-->
 <section class="clearfix news-wrapper">
    <div class="container clearfix common-pad-room">
     <div class="row">
     <div class="col-lg-12 col-md-12 col-xs-12">
     <c:forEach items="${list }" var="house">
        <!-- One--> 
       <div class="room-wrapper">
         <div class="media">
          <div class="media-left">
             <a href="showHouse.do?id=${house.id }"><img src="./upload/${house.img }" alt="" width="345px;" height="268px;"></a>
             </div> 
          <div class="media-body">
             <h2>${house.name }</h2>
             <h5>最多可住：${house.unum }人</h5>
             <%-- <h2>${house.name }</h2> --%>
             <c:if test="${house.jianjie.length()>20 }">
             <p>${house.jianjie.substring(0,20) }</p>
             </c:if>
             <c:if test="${house.jianjie.length()<20 }">
             <p>${house.jianjie }</p>
             </c:if>
             <!-- <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni a voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores  dolores quis.</p> -->
             <!-- <h3>Room Facility</h3>
              <h6>Beach View, Dinner Included, Fitness Area, Hotspot(WiFi), Safe Deposit Swimimng Pool, Pets Allows</h6> -->
             </div>   
           <div class="media-right">
            <%--  <p>￥：${house.bprice }<span>元/晚</span></p> --%>
             <p>${house.price }<span>元/晚</span></p>
               <a href="showHouse.do?id=${house.id }">查看/预订</a><!-- single-room.html -->
             </div>  
           </div>
         </div>  
         <!-- One--> 
        </c:forEach> 
         <!-- two--> 
       <!-- <div class="room-wrapper">
         <div class="media">
          <div class="media-left">
             <a href="#"><img src="images/room/2.jpg" alt=""></a>
             </div> 
          <div class="media-body">
             <h2>Standard Room</h2>
             <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni a voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores  dolores quis.</p>
             <h3>Room Facility</h3>
              <h6>Beach View, Dinner Included, Fitness Area, Hotspot(WiFi), Safe Deposit Swimimng Pool, Pets Allows</h6>
             </div>   
           <div class="media-right">
             <p>$215<span>Per Night</span></p>
               <a href="single-room.html">view room</a>
             </div>  
           </div>
         </div>  --> 
         <!-- Two-->
          
         <div class="room-wrapper">
         	<div class="media">
         		<c:if test="${sessionScope.p==1 }">
         		当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="showHouseType.do?page=1&bid=${sessionScope.bid }" >首页</a>
             	<a href="showHouseType.do?page=${page.page-1 }&bid=${sessionScope.bid }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="showHouseType.do?page=${page.page+1 }&bid=${sessionScope.bid }">下一页</a>
				<a href="showHouseType.do?page=${page.totalPage }&bid=${sessionScope.bid }">末页</a>
		    	</c:if> 
				</c:if>
      		</div>
           </div>
         </div> 
       </div>
      </div>
    </section>   
<!-- Room style-->    

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

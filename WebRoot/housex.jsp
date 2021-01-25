<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <script  type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script> --%>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
 <jsp:include page="top.jsp"></jsp:include>

<!--主体内容第一部分开始-->
<!-- Header  Slider style-->
  
 <!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">房间详情</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">房间</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- News style-->
  <section class="container clearfix common-pad-inner">
   <div class="row">
      <div class="col-md-4 col-md-push-8">
       
          <div class="single-sidebar-widget sroom-sidebar">         
              
              <!-- Booking Form style-->
              <div class="book-r-form">
              
                  <div class="room-price">
                  <h6>价格</h6>
                  <p><span>${house.price }/天</span></p>	
                  
                  </div><!-- addForder.do -->
                  <form action="addForder.do" method="post" onsubmit="return checkOrder();">
                  <div class="book-form"><!--  datepicker-example8   -->
                  <div class="col-md-12"><b>入住时间：</b>
                  <!-- <input class="inline laydate-icon form-control Select_Date" id="start" name="stime1"> onclick="WdatePicker()" readonly="readonly" onclick="WdatePicker()"-->
                  <input class=" laydate-icon form-control Select_Date " name="stime" id="start"  placeholder="请选择入住时间" type="text" required="required" onblur="checkStime();">
                  	<span id="checkStime"></span>
                  </div>
                  <div class="col-md-12"><b>离开时间：</b><input type="text" class="form-control"  name="etime" id="end"  placeholder="请选择离开时间" required="required">
                  	<span id="checkEtime"></span>
                  </div>
                  <div class="col-md-12"><b>入住人数：</b><input type="number" class="form-control" name="amount" value="${house.unum }"  placeholder="请输入入住人数最大${house.unum }人" required="required" min="1" max="${house.unum }" />
               		<input type="hidden" id="fid" name="fid" value="${house.id }" />
               		<input type="hidden"  name="btype" value="1" />
              	 </div>
              	 </div>
              
                      <div class="book-form">
                      <c:if test="${sessionScope.user==null }">
					请登录后操作！<a href="login.jsp" class="res-btn">登录</a>
					</c:if>
                      <c:if test="${sessionScope.user!=null }">
					<c:if test="${house.status=='可用房间' }">
					 <div class="col-md-12"><div class="chk-button"><button type="submit" class="res-btn" onclick="return checkOrder(); ">预订/加入购物车 <i class="fa fa-arrow-right"></i></button></div></div>
					</c:if>
					<c:if test="${house.status!='可用房间' }">
					   <span>该房间已被预订！</span>
					   <!-- <a class="button secondary url" href="#tableShow">查看可预约时间 </a>
						<div class="col-md-12"><div class="chk-button">
						<button type="submit" class="res-btn" onclick="return checkOrder(); ">确定预约 /加入购物车<i class="fa fa-arrow-right"></i></button></div></div>
					 --></c:if>
					</c:if>
					
                 
                  </div>
                  <!-- </div> -->
                  </form>
              
              </div>
              <!-- Booking Form style-->
              
           
   </div>
</div>
    
    <div class="col-md-8 col-md-pull-4">
     		
     <div class="single-room-wrapper">
     		
       <!-- Rooms Slider style-->
        <div class="room-slider-wrapper">
         <div class="single-r-wrapper">
           <div class="single-sl-room">
           <!-- <div class="owl-itemm" data-hash="zero"><img src="images/rooms/gallery/1.jpg" alt=""></div> -->
           <div class="owl-itemm" data-hash="zero"><img src="./upload/${house.img }" alt=""></div>
           <c:if test="${house.img1!=null }">
           <div class="owl-itemm" data-hash="one"><img src="./upload/${house.img1 }" alt=""></div>
           </c:if>
           <c:if test="${house.img2!=null }">
           <div class="owl-itemm" data-hash="two"><img src="./upload/${house.img2 }" alt=""></div>
           </c:if>
           <c:if test="${house.img3!=null }">
           <div class="owl-itemm" data-hash="three"><img src="./upload/${house.img3 }" alt=""></div>
           </c:if>
           <c:if test="${house.img4!=null }">
           <div class="owl-itemm" data-hash="four"><img src="./upload/${house.img4 }" alt=""></div>  
           </c:if> 
          </div>  
          <c:if test="${house.img1!=null }">
           <a class="button secondary url" href="#zero"><img src="./upload/${house.img1 }" alt="" width="150px" height="94"></a> 
          </c:if>
          <c:if test="${house.img2!=null }">
           <a class="button secondary url" href="#two"><img src="./upload/${house.img2 }" alt=""  width="150px" height="94"></a> 
          </c:if>
          <c:if test="${house.img3!=null }">
          <a class="button secondary url" href="#three"><img src="./upload/${house.img3 }" alt=""  width="150px" height="94"></a> 
          </c:if>
          <c:if test="${house.img4!=null }">
           <a class="button secondary url" href="#four"><img src="./upload/${house.img4 }" alt=""  width="150px" height="94"></a> 
          </c:if>
       
       <%--  <a class="button secondary url" href="#one"><img src="./upload/${house.img1 }" alt=""></a> 
        <a class="button secondary url" href="#two"><img src="./upload/${house.img2 }" alt=""></a> 
        <a class="button secondary url" href="#three"><img src="./upload/${house.img3 }" alt=""></a> 
        <a class="button secondary url" href="#four"><img src="./upload/${house.img4 }" alt=""></a>  --%>
                
             </div>
            
            </div>
         
        <!-- Rooms Slider style-->
         
         <!-- Description of Room style-->
         <div class="room-dec-wrapper">
          <h2>房间详情</h2>
          	<p>${house.note }</p>
         </div>
         <!-- Description of Room style-->
         
         <!-- Room Facilities style-->
         <div class="room-fac-wrapper">
         <h2>房间设备</h2>
            <div class="row">
             <div class="ro-facilitie">
             <ul class="clearfix">
             <li><div class="facilitie-i-box">
                         <h3>TV LCD</h3>
                         <span><img src="images/rooms/icon1.gif" alt=""></span>
                     </div>
                 </li>
             <li><div class="facilitie-i-box">
                         <h3>Breakfast</h3>
                         <span><img src="images/rooms/icon2.gif" alt=""></span>
                     </div>
                 </li>
                 <li><div class="facilitie-i-box">
                         <h3>free parking</h3>
                         <span><img src="images/rooms/icon3.gif" alt=""></span>
                     </div>
                 </li>
                 <li><div class="facilitie-i-box">
                         <h3>wi-fi service</h3>
                         <span><img src="images/rooms/icon4.gif" alt=""></span>
                     </div>
                 </li>
                 <li><div class="facilitie-i-box">
                         <h3>AC Room</h3>
                         <span><img src="images/rooms/icon5.gif" alt=""></span>
                     </div>
                 </li>
             
             </ul>
             </div>
                </div>
             
             
         </div>
         <!-- Room Facilities style-->
         
         <!-- Room Overview style-->
         <div class="room-overview">
         <h2>房间介绍</h2>
         
             <div class="table-responsive"> <table class="table table-striped"> <colgroup> <col class="col-xs-1"> <col class="col-xs-7"> </colgroup><tbody>
                 <tr> <th scope="row"> <code>房间名称 : </code> </th> <td>${house.name }</td> </tr>
                 <tr> <th scope="row"> <code>房间类型:</code> </th> <td>
						<c:forEach items="${tlist }" var="t">
							<c:if test="${t.id==house.bid }">
								${t.name }
							</c:if>
						</c:forEach>
					</td> </tr>
                 <tr> <th scope="row"> <code>面积 : </code> </th> <td>${house.area }</td> </tr>
                 <tr> <th scope="row"> <code>房间数 : </code> </th> <td>${house.fjnum }</td> </tr>
                 <tr> <th scope="row"> <code>酒店名称 : </code> </th> <td>
                 <c:forEach items="${ulist }" var="u">
                 <c:if test="${u.uid==house.uid }">${u.tname }</c:if>
                 </c:forEach></td> </tr>
                 <tr> <th scope="row"> <code>卫生间类型 : </code> </th> <td>${house.wsjtype }</td> </tr>
                 <tr> <th scope="row"> <code>房间位置 :</code> </th> <td>${house.addr }</td> </tr> 
                 <tr> <th scope="row"> <code>目前状态 :</code> </th> <td>${house.status }</td> </tr> 
                 <tr> <th scope="row"> <code>发布时间 :</code> </th> <td>${house.pubtime }</td> </tr>
                 <tr> <th scope="row"> <code>价格 :</code> </th> <td>${house.price }</td> </tr>
                 </tbody> </table> </div>
					<c:if test="${sessionScope.user==null }">
					请登录后操作！<a href="login.jsp" class="res-btn">登录</a>
					</c:if>
         </div>
         
          <div class="room-overview" data-hash="tableShow" id="tableShow" ><!--style="display:none" -->
         <%-- <h2>预约列表</h2>
         
             <div class="table-responsive" >
              <table  class="table table-striped">
              <colgroup> <col class="col-xs-1"> 
              <col class="col-xs-7"> </colgroup>
              <tbody>
              <tr>
               <th><code>预约开始时间</code>  </th> 
               <th> <code>预约结束时间</code> </th> 
               </tr>
               <c:forEach items="${list }" var="o" varStatus="num">
               	 <tr> 
                <td>${o.stime }</td> 
                <td>${o.etime }</td> 
                </tr>
               </c:forEach>
               <c:forEach items="${list2 }" var="o2" >
               	 <tr> 
                <td>${o2.stime }</td> 
                <td>${o2.etime }</td> 
                </tr>
               </c:forEach>
               </tbody>
               </table>
         </div> --%>
         <div class="news-comments">
                  
                  <h3 class="comments_count">评论</h3>
                  <div class="comments">
                 <c:forEach items="${plist }" var="pj">           
                    <div class="media comment">
                        <div class="media-left">
                        <c:forEach items="${ulist }" var="u">
                        <c:if test="${u.uid==pj.uid }">
                         <img src="./upload/${u.img }" alt="" width="50px;" height="50px;">
                        </c:if>
                        </c:forEach>
                        
                       </div><!-- images/news/coments1.jpg" -->
                        <div class="media-body">
                            <h5 class="commenter-name"><c:forEach items="${ulist }" var="u">
                        <c:if test="${u.uid==pj.uid }">
                         ${u.tname }
                        </c:if>
                        </c:forEach></h5>
                           
                            <p>评论内容：
                            <c:if test="${pj.pj!=null }">
                            ${pj.pj }
                            </c:if>
                            <c:if test="${pj.pj==null }">
                             暂未评价
                            </c:if>
          
                            </p>
                             <c:if test="${pj.pj!=null }">
                            <ul class="date-reply nav">
                                <li><a href="#">评价时间：${pj.pjtime }</a></li>
                                <li><a href="#">评分：${pj.scope } (满分5分)</a></li>
                            </ul>
                           </c:if>
                            <c:if test="${pj.huifu!=null }">
                            <ul class="date-reply nav">
                                <li><a href="#">普通管理员回复内容：${pj.huifu }</a></li>
                            </ul>
                           </c:if>
                        </div>
                    </div> 
                    </c:forEach>   
                    <!--Comment-->              
                  </div>
          </div>
         <!-- Room Overview style-->
        
         
         
        </div>
     </div>
    
    </div>
 </section> 
    
<!-- News style-->
<!--主体内容第一部分结束-->
<!--底部-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
<script  type="text/javascript">

 /**日期选择**/
 var start = {
     elem: '#start',
     format: 'YYYY-MM-DD',
     min: laydate.now(), //设定最小日期为当前日期
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
     min: laydate.now(),
     max: '2099-06-16 ',
     istime: true,
     istoday: false,
     choose: function(datas){
         start.max = datas; //结束日选好后，重置开始日的最大日期
     }
 };
 laydate(start);
 laydate(end);
</script>
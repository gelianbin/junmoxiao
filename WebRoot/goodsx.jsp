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
 		<h2 class="this-title">菜品详情</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">菜品</li>
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
                  <p><span>${jz.price }</span></p>
                  
                  </div><!-- addForder.do -->
                  <form action="addForder.do" method="post" onsubmit="return checkOrder();">
                  <div class="book-form"><!--  datepicker-example8   -->
               		<input type="hidden" id="fid" name="fid" value="${jz.id }" />
                      <input type="hidden"  name="btype" value="2" />
              	 </div>
              
                      <div class="book-form">
                      <c:if test="${sessionScope.user==null }">
					请登录后操作！<a href="login.jsp" class="res-btn">登录</a>
					</c:if>
                      <c:if test="${sessionScope.user!=null }">
					 <div class="col-md-12"><div class="chk-button"><button type="submit" class="res-btn" onclick="return checkOrder(); ">预订/加入购物车 <i class="fa fa-arrow-right"></i></button></div></div>
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
           <div class="owl-itemm" data-hash="zero"><img src="./upload/${jz.img }" alt=""></div>

          </div>  
             </div>
            
            </div>
         
        <!-- Rooms Slider style-->
         
         <!-- Description of Room style-->
         <div class="room-dec-wrapper">
          <h2>菜品详情</h2>
          	<p>${jz.note }</p>
         </div>
         <!-- Description of Room style-->

         <!-- Room Overview style-->
         <div class="room-overview">
         <h2>菜品介绍</h2>
         
             <div class="table-responsive"> <table class="table table-striped"> <colgroup> <col class="col-xs-1"> <col class="col-xs-7"> </colgroup><tbody>
                 <tr> <th scope="row"> <code>菜品名称 : </code> </th> <td>${jz.name }</td> </tr>
                 <tr> <th scope="row"> <code>菜品类型:</code> </th> <td>
						<c:forEach items="${clist }" var="t">
							<c:if test="${t.id==jz.fid }">
								${t.name }
							</c:if>
						</c:forEach>
					</td> </tr>
                 <tr> <th scope="row"> <code>销售量 : </code> </th> <td>${jz.xnum }</td> </tr>
                 <tr> <th scope="row"> <code>发布时间 :</code> </th> <td>${jz.pubtime }</td> </tr>
                 <tr> <th scope="row"> <code>价格 :</code> </th> <td>${jz.price }</td> </tr>
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
                 <c:forEach items="${list }" var="pj">
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
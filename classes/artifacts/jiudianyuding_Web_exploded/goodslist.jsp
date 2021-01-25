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
 		<h2 class="this-title">菜品列表</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">菜品列表</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- About Resort style-->
  <section class="container clearfix common-pad-inner about-info-box">
    
<div class="row">
    <div class="col-lg-12 col-md-12 col-xs-12">
      
      <div class="sec-header3">
         <%-- <h2>${sessionScope.type }</h2> --%>
             <!-- <h3>Pick a room that best suits your taste and budget</h3> -->
         </div>
      <!-- <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam.</p> -->
      </div>
    </div>
    </section> 
    
<!-- About Resort style-->
    
<section class="row nasir-room-grid">
	<div class="container">
		<div class="row">
		<c:forEach items="${list }" var="house">
			<div class="col-sm-4 nroom-grid">
			 <a href="showGoodsx.do?id=${house.id }" class="room-img"><img src="./upload/${house.img }" alt="" width="370px" height="235px;"></a>
				<div class="row this-conts">
					<div class="media">
						<div class="media-body this-title">${house.name }</div>
						<div class="media-right">
							 ${house.price }<small></small>
						</div>
					</div>
					<a href="showGoodsx.do?id=${house.id }" class="read-more">查看/预订<i class="fa fa-arrow-right"></i></a>
				</div>
			</div>
			</c:forEach>
		</div>
         <div class="row" style="    text-align: center;">
         	<div class="col-sm-10 nroom-grid">
                <c:if test="${sessionScope.p==1 }">
                    <c:if test="${page.page>1}">
                        <a href="showGoods.do?page=1" >首页</a>
                        <a href="showGoods.do?page=${page.page-1 }"> 上一页</a>
                    </c:if>
                    <c:if test="${page.page<page.totalPage}">
                        <a href="showGoods.do?page=${page.page+1 }">下一页</a>
                        <a href="showGoods.do?page=${page.totalPage }">末页</a>
                    </c:if>
                </c:if>
         		<c:if test="${sessionScope.p==2 }">
         		当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="selectGoodsList.do?page=1" >首页</a>
             	<a href="selectGoodsList.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="selectGoodsList.do?page=${page.page+1 }">下一页</a>
				<a href="selectGoodsList.do?page=${page.totalPage }">末页</a>
		    	</c:if> 
				</c:if>
      		</div>
           </div>
         </div> 
    </section>   
<!-- Room style-->    

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

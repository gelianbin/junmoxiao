<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!--导航-->
<jsp:include page="top.jsp"></jsp:include>


<!--主体内容第一部分开始-->
<div id="minimal-bootstrap-carousel" class="carousel default-home-slider slide carousel-fade shop-slider" data-ride="carousel">           
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    <!--  url(./upload/${news.img}) -->
        <div class="item active slide-1" style="background-image:url(images/slider/10.jpg);backgroudn-position: center right;">
            <div class="carousel-caption nhs-caption nhs-caption6">
	      		<div class="thm-container">
	      			<div class="box valign-middle">
	      				<div class="content text-center">
							<h2 data-animation="animated fadeInUp" class="this-title"></h2>
							<p data-animation="animated fadeInDown"></p>
							<a data-animation="animated fadeInLeft" href="#" class="nhs-btn3"></a>
							<a data-animation="animated fadeInRight" href="#" class="nhs-btn"></a>
	      				</div>
	      			</div>
	      		</div>
	    	</div>                
        </div>
        <c:forEach items="${nlist }" var="news">
        <div class="item  slide-2" style="background-image: url(./upload/${news.img});backgroudn-position: center right;">
            
            <div class="carousel-caption nhs-caption nhs-caption7">
	      		<div class="thm-container">
	      			<div class="box valign-middle">
	      				<div class="content text-left pull-left">
							<h2 data-animation="animated fadeInUp" class="this-title">${news.name }</h2>
							<p data-animation="animated fadeInDown">${news.jianjie }</p>
							<a data-animation="animated fadeInLeft" href="showNews.do?id=${news.id }" class="nhs-btn3">查看</a>
							<a data-animation="animated fadeInRight" href="showNews.do?id=${news.id }" class="nhs-btn">了解更多</a>
	      				</div>
	      			</div>
	      		</div>
	    	</div>                
        </div>
        </c:forEach>
      <!--   <div class="item  slide-2" style="background-image: url(images/slider/12.jpg);backgroudn-position: center right;">
            
            <div class="carousel-caption nhs-caption nhs-caption8">
	      		<div class="thm-container">
	      			<div class="box valign-middle">
	      				<div class="content text-center">
							<h2 data-animation="animated fadeInUp" class="this-title">We offer you the best</h2>
							<h2 data-animation="animated fadeInUp" class="this-title">luxury hotel with an impressive history</h2>
	      				</div>
	      			</div>
	      		</div>
	    	</div>            
        </div> -->
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#minimal-bootstrap-carousel" role="button" data-slide="prev">
        <i class="fa fa-angle-left"></i>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#minimal-bootstrap-carousel" role="button" data-slide="next">
        <i class="fa fa-angle-right"></i>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- Header  Slider style-->        

<!-- Search style-->

<div class="search-wrapper">
<form action="selectHouseList.do" method="post" >
<section class="container clearfix">
<div class="search-sec search-sec-homet">
<div class="overlay">
    <div class="border">
   
    <div class="ser-in-box" style="margin-right:10px;"> 
    <input class="form-control " name="name" placeholder="房间名称" type="text" style="    height: 40px;"></div>
    <div class="ser-in-box" style="    width: 150px;">
    	<select name="bid" class="select-menu" >
         <option value="">请选择分类</option>
         <c:forEach items="${tlist }" var="a">
         <option value="${a.id }">${a.name }</option>
         </c:forEach>
        </select> 
    </div>
    <div class="ser-in-box">
    	<select name="addr2" class="select-menu">
         <option value="">请选择地区</option>
         <c:forEach items="${dlist }" var="a">
         <option value="${a.id }">${a.name }</option>
         </c:forEach>
        </select> 
    </div>

    <div class="ser-in-box" >   
    <div class="select-box" style="    width: 150px;">
                            <select class="select-menu" name="unum">
                                <option value="">人数</option>  
                                <option value="1">1</option>	
                                <option value="2">2</option>	
                                <option value="3">3</option>	
                                <option value="4">4</option>    
                            </select>
                    </div>
    </div>
<!-- <div class="ser-in-box">
     <div class="select-box">
                            <select class="select-menu" name="selectMenu">
                                <option value="default">Children</option>  
                                <option value="1">1</option>	
                                <option value="2">2</option>	
                                <option value="3">3</option>	
                                <option value="4">4</option>    
                            </select>
                    </div></div> -->
<div class="ser-in-box chk-button"><button type="submit" class="res-btn">查找</button></div>
    </div>
</div>
</div>
</section>
</form>
</div>
<!-- Search style--> 
<!-- Header  Slider style-->
<!-- Rooms And Suits style--> 
<section class="container clearfix common-pad nasir-style">
 <div class="sec-header sec-header-pad">
 <h2>我们的客房</h2>
     <h3>wo meng de ke fang </h3>
 </div>
 <div class="room-slider">
   <div class="roomsuite-slider-two">  
	<c:forEach items="${hlist }" var="house">
 <div class="room-suite room-suite-htwo">
     <div class="item">
     <div class="ro-img"><a href="showHouse.do?id=${house.id }"><img src="./upload/${house.img }"   alt=""  width="270px;" height="228px"></a></div>
     <div class="ro-txt">
        <h2>${house.name }</h2>
          <%--    <p style="display: -webkit-box;-webkit-line-clamp: 3; -webkit-box-orient: vertical;
    overflow: hidden;">${house.jianjie }</p> --%>
           <%--  <c:if test="${house.note.length()<20 }">
             <p>${house.note }</p>
             </c:if> --%>
         <div class="ro-text-two">
         <div class="left-p-two pull-left"><a href="showHouse.do?id=${house.id }" class="res-btn">查看/预订</a></div>
         <div class="right-p-two pull-right">
         <p>￥：${house.price }<span>元/晚</span></p>
         <%-- <p>会员价:${house.bprice }<span>元/晚</span></p> --%>
         </div>
         </div>         
         </div>
     </div>
    </div>
    </c:forEach>
    
       
       
  </div>
 </div>
</section>
 
<!-- Counter style-->     
 <section class="resort-counert clearfix">
    
    <div class="container">
     <div class="row">
        <div class="col-md-3 col-sm-6">
         <div class="rest-fact-counter">
					<div class="text-box">
						<h4 class="timer" data-from="0" data-to="121"></h4>						
					</div>
                    <div class="text-box2"><p>new<span>friendships</span></p></div>
				</div>
         
         </div>
        <div class="col-md-3 col-sm-6"><div class="rest-fact-counter">
					<div class="text-box">
						<h4 class="timer" data-from="0" data-to="254"></h4>						
					</div>
                    <div class="text-box2"><p>five start<span>ratings</span></p></div>
				</div></div>
         <div class="col-md-3 col-sm-6"><div class="rest-fact-counter">
					<div class="text-box">
						<h4 class="timer" data-from="0" data-to="430"></h4>						
					</div>
                    <div class="text-box2"><p>International<span>Guests</span></p></div>
				</div></div>
         <div class="col-md-3 col-sm-6"><div class="rest-fact-counter">
					<div class="text-box">
						<h4 class="timer" data-from="0" data-to="782"></h4>						
					</div>
                    <div class="text-box2"><p>Served<span>Breakfast</span></p></div>
				</div></div>
        
        </div>
     
     </div>
    
    </section>   
 <!-- Activities of Resort style-->    
  <div class="resot-activities clearfix">
    
    <div class="container clearfix common-pad">
      <div class="row">
        
       <!--  <div class="col-lg-6 col-md-6 activities-cont">
          
          <div class="sec-header3">
             <h2>关于我们</h2>
                 <h3>guan yu wo meng </h3>
             </div>
          <p></p>
            
            <a href="showNews.do?id=2" class="res-btn">关于我们<i class="fa fa-arrow-right"></i></a>
            
          </div> -->
          <div class="col-lg-12 col-md-12 col-xs-12">
			<div class="row nasir-welboxes">
		  	<c:forEach items="${tlist }" var="t">
			  	<div class="single_wel_cont col-sm-3">  
					<a class="wel-box" href="showHouseType.do?bid=${t.id }">
						<div class="icon-box"><img src="images/welcome/icon-3.png" alt="" /></div>
						<h4>类别名称：${t.name }</h4>
						<div class="overlay transition3s">
							<div class="icon_position_table">
								<div class="icon_container border_round">
									<h2>${t.name }</h2>
									<p></p>
								</div>
							</div>
						</div>
					</a>
				</div>
				</c:forEach>
				
				
			</div>
         
          </div>
        
        </div>
      </div>
    </div>

    
<!-- Our Gallery style-->
 <section class="our-galler-htwo clearfix common-pad">
    
    <div class="container clearfix">
      
         <div class="sec-header sec-w-header">
            <h2>公告</h2>
         	<h3>xin wen zi xun</h3>
         </div>
     </div>
     
     <div class="fullwidth-silder">
        
        <div class="fullwidth-slider">
        	<c:forEach items="${nlist2 }" var="news2">
			<div class="item">
				<img src="./upload/${news2.img }" alt="" width="348" height="252">
				<div class="this-overlay">
					<div class="this-texts">
						<a href="showNews.do?id=${news2.id }" class="fancybox" rel="help"><i class="icon icon-Search"></i></a>
						<h4 class="this-title">${news2.name }</h4>
					</div>
				</div>
			</div>
			</c:forEach>
			
         </div>
        </div>
    </section>     


<!--主体内容第二部分结束--> 
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>

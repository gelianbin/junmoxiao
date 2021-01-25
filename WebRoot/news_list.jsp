<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>


<!-- Header  Slider style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">公告</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">公告</li>
 		</ol>
 	</div>
 </section>
<!-- Header  Slider style-->
    

<!-- News style-->
  <section class="container clearfix common-pad-inner">
   <div class="row">
      <div class="col-md-4 col-sm-12 pull-left">
       
          
          
          <div class="single-sidebar-widget">         
              
              <!-- Search style-->
              <div class="single-sidebar-widget-outer">
              <div class="sec-title">
						<h2>搜索</h2>
					</div>
              
              <div class="widget-search-blog">
                        <div class="row widget-inner">
                            <form action="searchNews.do" class="search-form" method="post">
                                <div class="input-group">
                                    <input type="search" class="form-control" name="name" placeholder="请输入你要查找的公告标题">
                                    <span class="input-group-addon">
                                        <button type="submit"><i class="icon icon-Search"></i></button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                  </div>
              <!-- Search style-->
              
             
          </div>
        
       </div>
      
      <div class="col-md-8 col-sm-12 pull-right">
       
       <div class="single-post-wrapper">
        
           <!-- News 1  -->
           <c:forEach items="${list }" var="news">
           <article class="single-blog-post img-cap-effect">
						<div class="img-box">
                            <a href="showNews.do?id=${news.id }"><%-- <img src="./upload/${news.img }" class="img-responsive" alt="" style="width:600px;height:250px;" /> --%>
                            <div class="date-box">
                                <div class="date-inner">
                                    <div class="date-c-inner">
                                <p>${news.pubtime.substring(8,10) }<span>${news.pubtime.substring(5,7) }</span></p>
                                </div>
                                </div>
                                </div>
                            
                            </a>
							</div>                  
                 
						<!-- <div class="meta-info">
							
							<div class="content-box">
								
								<ul class="post-links">
									<li><a href="#"><i class="fa fa-user"></i> By:  Michale John</a></li>
									<li><a href="#"><i class="fa fa-tag"></i> Accomodation</a></li>
									<li><a href="#"><i class="fa fa-comments-o"></i> Comments: 8</a></li>
								</ul>
							</div>
						</div> -->
                  
                     <h3><a href="showNews.do?id=${news.id }">${news.name }</a></h3>
						<p>
						<c:if test="${news.jianjie.length()>20 }">
							${news.jianjie.substring(0,20) }
						</c:if>
						<c:if test="${news.jianjie.length()<=20 }">
							${news.jianjie }
						</c:if>
						</p>
						<a href="showNews.do?id=${news.id }" class="read-more btn submit">查看更多</a>
					</article>
           <!-- News 1  -->
           </c:forEach>
           
          </div>
       		<div class="room-wrapper">
         	<div class="media-body">
         		<c:if test="${sessionScope.p==1 }">
				<c:if test="${page.page>1}">
              	<a href="fnewsList.do?page=1" >首页</a>
             	<a href="fnewsList.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="fnewsList.do?page=${page.page+1 }">下一页</a>
				<a href="fnewsList.do?page=${page.totalPage }">末页</a>
		    	</c:if> 
				</c:if>
      		</div>
           </div>
       
       
       
       </div>
      
      </div>
      
      
      
      
      
   </section> 
    
<!-- News style-->
    

   
  

    
  
  

 <!-- Welcome banner  style-->
    

<!-- Header  Slider style-->
  
 
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

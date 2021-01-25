<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<jsp:include page="top.jsp"></jsp:include>


<!-- Header  Inner style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">公告动态详情页</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">公告动态</li>
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
              <!-- <div class="single-sidebar-widget-outer">
              <div class="sec-title">
						<h2>Search</h2>
					</div>
              
              <div class="widget-search-blog">
                        <div class="row widget-inner">
                            <form action="#" class="search-form" method="get">
                                <div class="input-group">
                                    <input type="search" class="form-control" placeholder="Enter Search keywords">
                                    <span class="input-group-addon">
                                        <button type="submit"><i class="icon icon-Search"></i></button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                  </div> -->
              <!-- Search style-->
              
              <!-- Categories style-->
              <!-- <div class="single-sidebar-widget-outer">
              <div class="sec-title-cat sec-title">
						<h2>Categories</h2>
					</div>
              
              <div class="categories">
						<ul>
							<li><a href="#">Beach perpared for  new season</a></li>
							<li><a href="#">Near by places of our resort</a></li>
							<li><a href="#">Lots of Activities in resort</a></li>
							<li><a href="#">Beach near our resort</a></li>
							<li><a href="#">Property type and title clear</a></li>
							<li><a href="#">New Families rooms</a></li>
						</ul>
					</div>
              </div> -->
              <!-- Categories style-->
              
              <!-- Popular Posts style-->
             <!-- <div class="single-sidebar-widget-outer">
              <div class="sec-title">
						<h2>Popular Posts</h2>
					</div>
                <div class="popular-post">
						<ul>
							<li class="img-cap-effect">
								<div class="img-box">
                                    <a href="news-details.html"><img src="images/news/1.jpg" alt=""/></a>
									
								</div>
								<div class="content">
									<a href="#"><h4>Lots of activities planned</h4></a>
									<span>Aug 12,2015</span>
								</div>
							</li>
							<li class="img-cap-effect">
								<div class="img-box">
                                    <a href="news-details.html"><img src="images/news/2.jpg" alt=""/></a>
									
								</div>
								<div class="content">
									<a href="#"><h4>Beach prepared for new season</h4></a>
									<span>Aug 12,2015</span>
								</div>
							</li>
							<li class="img-cap-effect">
								<div class="img-box">
                                    <a href="news-details.html"><img src="images/news/3.jpg" alt=""/></a>
									
								</div>
								<div class="content">
									<a href="#"><h4>Best night photo at resort</h4></a>
									<span>Aug 12,2015</span>
								</div>
							</li>
						</ul>
					</div> 
              </div> -->
              <!-- Popular Posts style-->
              
              <!-- Tags Clouds style-->
              <!-- <div class="single-sidebar-widget-outer">
              <div class="sec-title">
						<h2>Tags Clouds</h2>
					</div>
                  <div class="tag-cloud">
						<ul>
							<li><a href="#">Most Popular places</a></li>
							<li><a href="#">Rooms</a></li>
							<li><a href="#">top rated resorts</a></li>
							<li><a href="#">Tips & Tricks</a></li>
							<li><a href="#">Real news</a></li>
							<li><a href="#">OUr Agents</a></li>
						</ul>
					</div>
              </div> -->
              <!-- Tags Clouds style-->
              
          </div>
        
       </div>
      
      <div class="col-md-8 col-sm-12 pull-right">
       
       <div class="single-post-wrapper">
         
          
           <article class="single-blog-post img-cap-effect">
						<div class="img-box">
                            <a href="#"><img src="./upload/${news.img }" class="img-responsive" alt=""/>
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
						<p>概要：${news.jianjie }</p>
						
               			<p>详情：${news.note }</p>
               <!-- <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.</p>
               <ul class="nav post-list">
                            <li>Dolor sit amet, consectetur</li>
                            <li>Sdipiscing elit,</li>
                            <li>Seddo eiusmod tempor</li>
                            <li>Incididunt ut labore et</li>  
                            <li>Dolor sit amet, consectetur</li>
                            <li>Sdipiscing elit,</li>
                            <li>Seddo eiusmod tempor</li>
                            <li>Incididunt ut labore et</li>
                 </ul>
               
               <h3>Two Column texts</h3>
                        <div class="row">
                            <div class="col-sm-6 info">
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem ape riam, eaque ipsa quae ab illo invent ore veritatis et quasi architecto beatae vitae dicta sunt explicabo. </p>
                            </div>
                            <div class="col-sm-6 info">
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem ape riam, eaque ipsa quae ab illo invent ore veritatis et quasi architecto beatae vitae dicta sunt explicabo. </p>
                            </div>
                        </div>
                  <br>
                  
                  <blockquote>
                            <p>Ut enim ad minima veniam, quis nostrum exercitatio nem ullam corporis suscipit labori osam, nisi ut aliqu id ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.</p>
                            <footer><a href="#">Michale John</a></footer>
                        </blockquote>
                -->
               <!-- <p><b>Here is main text</b> quis nostrud exercitation ullamco laboris nisi here is itealic text ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat <a href="#">here is link text</a> cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					 --></article>
           
             <div class="news-comments">
                  
                 <!--  <h3 class="comments_count">Comments 4</h3> -->
                  <div class="comments">
                                    
                   <!--  <div class="media comment">
                        <div class="media-left"><img src="images/news/coments1.jpg" alt=""></div>
                        <div class="media-body">
                            <h5 class="commenter-name">Merry John</h5>
                            <p>Duis aute irure dolor in reprehenderit in vol uptate velit esse cillum dolore eu fugiat nulla pari atur. Excepteur sint occaecat cupidatat non proid pent.</p>
                            <ul class="date-reply nav">
                                <li><a href="#">Dec 09 2015</a></li>
                                <li><a href="#">reply</a></li>
                            </ul>
                        </div>
                    </div>  -->
                    <!--Comment-->              
                   <!--  <div class="media comment comment-bg">
                        <div class="media-left"><img src="images/news/coments3.jpg" alt=""></div>
                        <div class="media-body">
                            <h5 class="commenter-name">Merry John</h5>
                            
                            <p>Duis aute irure dolor in reprehenderit in vol uptate velit esse cillum dolore eu fugiat nulla pari atur. Excepteur sint occaecat cupidatat non proid pent.</p>
                            <ul class="date-reply nav">
                                <li><a href="#">Dec 09 2015</a></li>
                                <li><a href="#">reply</a></li>
                            </ul>
                        </div>
                    </div>  -->
                    <!--Comment-->              
                  <!--   <div class="media comment">
                        <div class="media-left"><img src="images/news/coments1.jpg" alt=""></div>
                        <div class="media-body">
                            <h5 class="commenter-name">Merry John</h5>
                            <ul class="date-reply nav">
                                <li><a href="#">Dec 09 2015</a></li>
                                <li><a href="#">reply</a></li>
                            </ul>
                            <p>Duis aute irure dolor in reprehenderit in vol uptate velit esse cillum dolore eu fugiat nulla pari atur. Excepteur sint occaecat cupidatat non proid pent.</p>                       
                            <div class="media comment reply">
                                <div class="media-left"><img src="images/news/coments2.jpg" alt=""></div>
                                <div class="media-body">
                                    <h5 class="commenter-name">Merry John</h5>
                                    
                                    <p>Duis aute irure dolor in reprehenderit in vol uptate velit esse cillum dolore eu fugiat nulla pari atur. Excepteur sint occaecat.</p>
                                    <ul class="date-reply nav">
                                        <li><a href="#">Dec 09 2015</a></li>
                                        <li><a href="#">reply</a></li>
                                    </ul>
                                </div>
                            </div>   
                        </div>
                    </div>  -->
                    <!--Comment-->              
                   <!--  <div class="media comment comment-bg">
                        <div class="media-left"><img src="images/news/coments2.jpg" alt=""></div>
                        <div class="media-body">
                            <h5 class="commenter-name">Merry John</h5>
                            
                            <p>Duis aute irure dolor in reprehenderit in vol uptate velit esse cillum dolore eu fugiat nulla pari atur. Excepteur sint occaecat cupidatat non proid pent.</p>
                            <ul class="date-reply nav">
                                <li><a href="#">Dec 09 2015</a></li>
                                <li><a href="#">reply</a></li>
                            </ul>
                        </div>
                    </div> 
                  </div> -->
                      
                      <!--  Leave a Comment -->
                      
                      <!-- <div class="leave-comments">
                      
                      <h3 class="leave-comment-title">Leave a Comment</h3>
                         <form action="#" method="post" class="comment_form row m0">
                    
                    <input type="text" class="form-control" placeholder="Enter your name">
                    <input type="email" class="form-control" placeholder="Enter your email address">
                    <textarea class="form-control" placeholder="Wrtie message"></textarea>
                    <button type="submit" class="res-btn">Submit now <i class="fa fa-arrow-right"></i></button>
                </form> 
                          
                          
                   </div>  -->
              
                  </div>
          </div>
       </div>
      
      </div>
   </section> 
    
<!-- News style-->

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>


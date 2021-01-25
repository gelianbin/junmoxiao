<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>酒店预定系统首页</title>
<!-- reponsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- strock gap icons -->
<link rel="stylesheet" href="vendors/Stroke-Gap-Icons-Webfont/style.css">
<link rel="stylesheet" href="css/animate.min.css">
<!--    owl-carousel-->
<link rel="stylesheet" href="vendors/owlcarousel/owl.carousel.css">
<link rel="stylesheet" href="vendors/jquery-ui-1.11.4/jquery-ui.min.css">    

<!-- Main Css  -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css"> 	 
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
<!-- .hidden-bar -->
    
    

    <section class="top-bar dhomev">
        <div class="container">
            <div class="pull-left left-infos contact-infos">
            </div>
            <div class="pull-right right-infos link-list">
                <ul class="list-inline">
                <c:if test="${sessionScope.user==null }">
                    <li>
                        <a href="login.jsp">登录</a>
                    </li>
                    <li><a href="register.jsp">注册</a></li>
                    </c:if>

                    <c:if test="${sessionScope.user!=null }">
                    <li>
                        <a href="showUserInfo2.do"><img src="./upload/${sessionScope.user.img}" width="30" height="30"/> ${user.tname }</a>
                    </li>
                     <li><a href="forderList.do">我的房间购物车</a></li>
                     <li><a href="forderList_cp.do">订餐购物车</a></li>
                     <li><a href="myOrderList.do">我的订单</a></li>
                     <li><a href="myOrderList_cp.do">我的订餐</a></li>
                     <li><a href="recordList.do">我的兑换</a></li>
                     <li><a href="loginout.do">注销</a></li>
                    </c:if>
                    <li><a href="admin/" target="_blank">后台</a></li>
                </ul>
            </div><!-- /.pull-right right-infos link-list -->
        </div><!-- /.container -->
    </section><!-- /.top-bar -->
    
    <nav class="navbar navbar-default  _fixed-header _light-header stricky" id="main-navigation-wrapper">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navigation" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="index.do" class="navbar-brand">
                    <img alt="酒店预定系统" src="images/header/logo2.png" style="width:400px;">
                </a>
            </div>

            <div class="collapse navbar-collapse" id="main-navigation">
                <ul class="nav navbar-nav ">
                	<li><a href="index.do">首页</a></li>
                    <li>
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">房间类型 <span class="glyphicon glyphicon-chevron-down"></span></a>
						<ul class="dropdown-submenu dropdown-menu">
							<c:forEach items="${tlist }" var="t">
								<li><a href="showHouseType.do?bid=${t.id }">${t.name }</a></li>
							</c:forEach>
						</ul>
					</li>
					<li>
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">地区 <span class="glyphicon glyphicon-chevron-down"></span></a>
						<ul class="dropdown-submenu dropdown-menu">
							<c:forEach items="${dlist }" var="t">
								<li><a href="selectHouseList.do?addr2=${t.id }">${t.name }</a></li>
							</c:forEach>
						</ul>
					</li>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜品分类 <span class="glyphicon glyphicon-chevron-down"></span></a>
                        <ul class="dropdown-submenu dropdown-menu">
                            <c:forEach items="${clist }" var="t">
                                <li><a href="searchGoods.do?fid=${t.id }">${t.name }</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="fnewsList.do">公告</a></li>
                    <li><a href="houseList_hot.do">热门房间</a></li>
                    <li><a href="houseList.do">房间</a></li>
                    <li><a href="showGoods.do">菜品</a></li>
                    <!-- <li><a href="goodsList_jf.do">积分兑换 </a></li> -->
                    <li><a href="myBbsList.do">投诉反馈</a></li>
                    <%--<li><a href="myBbsList_dc.do">在线订餐</a></li>--%>
                </ul>
            </div>
        </div>
    </nav>



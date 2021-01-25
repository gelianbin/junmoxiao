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
 		<h2 class="this-title">订单列表</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">订单列表</li>
 		</ol>
 	</div>
 </section>
 
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>用户评价信息</h2>
             <h3>yong hu ping jia xin xi</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-12">
 <div class="datalist_show">
  <div class="datatable_height confirm">
 <table class="table table_list table_striped table-bordered" id="covar_list">
  <thead>
    <tr>
		<!-- <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
		<th >编号</th>
		<th >名称</th>
		<th >图片</th>
		<th >评价时间</th>
		<th >评分</th>
		<th >评价内容</th>
		<th >目前状态</th>
		<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="o">
     <tr>
    <!--  <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td> -->
     <td>${o.ono}</td>
     <td>
         <c:if test="${o.btype=='1'}">
             <c:forEach items="${hlist }" var="h">
                 <c:if test="${h.id==o.fid }">
                     <a href="showHouse.do?id=${h.id }">${h.name }</a>
                 </c:if>
             </c:forEach>
         </c:if>
         <c:if test="${o.btype=='2'}">
             <c:forEach items="${glist }" var="h">
                 <c:if test="${h.id==o.fid }">
                     <a href="showGoodsx.do?id=${h.id }">${h.name }</a>
                 </c:if>
             </c:forEach>
         </c:if>
     </td>
     <td>
         <c:if test="${o.btype=='1'}">
             <c:forEach items="${hlist }" var="h">
                 <c:if test="${h.id==o.fid }">
                     <a href="showHouse.do?id=${h.id }">
                         <img src="./upload/${h.img }" width="50" height="30"/></a>
                 </c:if>
             </c:forEach>
         </c:if>
         <c:if test="${o.btype=='2'}">
             <c:forEach items="${glist }" var="h">
                 <c:if test="${h.id==o.fid }">
                     <a href="showGoodsx.do?id=${h.id }"><img src="./upload/${h.img }" width="50" height="30"/></a>
                 </c:if>
             </c:forEach>
         </c:if>
     </td>
     <td>${o.pjtime }</td>
     <td>${o.scope }</td>
     <td>${o.pj }</td>
     <%-- <td>${o.huifu}</td> --%>
     <td>${o.status }</td>
     <!--  <td class="td-status"><span class="label label-success radius">代发货</span></td> -->
     <td>
    <!--  <a onClick="Delivery_stop(this,'10001')"  href="javascript:;" title="发货"  class="btn btn-xs btn-status">发货</a> --> 
     <c:if test="${o.status=='待评价' }">
     	<a title="评价"  href="doUserOrderPj.do?id=${o.id }"  class="btn btn-xs btn-info" >评价</a> 
     </c:if>
     
     <%-- <c:if test="${o.status=='已评价' }">
     	<a title="修改评价"  href="doUpdatePj.do?id=${o.id }"  class="btn btn-xs btn-info" >修改评价</a> 
     	<a title="删除评价"  href="deleteOrderPj_user.do?id=${o.id }"  class="btn btn-xs btn-info" >删除评价</a> 
     </c:if> --%>
     
<!--      <a title="订单详细"  href="order_detailed.html"  class="btn btn-xs btn-info" >退房</a> 
     <a title="删除" href="javascript:;"  onclick="Order_form_del(this,'1')" class="btn btn-xs btn-delete" >删除</a> -->    
     </td>
     </tr>
    </c:forEach>
    <tr>
    <td colspan="11">
    <c:if test="${sessionScope.p==1 }">  
     当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="forderList.do?page=1" >首页</a>
             	<a href="forderList.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="forderList.do?page=${page.page+1 }">下一页</a>
				<a href="forderList.do?page=${page.totalPage }">末页</a>
		    	</c:if> 
				</c:if>
    </td>
    </tr>
     </tbody>
     </table>
    </div>
    
    </div>
    
    
    
 </div>
 </div>
 </section>


</body>
</html>


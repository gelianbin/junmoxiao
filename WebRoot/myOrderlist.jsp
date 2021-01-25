<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
 <script type="text/javascript">
function checktime(i){  
    if(i<10){  
        i="0"+i;  
  
    }  
    else{i=i;}  
    return i;  
   }  
//倒计时2 
   function freshTime2(){  
	var cc=$("#otime2").val();
    var endtime=new Date(cc);  
    var nowtime=new Date();  
    var lefttime=parseInt(endtime.getTime()-nowtime.getTime()+48*60*60*1000); 
    
    var dm=24*60*60*1000;  
    var d=parseInt(lefttime/dm);  
    var hm=60*60*1000;  
    var h=parseInt((lefttime/hm)%24);  
    var mm=60*1000;  
    var m=parseInt((lefttime/mm)%60);  
    var s=parseInt((lefttime/1000)%60);  
    m=checktime(m);  
    s=checktime(s);  
    document.getElementById('LeftTime2').innerHTML="还剩"+d+"天"+h+"小时"+m+"分钟"+s+"秒";  
    if (lefttime<0) {  
         document.getElementById('LeftTime2').innerHTML="限制发货已结束！";  
    }  
   }   
   freshTime2();  
   var sh;  
   sh=setInterval('freshTime2()',1000) 
  </script> 

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
         <h2>用户订单信息</h2>
             <h3>yong hu ding dan xin xi</h3>
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
		<th >房间名称</th>
		<th >房间图片</th>
		<th >下单时间</th>
		<th >预订时间</th>
		<th >到期时间</th>
		<th >总价</th>
		<th >人数</th>
		<th>天数</th>
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
     <c:forEach items="${hlist }" var="h">
     	<c:if test="${h.id==o.fid }">
     		<a href="showHouse.do?id=${h.id }">${h.name }</a>
     	</c:if>
     </c:forEach>
     </td>
     <td><c:forEach items="${hlist }" var="h">
     	<c:if test="${h.id==o.fid }">
     		<img src="./upload/${h.img }" width="50" height="30"/>
     	</c:if>
     </c:forEach>
     </td>
     <td>${o.pubtime }</td>
     <td>${o.stime }</td>
     <td>${o.etime }</td>
     <td>${o.zprice }</td>
     <td>${o.amount }</td>
     <td>${o.day }</td>
     <td>${o.status }</td>
     <td>
     <c:if test="${o.status=='已住' }">
     	<a title="提前退房"  href="tuiFang0.do?id=${o.id }"  class="btn btn-xs btn-info" >提前退房</a> 
     </c:if>
     <c:if test="${o.status=='成功订单' }">
     	<a title="取消"  href="order_quXiao2.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
      <c:if test="${o.status=='待退房' }">
     	<a title="退房"  href="tuiFang0.do?id=${o.id }"  class="btn btn-xs btn-info" >退房</a> 
     </c:if>
      <c:if test="${o.status=='待支付' }">
     	<a title="支付"  href="order_zhiFu.do?id=${o.id }"  class="btn btn-xs btn-info" >支付</a> 
     	<a title="取消"  href="order_quXiao.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
      <c:if test="${o.status=='已支付,待确认' }">
     	<a title="取消"  href="order_quXiao.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
     <c:if test="${o.status=='待评价' }">
     	<a title="评价"  href="doUserOrderPj.do?id=${o.id }"  class="btn btn-xs btn-info" >评价</a> 
     </c:if>
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


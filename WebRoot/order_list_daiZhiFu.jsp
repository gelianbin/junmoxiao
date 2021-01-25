<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 function checktime(i){  
	    if(i<10){  
	        i="0"+i;  
	  
	    }  
	    else{i=i;}  
	    return i;  
	   }  
	//倒计时1
	   function freshTime1(){  
		var cc=$("#otime1").val();
	    var endtime=new Date(cc);  
	    var nowtime=new Date();  
	   // var lefttime=parseInt(endtime.getTime()-nowtime.getTime()+48*60*60*1000); 
	    var lefttime=parseInt(endtime.getTime()-nowtime.getTime()+3*60*1000); 
	   // var dm=24*60*60*1000;  
	    //var d=parseInt(lefttime/dm);  
	   // var hm=60*60*1000;  
	   // var h=parseInt((lefttime/hm)%24);  
	    var mm=60*1000;  
	    var m=parseInt((lefttime/mm)%60);  
	    var s=parseInt((lefttime/1000)%60);  
	    m=checktime(m);  
	    s=checktime(s);
	    $("#LeftTime1").html("还剩"+m+"分钟"+s+"秒");
	    //document.getElementById('LeftTime1').innerHTML="还剩"+d+"天"+h+"小时"+m+"分钟"+s+"秒";  
	    if (lefttime<0) {  
	    	 $("#LeftTime1").html("3分钟内付款已结束");
	    	 window.location.href='order_daiZhiFu.do';
	    	/*  var oid = $("#orderid").val();
	    	 $.ajax({
					url : "order_chaoShi.do",
					type : "post",
					data : "id=" + oid,
					dataType : "json",
					success:function(result){
					if(result.info=="ng"){
					$("#checku").html("用户名存在，请更换！");
					$("input[id=username]").focus();
					return false;
					}else{
					$("#checku").html("可以用");
					return true;
					}
					},
					error:function(){
					alert("请求失败！");
					return false;
					}

				}); */
	    }  
	   }   
	   freshTime1();  
	   var sh;  
	   sh=setInterval('freshTime1()',1000) 
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
		<th >房卡编号</th>
		<th >房间名称</th>
		<th >房间图片</th>
		<th >下单时间</th>
		<th >预订时间</th>
		<th >到期时间</th>
		<th >总价</th>
		<th >人数</th>
		<th>天数</th>
		<th >目前状态</th>				
		<!-- <th >剩余支付时间</th>				 -->
		<!-- <th width="180px">所属类型</th>
		<th width="80px">数量</th> -->
		<!-- <th width="70px">状态</th>  -->               
		<th width="100px">操作</th>
	</tr>  
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="o" varStatus="num">
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
      <c:if test="${o.status=='订单确认，待支付' }">
     	<a title="支付"  href="order_zhiFu.do?id=${o.id }"  class="btn btn-xs btn-info" >支付</a> 
     	<a title="取消"  href="order_quXiao.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
      <c:if test="${o.status=='预约,待确认' }">
     	<a title="取消"  href="order_quXiao.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
     </td>
     </tr>
    </c:forEach>
    <tr>
    <td colspan="15">
    <img alt="" src="">
    <%-- <c:if test="${sessionScope.p==1 }">  
     当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="forderList.do?page=1" >首页</a>
             	<a href="forderList.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="forderList.do?page=${page.page+1 }">下一页</a>
				<a href="forderList.do?page=${page.totalPage }">末页</a>
		    	</c:if> 
				</c:if> --%>
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


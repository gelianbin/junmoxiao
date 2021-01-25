<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<script type="text/javascript" src="js/shop.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
<script type="text/javascript"> 
$(function(){ 
$(".add").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())+1) 
setTotal(); 
}) 
$(".min").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())-1) 
if(parseInt(t.val())<=0){ 
t.val(1); 
} 
setTotal(); 
}) 
function setTotal(){ 
var s=0;
var vtype = $("#vtype").val();
//alert(typeof(vip));
$("#shop-xx #num22").each(function(){
		 s+=parseFloat($(this).find('span[class*=price]').text()); 
//s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text()); 
});
 if (vtype=="VIP1") {
    s =s*0.95;
}else if (vtype=="VIP2") {
	s =s*0.90;
}else if (vtype=="VIP3"){
	s =s*0.85;;
} else if (vtype=="VIP4"){
	s =s*0.8;;
}else if (vtype=="VIP5"){
	s =s*0.7;;
}else {
	s =s*1;;
}  

document.getElementById("total").value=s.toFixed(2);
//("input[id=total]").html(s.toFixed(2)); 
} 
setTotal(); 


}) 

</script>
<jsp:include page="top.jsp"></jsp:include>
 
<!-- Header  Slider style-->
<section class="row final-inner-header">
 	<div class="container">
 		<h2 class="this-title">购物车列表</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">购物车列表</li>
 		</ol>
 	</div>
 </section>
 
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>用户购物车信息</h2>
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
		<th >名称</th>
		<th >图片</th>
		<th >下单时间</th>
		<th >预订时间</th>
		<th >到期时间</th>
		<th >总价</th>
		<th >人数</th>
		<th>数量</th>
		<th >目前状态</th>				
		<th width="200px">操作</th>
	</tr>  
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="o">
     <tr id="shop-xx">
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
                         <img src="./upload/${h.img }" width="50" height="30"/>
                     </a>
                 </c:if>
             </c:forEach>
         </c:if>
         <c:if test="${o.btype=='2'}">
             <c:forEach items="${glist }" var="h">
                 <c:if test="${h.id==o.fid }">
                     <a href="showGoodsx.do?id=${h.id }">
                         <img src="./upload/${h.img }" width="50" height="30"/>
                     </a>
                 </c:if>
             </c:forEach>
         </c:if>
     </td>
     <td>${o.pubtime }</td>
     <td>${o.stime }</td>
     <td>${o.etime }</td>
     <td id="num22"><span class="price">${o.zprice }</span></td>
     <td >${o.amount }</td>
     <td> ${o.day }</td>
     <td>${o.status }</td>
     <td>
      <c:if test="${o.status=='待支付' }">
     	<%--<a title="支付"  href="order_zhiFu.do?id=${o.id }"  class="btn btn-xs btn-info" >支付</a> --%>
     	<a title="取消"  href="order_quXiao.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
      <c:if test="${o.status=='预约,待支付' }">
     	<a title="取消"  href="order_quXiao.do?id=${o.id }"  class="btn btn-xs btn-info" >取消</a> 
     </c:if>
     </td>
     </tr>
    </c:forEach>
     </tbody>
     
     <tr>
						<td colspan="4">
						<img alt="" src="images/zhifu.png" width="600px;" height="300px;">
						</td>
						<td colspan="8">
						<form action="order_zhiFu_all.do" method="post">
						<div id="js">
						<ul style="    list-style: none;">
						<li style="    margin-top: 10px;">应付金额：<label >
                            <input type="text" name="zprice" id="total" readonly="readonly" style="width:100px"/>元 </label>
                            用户级别：<input type="text" value="${user.vtype}" id="vtype" readonly="readonly">
                        </li>
                            <li style="    margin-top: 10px;"><label>用户余额：</label>
                                <input type="text" value="${user.money}" readonly>
                            </li>
						<li style="margin-top: 10px;">
						<input name="button" type="submit" id="button" class="btn btn-warning" value="确认支付"  /></li>
						</ul>
						</div>
						</form>
						</td>
						</tr>
     </table>
    </div>
    </div>
    
    
    
      </div>
     
      </div>
    
    </section> 


</body>
</html>


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
 		<h2 class="this-title">我的兑换列表</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">我的兑换列表</li>
 		</ol>
 	</div>
 </section>
 
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>我的兑换信息</h2>
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
		<th >礼品名称</th>
		<th >积分</th>
		<th >用户</th>
		<th >兑换时间</th>
		<%--<th width="200px">操作</th>--%>
	</tr>  
  </thead>
  <tbody>
  <c:forEach items="${list }" var="o" varStatus="num">
      <tr>
          <td>${num.count}</td>
          <td><c:forEach items="${glist}" var="g">
              <c:if test="${g.id==o.gid }">
                  <a href="showGoodsx_jf.do?id=${g.id }">${g.name }</a>
              </c:if></c:forEach></td>
          <td><c:forEach items="${glist}" var="g">
              <c:if test="${g.id==o.gid }">
                  ${g.kcnum }
              </c:if></c:forEach></td>
          <td><c:forEach items="${ ulist}" var="g">
              <c:if test="${g.uid==o.uid }">${g.tname }</c:if></c:forEach></td>
          <td>${o.pubtime }</td>
      </tr>
  </c:forEach>
    <tr>
    <td colspan="11">
    <c:if test="${sessionScope.p==1 }">  
     当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="recordList.do?page=1" >首页</a>
             	<a href="recordList.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="recordList.do?page=${page.page+1 }">下一页</a>
				<a href="recordList.do?page=${page.totalPage }">末页</a>
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


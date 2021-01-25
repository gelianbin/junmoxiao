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
 		<h2 class="this-title">我的投诉反馈</h2>
 	</div>
 </section>
 <section class="row final-breadcrumb">
 	<div class="container">
 		<ol class="breadcrumb">
 			<li><a href="index.do">首页</a></li>
 			<li class="active">我的投诉反馈</li>
 		</ol>
 	</div>
 </section>
 
  <section class="container clearfix common-pad booknow">
    <div class="sec-header">
         <h2>投诉反馈信息</h2>
             <h3>yong hu liu yan xin xi</h3>
         </div> 
        
     <div class="row nasir-contact">
      <div class="col-md-12">
 
 <div class="datalist_show">
  <div class="datatable_height confirm">
 <table class="table table_list table_striped table-bordered" id="covar_list">
  <thead>
    <tr>
		<!-- <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> -->
		<th>标题</th>
		<th>投诉反馈内容</th>
		<th>添加时间</th>
		<th>回复内容</th>
		<th>目前状态</th>				
		<th width="100px">操作</th>
	</tr>  
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="o">
     <tr>
    <!--  <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td> -->
     <td>${o.name}</td>
     <td>${o.note}</td>
     <td>${o.pubtime }</td>
     <td>${o.note2 }</td>
     <td>${o.status }</td>
     <td><a href="deleteBbsFore.do?id=${o.id }">删除</a></td>
     </tr>
    </c:forEach>
    <tr>
    <td colspan="10"><a href="bbs_add.jsp">添加在线投诉反馈</a></td>
    </tr>
    <tr>
    <td colspan="11">
    <c:if test="${sessionScope.p==1 }">  
     当前第${page.page}页；共${page.totalPage}页；总共${page.total}条记录；
				<c:if test="${page.page>1}">
              	<a href="bbsList.do?page=1" >首页</a>
             	<a href="bbsList.do?page=${page.page-1 }"> 上一页</a> 
             	</c:if>
    	     	<c:if test="${page.page<page.totalPage}">
				<a href="bbsList.do?page=${page.page+1 }">下一页</a>
				<a href="bbsList.do?page=${page.totalPage }">末页</a>
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


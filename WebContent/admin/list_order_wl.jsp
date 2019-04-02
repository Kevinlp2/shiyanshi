<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="orderquery_wl" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <!-- <a class="button border-main icon-plus-square-o" href="add.html"> 添加内容</a> --> </li>
        <li>
          </li>
        
        <li>
        <input type="text" placeholder="请输入搜索的订单人的名字" name="order.uname" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="text" placeholder="请输入搜索商品名称" name="order.goods.name" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="text" placeholder="请输入搜索的订单状态" name="order.ostate" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="hidden" name="order.goods.userinfo" value="<s:property value="#session.cuser"/>"/>
          <input type="submit"  class="button border-main icon-search" value="搜索" ></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="60" >用户名</th>
        <th width="200">所选商品</th>
        <th>订单状态</th>
        <th>订单时间</th>
        <th>订单数</th>
        <th>用户评价</th>
       
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
       <s:iterator value="page.pageList" >
        <tr>
          <td >  <s:property value="userinfo.uname" /></td>
          
          <td><s:property value="goods.name" /></td>
          <td><s:property value="ostate" /></td>
          <td><s:date name="date" format="yyyy-MM-dd" /></td>
          <td><s:property value="amount" /></td>
          <s:if test="pj==null"><td>还没有评论</td></s:if><s:else>
          <td><s:property value="pj" /></td></s:else>
          
          
          <td><div class="button-group">
          <s:if test="ostate=='已支付'"> <a class="button border-main" href="orderfahuo?order.oid=<s:property value="oid" />"><span class="icon-edit"></span> 确认发货</a> </s:if>
          <s:elseif test="ostate=='已发货'"> 已发货,运输中</s:elseif>
          <s:elseif test="ostate=='确认收货'">已妥投,已收货</s:elseif>
          <s:elseif test="ostate=='已退货'">已退货退款</s:elseif>
          <s:elseif test="ostate=='退货'">
          <a class="button border-main" href="orderqueren?order.oid=<s:property value="oid" />"><span class="icon-edit"></span> 确认退货</a></s:elseif>

          
          </div></td>
        </tr>
      
        </s:iterator>
     
   		 
      <tr>
      <s:if test="#session.p!=2">
       <td colspan="2">当前显示第
			<s:property value="page.pageIndex" />
			页
			</td><td colspan="1">共
			<s:property value="page.totalpages" />
			页</td>
			<td colspan="4">
			<div align="center">
				<a href="orderlist_wl.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="orderlist_wl.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="orderlist_wl.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="orderlist_wl.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>
			</div></td> 
			</s:if><s:else >
			<td colspan="2">当前显示第
			<s:property value="page.pageIndex" />
			页
			</td><td colspan="1">共
			<s:property value="page.totalpages" />
			页</td>
			<td colspan="4">
			<div align="center">
				<a href="orderquery_wl.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="orderquery_wl.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="orderquery_wl.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="orderquery_wl.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>
			</div></td> 
			</s:else>     
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>
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
<form method="post" action="searchPersion" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="doaddgoods"> 添加内容</a> </li>
        <li> <input type="text" name="f1.name" class="input"  placeholder="请输入搜索的产品的名称"></li>
        <li >
        <select name="f1.ftype.fid" style="width:100px; line-height:25px;display:inline-block" >
        <option value="" >请选择所属商品种类</option>
       <s:iterator value="ftlist">
        <option value="<s:property value="fid" />"><s:property value="ftype" /></option>
        </s:iterator>
         </select></li><li>
         <select name="f1.pricle" style="width:100px; line-height:17px;display:inline-block">
              <option value="" >请选择价格区间</option>
              <option value="1">100元以内</option>
              <option value="2">100-200元</option>
              <option value="3">200-300元</option>
              <option value="4">300-500元</option>
              <option value="5">500-800元</option>
              <option value="6">800元以上</option>
             
             </select></li><li>
             <select name="f1.day" style="width:100px; line-height:17px;display:inline-block">
              <option value="">请选择是否为推荐</option>
              <option value="shi">推荐</option>
              <option value="fou">非推荐</option>
             </select></li><li>
           <select name="f1.object" style="width:100px; line-height:17px;display:inline-block">
              <option value="">请选择是否为促销</option>
              <option value="shi">促销</option>
              <option value="fou">非促销</option>
            
             </select></li><li>
         <input type="submit"  class="button border-main icon-search" value="搜索" ></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="15" >产品编号</th>
        <th width="80">产品名称</th>
        <th width="60">图片</th>
        <th width="80">价格(元)</th>
        <th width="60">是否推荐</th>
        <th>重量</th>
        <th width="60">是否促销</th>
        <th width="200">操作</th>
      </tr>
      <volist name="list" id="vo">
       <s:iterator value="page.pageList" >
        <tr>
          <td >
           <s:property value="id" /></td>
          <td><s:property value="name" /></td>
          <td width="10%"><img src="./upload/<s:property value="img" />" alt="" width="70" height="50" /></td>
          
          <td><s:property value="pricle" /></td>
          <td><s:property value="object" /></td>
          <td><s:property value="weight" /></td>
          <td><s:property value="day" /></td>
          <td><div class="button-group"> <a class="button border-main" href="doUpdateGoods?id=<s:property value="id" />"><span class="icon-edit"></span> 修改</a> 
          <a class="button border-red" href="deleteGoods?id=<s:property value="id" />" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        </s:iterator>
   		 
      <tr>
     <s:if test="#session.p!=3">
       <td colspan="2">当前显示第
			<s:property value="page.pageIndex" />
			页
			</td><td colspan="1">共
			<s:property value="page.totalpages" />
			页</td>
			<td colspan="5">
			<div align="center">
				<a href="querygoods_persion.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="querygoods_persion.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="querygoods_persion.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="querygoods_persion.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>


			</div></td>  
			</s:if>  <s:elseif test="#session.p==3">
			 <td colspan="2">当前显示第
			<s:property value="page.pageIndex" />
			页
			</td><td colspan="1">共
			<s:property value="page.totalpages" />
			页</td>
			<td colspan="5">
			<div align="center">
				<a href="searchPersion.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="searchPersion.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="searchPersion.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="searchPersion.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>
			</div></td>
			
			</s:elseif>  
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
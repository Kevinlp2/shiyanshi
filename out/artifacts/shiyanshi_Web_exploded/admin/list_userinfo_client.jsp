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

  <div class="panel admin-panel">
  <form method="post" action="querylistClient" >
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> </li>
        <li>
          </li>
        <li>
          <input type="hidden" name="user.level" value=1>
          <input type="text" placeholder="请输入搜索用户名" name="user.uname" class="input" style="width:250px; line-height:17px;display:inline-block" />
        <input type="submit"  class="button border-main icon-search" value="搜索" ></li>
      </ul>
    </div>
    </form>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">用户名</th>
        <s:if test="#session.cuser.uname=='admin'" ><th >密码</th></s:if>
        <th>性别</th>
        <th>电话</th>
        <th>用户身份</th>
        <th>地址</th>
    
        <!-- <th width="310">操作</th> -->
      </tr>
       <s:iterator value="page.pageList" >
        <tr>
          <td style="text-align:left; padding-left:20px;">
           <s:property value="uname" /></td>
          
          <s:if test="#session.cuser.uname=='admin'" ><th ><s:property value="pwd" /></th></s:if>
          
           <s:if test="sex==null"><td>无</td></s:if><s:else>
          <td><s:property value="sex" /></td></s:else>
          
          <s:if test="tel==null"><td>无</td></s:if><s:else>
          <td><s:property value="tel" /></td></s:else>
          <td>普通用户</td>
        <%--   <s:if test="level==1"><td>普通用户</td></s:if>
          <s:elseif test="level==2"><td>企业用户</td></s:elseif>
          <s:elseif test="level==3"><td>管理员</td></s:elseif><s:else>
          <td><s:property value="level" /></td></s:else> --%>
          <td><s:property value="address" /></td>
         <%--  <td><div class="button-group"> <a class="button border-red" href="deleteuser?user.uid=<s:property value="uid" />" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td> --%>
        </tr>
      
        </s:iterator>
     
   		 
      <tr>
      	<s:if test="#session.p!=1">
       <td colspan="2">当前显示第
			<s:property value="page.pageIndex" />
			页</td><td colspan="1">共
			<s:property value="page.totalpages" />
			页</td>
			<td colspan="3"><div align="center">
				<a href="upage.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="upage.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="upage.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="upage.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>
			</div></td>  </s:if> 
			<s:if test="#session.p==1">
			<td colspan="6">当前显示第
			<s:property value="page.pageIndex" />
			页
			<div align="center">
				<a href="querylistClient.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="querylistClient.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="querylistClient.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="querylistClient.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>


			</div></td>
			</s:if>
		
      </tr>
    </table>
  </div>

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
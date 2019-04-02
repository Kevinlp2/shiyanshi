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
  <form method="post" action="userListQuery.do" >
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="add_user.jsp"> 添加内容</a> </li>
        <li>
          </li>
        
        <li>
          <input type="text" placeholder="请输入搜索用户名" name="uname" class="input" style="width:250px; line-height:17px;display:inline-block" />
        <input type="submit"  class="button border-main icon-search" value="搜索" ></li>
      </ul>
    </div>
    </form>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">用户名</th>
       <th >密码</th>
        <th>性别</th>
        <th>电话</th>
        <th>用户身份</th>
        <th>地址</th>
        <th width="310">操作</th>
      </tr>
       <c:forEach items="${list }" var="u">
        <tr>
          <td >${u.uname }</td>
          <th >${u.pwd }</th>
          <td>${u.sex }</td>
          <td>${u.tel }</td>
          <td>${u.utype }</td>
          <td>${u.address}</td>
          <td><div class="button-group">
          <a class="button border-main" href="doUpdateUser.do?id=${u.uid }" ><span class="icon-trash-o"></span>修改</a>  
          <a class="button border-red" href="deleteUser.do?id=${u.uid }" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
      
        </c:forEach> 
     
   		 
      <tr>
      <c:if test="${sessionScope.p==1 }">
		<td colspan="7"> <c:if test="${page.page>1}">
              <a href="userList.do?page=1" >首页</a>
             <a href="userList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="userList.do?page=${page.page+1 }">下一页</a>
			<a href="userList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="7"> <c:if test="${page.page>1}">
    <a href="userListQuery.do?page=1" >首页</a>
    <a href="userListQuery.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="userListQuery.do?page=${page.page+1 }">下一页</a>
			<a href="userListQuery.do?page=${page.totalPage }">末页</a>
		</c:if> 
		</td>
		</c:if>
      </tr>
    </table>
  </div>

<script type="text/javascript">

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}else{
		return false;
	}
	
}



</script>
</body>
</html>
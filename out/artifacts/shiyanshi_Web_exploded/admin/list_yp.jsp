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
<form method="post" action="vagueJianZhiList.do" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
       <%--  <li> <input type="text" name="name" class="input"  placeholder="请输入搜索的岗位的名称"></li>
        <li> <input type="text" name="xueli" class="input"  placeholder="请输入搜索的学历要求"></li>
        <li>
         <select name="addr" class="input w50" >
          <option value="">请选择</option>
         <c:forEach items="${adlist }" var="ad">
          <option value="${ftype }">${ad.ftype }</option>
          </c:forEach>
        </select>
       <li>
         <input type="submit"  class="button border-main icon-search" value="搜索" ></li> --%>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>应聘者姓名</th>
        <th>应聘者学历</th>
        <th>应聘者经验</th>
        <th>应聘者专业</th>
        <th>应聘岗位</th>
        <th>岗位学历要求</th>
        <th>岗位经验要求</th>
        <th>应聘状态</th>
        <th width="200">操作</th>
      </tr>
       <c:forEach items="${list }" var="yp">
       
        
        <tr>
         <c:forEach items="${ulist }" var="u">
        <c:if test="${yp.uid==u.uid }">
          <td>${u.tname}</td>
          <td>${u.xueli}</td>
          <td>${u.experience }</td>
          <td>${u.profession }</td>
           </c:if>
           </c:forEach>
           <c:forEach items="${jzlist }" var="jz">
           <c:if test="${yp.fid==jz.id }">
          <td>${jz.name}</td>
          <td>${jz.xueli}</td>
          <td>${jz.experience }</td>
          </c:if>
          </c:forEach>
          <td>${yp.status }</td>
          
          <td><div class="button-group"> <c:if test="${yp.status=='待录取' }">
          <a class="button border-main" href="luQu.do?kid=${yp.kid }"><span class="icon-edit"></span>录取</a> 
         
          <a class="button border-red" href="bLuQu.do?kid=${yp.kid }" onclick="return del(1,1,1)"><span class="icon-trash-o"></span>不录取</a>
            </c:if>
            <c:if test="${yp.status=='录取' }">
            已录取
            </c:if>
           </div></td>
       
        </tr>
       </c:forEach>
       
       
   		 
      <tr>
     <c:if test="${sessionScope.p==1 }">
		<td colspan="7"> <c:if test="${page.page>1}">
              <a href="yingPinList.do?page=1" >首页</a>
             <a href="yingPinList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="yingPinList.do?page=${page.page+1 }">下一页</a>
			<a href="yingPinList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="7"> <c:if test="${page.page>1}">
    <a href="vagueJianZhiList.do?page=1" >首页</a>
    <a href="vagueJianZhiList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="vagueJianZhiList.do?page=${page.page+1 }">下一页</a>
			<a href="vagueJianZhiList.do?page=${page.totalPage }">末页</a>
		</c:if> 
		</td>
		</c:if>
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



</script>
</body>
</html>
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
<script type="text/javascript" src="/shiyanshi/admin/js/Date.js"></script>
<script type="text/javascript" src="/shiyanshi/admin/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form method="post" action="forderTongJiList.do" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
         <li> <input type="text" name="stime1" value="${stime1 }"  autocomplete="off" class="input" onclick="WdatePicker()"  placeholder="开始时间..."  ></li><!-- onFocus="HS_setDate(this)" -->
         <li> <input type="text" name="etime1" value="${etime1 }"  autocomplete="off" class="input" onclick="WdatePicker()"  placeholder="结束时间..."  ></li><!-- onFocus="HS_setDate(this)" -->
         <li> 
       <!--   <select name="etime" class="input">
         <option value="设备">设备</option>
         <option value="耗材">耗材</option>
         <option value="实验室">实验室</option>
         </select> -->
         </li>
       <li>
         <input type="submit"  class="button border-main icon-search" value="搜索" ></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       
        <th>类别名称</th>
        <th>次数</th>
      </tr>
    <c:forEach items="${list }" var="t">
        <tr>
          <td>${t.name}</td>
          <td>${t.amount }</td>
        </tr>
       </c:forEach>
   		
      <%-- <tr>
         <c:if test="${sessionScope.p==1 }">
		<td colspan="7"> <c:if test="${page.page>1}">
              <a href="fAddrList.do?page=1" >首页</a>
             <a href="fAddrList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="fAddrList.do?page=${page.page+1 }">下一页</a>
			<a href="fAddrList.do?page=${page.totalPage }">末页</a>
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
      </tr> --%>
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
		return true;
	}else{
		return false;
	}
}

</script>
</body>
</html>
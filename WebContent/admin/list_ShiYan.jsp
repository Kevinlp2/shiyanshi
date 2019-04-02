<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<form method="post" action="vagueShiYanList.do" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<c:if test="${sessionScope.auser.utype=='实验室管理员' }">
						<li><a class="button border-main icon-plus-square-o"
							href="add_ShiYan.jsp"> 添加内容</a></li>
					</c:if>
					<li><input type="text" name="name" class="input"
						placeholder="请输入搜索的名称"></li>
					<li><input type="submit"
						class="button border-main icon-search" value="搜索"></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>名称</th>
					<th>位置</th>
					<th>目前状态</th>
					<th>发布时间</th>
					<th width="200">操作</th>
				</tr>
			
				<c:forEach items="${list }" var="yp">
					<tr>
						<td>${yp.name }</td>
						<td>${yp.address }</td>
						<td>${yp.mstatus }</td>
						<td>${yp.pubtime }</td>
						<td style="width: 300px">
							<div class="button-group">
								<c:if test="${sessionScope.auser.utype=='实验室管理员' }">
									<a class="button border-main"
										href="doUpdateShiYan.do?id=${yp.id }"><span
										class="icon-edit"></span>修改</a>
									<a class="button border-main"
									   href="doFindSyssb.do?id=${yp.id }"><span
											class="icon-edit"></span>查看设备</a>
									<a class="button border-red"
										href="deleteShiYan.do?id=${yp.id }"
										onclick="return del(1,1,1)"><span class="icon-trash-o"></span>删除</a>
								</c:if>
								<c:if test="${sessionScope.auser.utype=='老师' }">
									<c:if test="${yp.mstatus=='空闲中' }">
										<a class="button border-main" href="shenQin.do?id=${yp.id }"><span
											class="icon-edit"></span>申请</a>
									</c:if>

									
									<c:forEach items="${ forders}" var="fo">
										
										<c:if test="${ yp.id == fo.fid}">
											<c:if test="${fo.status=='审核通过' }">
												<a class="button border-main"
													href="guiHuan.do?id=${fo.kid }"><span class="icon-edit"></span>归还</a>
											</c:if>
											<c:if test="${fo.status=='待审核' }">
												<a class="button border-main"
													href="javascript:void(0)"><span class="icon-edit"></span>审核中</a>
											</c:if>
										</c:if>
									</c:forEach>

								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
				<tr>
					
					<c:if test="${sessionScope.p==1 }">
						<td colspan="7">
							有${page.totalPage}页共${page.total}条数据,当前是第${page.page}页&nbsp;&nbsp;&nbsp;
						<c:if test="${page.page>1}">
								<a href="ShiYanList.do?page=1">首页</a>
								<a href="ShiYanList.do?page=${page.page-1 }"> 上一页</a>
							</c:if> <c:if test="${page.page<page.totalPage}">
								<a href="ShiYanList.do?page=${page.page+1 }">下一页</a>
								<a href="ShiYanList.do?page=${page.totalPage }">末页</a>
							</c:if></td>
					</c:if>
					<c:if test="${sessionScope.p==2 }">
						<td colspan="7">
						有${page.totalPage}页共${page.total}条数据,当前是第${page.page}页&nbsp;&nbsp;&nbsp;
						<c:if test="${page.page>1}">
								<a href="vagueShiYanList.do?page=1">首页</a>
								<a href="vagueShiYanList.do?page=${page.page-1 }"> 上一页</a>
							</c:if> <c:if test="${page.page<page.totalPage}">
								<a href="vagueShiYanList.do?page=${page.page+1 }">下一页</a>
								<a href="vagueShiYanList.do?page=${page.totalPage }">末页</a>
							</c:if></td>
					</c:if>
				</tr>
			</table>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {

		})
		//搜索
		function changesearch() {

		}

		//单个删除
		function del(id, mid, iscid) {
			if (confirm("您确定要删除吗?")) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>
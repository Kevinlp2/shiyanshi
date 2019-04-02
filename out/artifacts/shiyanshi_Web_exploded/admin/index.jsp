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
<title>后台管理中心</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<style type="text/css">
</style>
<script src="js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top" style="color: #000;">
			<h1>
				<img src="images/y.jpg" class="radius-circle rotate-hover"
					height="50" alt="" /> 欢迎 <span>${sessionScope.auser.uname}</span> 登陆实验室设备管理系统
			</h1>
		</div>
		<div class="head-l">
			<!-- <a class="button button-little bg-green" href="http://localhost:8080/shiyanshi/showIndex.do" target="_blank"><span class="icon-home"></span> 前台首页</a> -->
			&nbsp;&nbsp; &nbsp;&nbsp;<a class="button button-little bg-red"
				href="loginout.do"><span class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title" style="color: #000;">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>信息管理
		</h2>
		<ul style="display: block">
			<c:if test="${sessionScope.auser.uname=='admin' }">
				<li><a href="userList.do" target="right"><span
						class="icon-caret-right"></span>用户管理</a></li>
				<%-- <li><a href="pass.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li> --%>
			</c:if>
			<c:if test="${sessionScope.auser.uname!='admin' }">
				<li><a href="showUserInfo.do" target="right"><span
						class="icon-caret-right"></span>个人信息管理</a></li>
				<!-- <li><a href="cpage" target="right"><span class="icon-caret-right"></span>信息查询</a></li> -->
				<%--  <li><a href="doUpdatePwd?id=<s:property value="#session.cuser.uid"/>" target="right"><span class="icon-caret-right"></span>修改密码</a></li> --%>
			</c:if>

		</ul>
		<c:if test="${sessionScope.auser.utype!='管理员' }">
			<h2>
				<span class="icon-pencil-square-o"></span>基础管理
			</h2>
			<ul>
			<c:if test="${sessionScope.auser.utype=='老师'}">
				<li><a href="ShiYanList.do" target="right"><span class="icon-caret-right"></span>实验室管理</a></li>
			</c:if>
				<c:if test="${sessionScope.auser.utype=='实验室管理员' || sessionScope.auser.utype=='实验设备管理员'}">
					<c:if test="${sessionScope.auser.utype=='实验室管理员'}">
						<li><a href="ShiYanList.do" target="right"><span class="icon-caret-right"></span>实验室管理</a></li>
						<li><a href="shiYanShiForderList.do" target="right"><span class="icon-caret-right"></span>实验室申请管理</a></li>
					</c:if>
					<li><a href="SheBeiList.do" target="right"><span class="icon-caret-right"></span>设备管理</a></li>
					<!--  <li><a href="HaoCaiList.do" target="right"><span class="icon-caret-right"></span>耗材管理</a></li>-->
					<c:if test="${sessionScope.auser.utype=='实验设备管理员'}">
						<li><a href="sheBeiForderList.do" target="right"><span class="icon-caret-right"></span>设备记录管理</a></li>
						<!--  <li><a href="haoCaiForderList.do" target="right"><span class="icon-caret-right"></span>耗材记录管理</a></li>-->
					</c:if>
				</c:if>
			</ul>
		</c:if>
		<c:if test="${sessionScope.auser.uname=='admin' }">
			<h2>
				<span class="icon-pencil-square-o"></span>统计管理
			</h2>
			<ul>
				<li><a href="list_order_tongji.jsp" target="right"><span
						class="icon-caret-right"></span>查询统计管理</a></li>
			</ul>
		</c:if>

	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a target="right" class="icon-home"> 首页</a></li>
		<li><a href="##" id="a_leader_txt">网站信息</a></li>

	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="info.jsp" name="right"
			width="100%" height="100%"></iframe>
	</div>
	<div style="text-align: center;"></div>
</body>
</html>
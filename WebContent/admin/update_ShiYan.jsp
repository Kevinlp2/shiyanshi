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
<%-- <script src="js/pintuer.js"></script> --%>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="updateShiYan.do">  
      <div class="form-group" >
      <div  align="center">
        <div class="label" >
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${sy.name }" name="name" data-validate="required:请输入名称" />
          <div class="tips"><input type="hidden" value="${sy.id }" name="id" /></div>
        </div>
        </div>
        </div>
        <div class="form-group" >
      <div  align="center">
        <div class="label" >
          <label>目前状态：</label>
        </div>
        <div class="field">
        <select name="mstatus" class="input w50">
        <option value="空闲中" ${sy.mstatus=='空闲中'?'selected':''}>空闲中</option>
        <option value="已预订" ${sy.mstatus=='已预订'?'selected':''}>已预订</option>
        </select>
        <%--   <input type="text"  value="${sy.address }" name="address" /> --%>
          <div class="tips"></div>
        </div>
        </div>
        </div>
      <div class="form-group" >
      <div  align="center">
        <div class="label" >
          <label>位置：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${sy.address }" name="address" />
          <div class="tips"></div>
        </div>
        </div>
        </div>
       <div class="form-group" >
       <div  align="center">
        <div class="label" >
          <label></label>
        </div>
        <div class="field" align="center">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
      </div>
    </form>
  </div>
</div>

</body></html>
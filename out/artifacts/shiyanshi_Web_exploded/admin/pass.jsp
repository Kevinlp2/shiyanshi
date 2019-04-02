<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function checkPwd(){
	var pwd =$("#mpass").val();
	var ypwd=$("#ypwd").val();
	//alert(ypwd);
	if(pwd!=ypwd){
		alert("你输入的原始密码不正确！请重新输入！");
	//	$("input[id=mpass]").focus();
		return false;
	}
}
function checkAll(){
	var pwd =$("#mpass").val();
	var npass=$("#newpass").val();
	var npassc=$("#newpassc").val();
	if(pwd!=null&&npass!=null&&npass==npassc){
		return true;
	}else{
		alert("修改密码信息不完整，请填写完整！");
		return false;
	}
}
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="updatepwd">
      <div class="form-group">
        <div class="label">
          <label for="sitename">帐号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
         <input type="text" value="<s:property value="user.uname"/>" readonly="readonly">
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：<input type="hidden" id="ypwd" value="<s:property value="user.pwd"/>"></label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="mpass" name="mpass" size="18" placeholder="请输入原始密码" data-validate="required:请输入原始密码" onblur="return checkPwd()"/>       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="newpass" id="newpass" size="18" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=3:新密码不能小于3位" />         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="user.pwd" id="newpassc" size="18" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />          
        <input type="hidden" name="user.uid" value="<s:property value="user.uid" />">
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" onclick="return  checkAll()"> 提交</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>
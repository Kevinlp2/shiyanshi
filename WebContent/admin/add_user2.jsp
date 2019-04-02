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
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<%-- <script src="js/pintuer.js"></script> --%>
<script type="text/javascript">
	function checkuname() {
		var name = $("#username").val();
		if(name==""||(name.length<3||name.length>12)){
			 $("#checku").html("用户账号不能为空且长度在3～12位之间！");
			 $("input[id=username]").focus();
		} else {
			$("#checku").html("");
			$.ajax({
				url : "checkUname.do",
				type : "post",
				data : "uname=" + name,
				
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
				$("#checku").html("用户名存在，请更换！");
				$("input[id=username]").html("");
				return false;
				}else{
				$("#checku").html("可以用");
				return true;
				}
				},
				error:function(){
				alert("请求失败！");
				return false;
				}

			});
		}

	}
	 function checkpwd(){
		  var pwd=$("#txtPwd").val();
		  if(pwd==""||pwd.length<6||pwd.length>12){
		 $("#prompt_pwd").html("密码不能为空且长度在6～12位之间！");
		 $("input[id=txtPwd]").html("");
		  $("input[id=txtPwd]").focus();
		 return false;
		}else {
		 $("#prompt_pwd").html("密码格式正确！");
		return true;}

		}

		function checkpwdc(){
		var pwd=$("#txtPwd").val();
		var pwdc=$("#txtConfirmPwd").val();
		if(pwdc==""||pwdc!=pwd){
		  $("#prompt_confirmpwd").html("两次密码要一致 ！");
		  $("input[id=txtConfirmPwd]");
		   // $("input[name=passwordc]").focus();
		  return false;
		  }else{
		  $("#prompt_confirmpwd").html("密码一致 ！");
		  return true;}

		}

		 function checktel(){
		 var tel=$("#txtPhone").val();
		 var regtel=/^(13|15|18|)\d{9}$/;
		 if(tel==""||!regtel.test(tel)){
		  $("#prompt_phone").html("电话号码不能为空，且以13，15，17，18开头的11位");
		  $("input[id=txtPhone]").html("");
		   $("input[id=txtPhone]").focus();
		  return false;
		  }else{
		   $("#prompt_phone").html("电话号码格式正确！");
		  return true;
		  }

		 }
		 function checkname1(){ 
			  var uname=$("#txtName1").val();
			  if(uname==""||uname.length<2){
			  $("#prompt_name1").html("不能为空且长度在2位以上！");
			  $("input[id=txtName1]").html("");
			   $("input[id=txtName1]").focus();
			  return false;
			  }else{
			  
			  $("#prompt_name1").html("ok");
			  return true;
			  }} 
		  
		 function checkname2(){ 
			  var uname=$("#txtName2").val();
			  if(uname==""||uname.length<2){
			  $("#prompt_name1").html("不能为空且长度在2位以上！");
			  $("input[id=txtName2]").html("");
			   $("input[id=txtName2]").focus();
			  return false;
			  }else{
			  
			  $("#prompt_name2").html("ok");
			  return true;
			  }} 
		  
	function checkAll(){
		//alert("kkkkk");
		var flag=false;
		var aa = $("#username").val();
		var pwd=$("#txtPwd").val();
		var pwdc=$("#txtConfirmPwd").val();
		var tel=$("#txtPhone").val();
		/* var name1=$("#txtName1").val();
		var name2=$("#txtName2").val(); */
		 var regtel=/^(13|15|18|)\d{9}$/;
		 if(aa!=""&&(tel!=""||regtel.test(tel))&&
				 /* (name1!=""||name1.length>2)&&(name2!=""||name2.length>2)&& */
				 (pwd!=""||pwd.length>6||pwd.length<12)&&(pwdc!=""||pwdc==pwd)){
			 flag=true;
		 }else{
			 alert("注册信息不完整或不合规范！");
		 }
			return flag;
			
	}
</script>
</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="addUser2.do" >  
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="uname"  id="username"  onblur="return checkuname()" />
          <div id='checku' class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>性 别 ：</label>
        </div>
        <div class="field" >
            <input name="sex"   type="radio" id="radio" value="男" checked="checked" />
        男
        <input type="radio"   name="sex" id="radio2" value="女" />
        女
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>公司名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="tname"  id="tname"  onblur="return checkuname()" />
          <div id='checku' class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50"   id="txtPwd"   onblur="return checkpwd()"/>
          <div id='prompt_pwd'  class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>确认密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="pwd"   id="txtConfirmPwd" onblur="return checkpwdc()"/>
          <div id='prompt_confirmpwd' class="tips"></div>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>手机号：</label>
          </div>
          <div class="field">
           <input name="tel" type="text" class="input w50" id="txtPhone" onblur="return checktel()"/>
            <div  id='prompt_phone' class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>公司地址：</label>
          </div>
          <div class="field">
           <input  type="text" name="address" class="input w50"  />
            <div  id='' class="tips"></div>
          </div>
        </div>
        
       <!--   <div class="form-group">
          <div class="label">
            <label>预留问题 ：</label>
          </div>
          <div class="field">
           <input  type="text" name="mbanswer" id="txtName1" onblur="return checkname1()" class="input w50" />
            <div  id='prompt_name1' class="tips"></div>
          </div>
        </div>
          <div class="form-group">
          <div class="label">
            <label>问题答案：</label>
          </div>
          <div class="field">
           <input  type="text" name="mbanswer"id="txtName2" onblur="return checkname2()" class="input w50" />
            <div  id='prompt_name2' class="tips"></div>
          </div>
        </div> -->
        <div class="form-group">
          <div class="label">
            <label>公司类型：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
            <select name="ctype" class="input w50">
              <option value="国营企业">国营企业</option>
              <option value="民营企业">民营企业</option>
              <option value="私营企业">私营企业</option>
              <option value="外资企业">外资企业</option>
              <option value="其他企业">其他企业</option>
             </select>
          </div>
        </div>
         <div class="form-group">
          <div class="label">
            <label>公司介绍：<input type="hidden" name="utype" value="管理员"></label>
          </div>
          <div class="field" style="padding-top:8px;"> 
           <textarea rows="10" cols="80" name="introduction">
           </textarea>
          </div>
        </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" onclick="return checkAll()"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>
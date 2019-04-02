<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>登录</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="alogin.do" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>实验室管理系统</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="uname" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="pwd" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                        <select name="utype" class="input input-big">
                        <option value="管理员">管理员</option>
                        <option value="实验室管理员">实验室管理员</option>
                        <option value="实验设备管理员">实验设备管理员</option>
                        <option value="老师">老师</option>
                      
                        </select>
                        </div>
                    </div>
                    <font color="red">${errorInfo }</font>
                </div>
                <div style="padding:30px;">
                <input type="submit" class="button button-block bg-main text-big input-big" value="登录">
                <!-- <input type="button" class="button button-block bg-main text-big input-big" value="注册" style="margin-top:20px;" onclick="window.location.href='add_user2.jsp'"> -->
                </div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
</html>
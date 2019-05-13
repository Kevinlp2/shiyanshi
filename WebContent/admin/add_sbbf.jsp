<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>申请内容</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="addSbbf.do">
            <div class="form-group">
                <div class="label">
                    <label>设备名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${sb.name }" readonly="readonly"/>
                    <input type="hidden" name="sbid" value="${sb.id }" readonly="readonly"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>总数量：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${number }" readonly="readonly"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>实验室名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${sys.name }" readonly="readonly"/>
                    <input type="hidden" name="sysid" value="${sys.id }" readonly="readonly"/>
                    <%--<select name="sid" class="input input-big" style="max-width: 360px">--%>
                        <%--<c:forEach items="${ftypes}" var="ft">--%>
                            <%--<option value="${ft.id}">${ft.name}</option>--%>
                        <%--</c:forEach>--%>
                    <%--</select>--%>

                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>报废数量：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="bfsnum" data-validate="required:请输入报废数量"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>报废原因：</label>
                </div>
                <div class="field">
                    <input type="textarea " class="input w50" name="bfyy" data-validate="required:请输入报废原因"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>登录页面_很简洁漂亮的Bootstrap响应式后台管理系统模板UniAdmin</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.login.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <div id="logo">
            <img src="img/logo.png" alt="" />
        </div>
        <div id="loginbox">            
            <s:form id="loginform" cssClass="form-vertical" action="user_login"  name="" novalidate="novalidate" method="post">
				<p>输入用户名和密码继续.</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span><s:textfield type="text" placeholder="用户名" name="loginName" />
                        </div>                    
                        <span><font color="red"><s:fielderror fieldName="login"/></font></span>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><s:password type="password" placeholder="密码" name="password"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left">还没有注册吗？<a href="user_registerUI.action" class="flip-link">点击这里</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="登录" /></span>
                </div>
            </s:form>
        
        </div>
        
        <script src="${pageContext.request.contextPath}/js/unicorn.login.js"></script>       
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script>
        <script src="${pageContext.request.contextPath}/js/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.form_validation.js"></script>
    </body>
</html>

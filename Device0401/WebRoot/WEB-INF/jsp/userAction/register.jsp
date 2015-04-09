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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorpicker.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/uniform.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select2.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycustom.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <div id="logo">
            <img src="img/logo.png" alt="" />
        </div>
        <div id="registerbox">            
            <form id="password_validate" action="user_register.action" class="form-vertical" name="password_validate" novalidate="novalidate" method="post">
				<p>输入正确的信息，进行注册</p>
				<div class="control-group"> 
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-pencil"></i></span><input type="text" name="loginName" id="loginName" placeholder="登陆名" />                 
                        </div>
                        <span><font color="red"><s:fielderror fieldName="registerName"/></font></span>
                    </div>
                </div>
                
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" name="email" id="email" placeholder="邮箱" />
                        </div>
                    </div>
                    <span><font color="red"><s:fielderror fieldName="registerEmail"/></font></span>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><input type="password" name="password" id="pwd" placeholder="密码" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><input type="password" name="password" id="pwd2" placeholder="重新输入密码" />
                        </div>
                    </div>
                </div>
               <div class="control-group">
                    <div class="controls">
                        <span class="position_left">　　　　选择职位：</span>
                        <select name="roleName">
						    <option value="college_employee">教职工</option>
						    <option value="company_employee">公司员工</option>
					    </select>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="user_loginUI.action" class="flip-link" id="to-login">&lt; 返回登录</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="注册" /></span>
                </div>
                
            </form>
        
        </div>
        
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

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<!-- container-fluid -->
	<head>
		<title>设备管理系统</title>
		<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
		<!-- start jquery alert-->
		<link href="${pageContext.request.contextPath}/css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
		<!-- end jquery alert-->
         <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
         <script src="${pageContext.request.contextPath}/js/unicorn.tables.js"></script>
         <!-- start jquery alert-->
		<script src="${pageContext.request.contextPath}/js/jquery.alerts.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.myalert.js" type="text/javascript"></script>
		<!-- end jquery alert-->
	<body>
	 <%@ include file="/WEB-INF/jsp/public/topMenu.jspf" %>  
		<div id="sidebar">
			<a href="index.jsp" class="visible-phone"><i class="icon icon-home"></i> 首页</a>
			<ul>
				<li class="active"><a href="index.html"><i class="icon icon-home"></i> <span>首页</span></a></li>
				<s:iterator value="#application.topPrivilegeList">
				     <s:if test="#session.user.hasPrivilegeByName(name)">
				        <s:if test="%{name == '设备管理'}">
							<li class="active submenu open">
								<a href="#"><i class="${imgClass}"></i> <span>${name}</span> </a>
								<ul>
								    <s:iterator value="children">
								    <s:if test="%{name == '流程部署'}">						    
									    <li class="active"><a href="${pageContext.request.contextPath}${url}.action">${name}</a></li>
									</s:if>	
									<s:else>
						     		    <li><a href="${pageContext.request.contextPath}${url}.action">${name}</a></li>
									</s:else>	
									</s:iterator>
								</ul>
							</li>
						</s:if>
						<s:else>
						    <li class="submenu">
								<a href="#"><i class="${imgClass}"></i> <span>${name}</span> </a>
								<ul>
								    <s:iterator value="children">								    
									<li><a href="${pageContext.request.contextPath}${url}.action">${name}</a></li>
									</s:iterator>
								</ul>
							</li>
						</s:else>
					</s:if>
				</s:iterator>
				<li><a href="contact.html"><i class="icon-user"></i> <span>联系我们</span></a></li>
			</ul>
		
		
		</div>
		
		<div id="style-switcher">
			<i class="icon-arrow-left icon-white"></i>
			<span>主题:</span>
			<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
			<a href="#blue" style="background-color: #2D2F57;"></a>
			<a href="#red" style="background-color: #673232;"></a>
		</div>
		
		<div id="content">
			<div id="content-header">
				<h1>控制台</h1>

			</div>
			<div id="breadcrumb">
				<a href="index.jsp" title="回到主页" class="tip-bottom"><i class="icon-home"></i> 首页</a>
				<s:a action="deploy_list" cssClass="current" title="流程部署">流程部署</s:a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
	                 <div class="span12">   
						<div class="widget-box">
							<div class="widget-title">

							    <h5>部署信息管理列表</h5>
										
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead >
									<tr>
									<th>流程名称</th>
									<th>发布时间</th>
									<th>相关操作</th>
									</tr>
									</thead>
									<tbody>
									<s:if test="#deploymentList != null && #deploymentList.size()>0">
									<s:iterator value="#deploymentList">
									<tr class="gradeX">
									<td>${name}</td>
									<td><s:date name="deploymentTime" format="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
										 &nbsp;&nbsp;&nbsp;&nbsp;<s:a action="deploy_delete?deploymentId=%{id}" cssClass="btn btn-danger btn-mini delete">删除</s:a>
									</td>
									</tr>
									</s:iterator>
									</s:if>
									</tbody>
									</table> 
							</div>
							
						</div>	 
						<div class="widget-box">
							<div class="widget-title">

							    <h5>部署定义信息列表</h5>
										
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead >
									<tr>
									<th>名称</th>
									<th>流程定义的KEY</th>
									<th>流程定义的版本</th>
									<th>流程定义规则名称</th>
									<th>流程定义规则图片名称</th>
									<th>部署ID</th>
									<th>操作</th>
									</tr>
									</thead>
									<tbody>
									<s:if test="#processDefinitionList != null && #processDefinitionList.size() >0">
									<s:iterator value="#processDefinitionList">
									<tr class="gradeX">
									<td>${name}</td>
									<td>${key }</td>
									<td>${version }</td>
									<td>${resourceName }</td>
									<td>${diagramResourceName }</td>
									<td>${deploymentId }</td>
									<td>
										 &nbsp;&nbsp;&nbsp;&nbsp;<s:a target="_blank" action="deploy_viewImage?deploymentId=%{deploymentId}&&imageName=%{diagramResourceName}" cssClass="btn btn-primary btn-mini">查看流程图</s:a>
									</td>
									</tr>
									</s:iterator>
									</s:if>
									
									</tbody>
									</table> 		
							</div>
							
						</div>	 
						  <div class="widget-box">
							<div class="widget-title">

							    <h5>部署流程定义</h5>
										
							</div>
							<br>
							<div class="widget-content nopadding position_center">
								
								<div align="left" class="STYLE21">
								<!--注意，此处有中文空格符-->
								        <s:form action="deploy_deploy" method="POST" enctype="multipart/form-data">
									　　　流程名称：<s:textfield type="text" name="filename" cssStyle="width: 200px;"/><br/>
									　　　流程文件:<s:file type="file" name="file" cssStyle="width: 200px;" /><br/>
									　　　<input type="submit" value="上传流程" class="btn btn-info"/>
									    </s:form>
								</div>
								<br>
							</div>
							
						</div>           	
	                 </div>
				</div>
				<div class="row-fluid">
					<div id="footer" class="span12">
						2015 &copy; 郑州轻工业学院 </div>
				</div>
			</div>
		</div>
	</body>
</html>

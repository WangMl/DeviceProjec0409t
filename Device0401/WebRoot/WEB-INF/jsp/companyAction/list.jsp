<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/public/topMenu.jspf" %>  
		<div id="sidebar">
			<a href="index.jsp" class="visible-phone"><i class="icon icon-home"></i> 首页</a>
			<ul>
				<li class="active"><a href="index.jsp"><i class="icon icon-home"></i> <span>首页</span></a></li>
				<s:iterator value="#application.topPrivilegeList">
				     <s:if test="#session.user.hasPrivilegeByName(name)">
				        <s:if test="%{name == '系统管理'}">
							<li class="active submenu open">
								<a href="#"><i class="${imgClass}"></i> <span>${name}</span> </a>
								<ul>
								    <s:iterator value="children">
								    <s:if test="%{name == '公司管理'}">						    
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
				<a href="company_list.action" title="公司管理" class="current">公司管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
	                 <div class="span12">
						<div class="widget-box">
							<div class="widget-title">

							    <h5>部门表</h5>								 
								<div class="buttons"><s:a action="company_addUI" cssClass="btn btn-mini"><i class="icon-plus"></i>添加</s:a></div>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead >
									<tr>
									<th>公司名称</th>
									<th>公司简介</th>
									<th>相关操作</th>
									</tr>
									</thead>
									<tbody>
									<s:iterator value="recordList">
									<tr class="gradeX">
									<td>${name}&nbsp;</td>
									<td>${description}&nbsp;</td>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="company_show?id=%{id}" cssClass="btn btn-primary btn-mini">查看详情</s:a>&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="company_editUI?id=%{id}" cssClass="btn btn-primary btn-mini">修改</s:a>&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="company_delete?id=%{id}" cssClass="btn btn-danger btn-mini delete">删除</s:a>
									</td>
									</tr>
									</s:iterator>
									</tbody>
									</table> 																		
									<%@ include file="/WEB-INF/jsp/public/pageView.jspf" %>
									<s:form action="company_list"></s:form>
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

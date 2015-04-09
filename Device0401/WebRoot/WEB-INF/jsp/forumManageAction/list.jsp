<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
	<!-- container-fluid -->
	<head>
		<title>设备管理系统<</title>
		<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
        <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.tables.js"></script>
	    </head>
	<body>
		<%@ include file="/WEB-INF/jsp/public/topMenu.jspf" %>             
		<div id="sidebar">
			<a href="index.jsp" class="visible-phone"><i class="icon icon-home"></i> 首页</a>
			<ul>
				<li class="active"><a href="index.jsp"><i class="icon icon-home"></i> <span>首页</span></a></li>
				<s:iterator value="#application.topPrivilegeList">
				     <s:if test="#session.user.hasPrivilegeByName(name)">
				        <s:if test="%{name == '网上交流'}">
							<li class="active submenu open">
								<a href="#"><i class="${imgClass}"></i> <span>${name}</span> </a>
								<ul>
								    <s:iterator value="children">
								    <s:if test="%{name == '论坛管理'}">						    
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
				<a href="forumManage_list.action" class="current" title="论坛管理">论坛管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
	                 <div class="span12">
						<div class="widget-box">
							<div class="widget-title">

							    <h5>论坛表</h5>
							    <s:if test="#count <= 20">
								<div class="buttons"><s:a action="forumManage_addUI" cssClass="btn btn-mini current" title="最多能添加20个论坛，请合理设置"><i class="icon-plus"></i>添加</s:a></div>
			                    </s:if>
								
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead >
									<tr>
									<th>板块名称</th>
									<th>板块说明</th>
									<th>相关操作</th>
									</tr>
									</thead>
									<tbody>
									<s:iterator value="#forumList" status="status">
									<tr class="gradeX">
									<td>${name}&nbsp;</td>
				                    <td>${description}&nbsp;</td>

									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="forumManage_editUI?id=%{id}" cssClass="btn btn-primary btn-mini">修改</s:a>&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="forumManage_delete?id=%{id}" cssClass="btn btn-danger btn-mini delete">删除</s:a> 
										<!-- 最上面的不能上移 -->
										<s:if test="#status.first">
										    &nbsp;&nbsp;&nbsp;&nbsp;<s:a action="forumManage_moveUp?id=%{id}" cssClass="btn btn-success btn-mini disabled">上移</s:a> 
										</s:if>
										<s:else>
											&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="forumManage_moveUp?id=%{id}" cssClass="btn btn-success btn-mini">上移</s:a> 
										</s:else>
										
										<!-- 最下面的不能下移 -->
										<s:if test="#status.last">
										    &nbsp;&nbsp;&nbsp;&nbsp;<s:a action="forumManage_moveDown?id=%{id}" cssClass="btn btn-success btn-mini disabled">下移</s:a>											
										</s:if>
										<s:else>
										    &nbsp;&nbsp;&nbsp;&nbsp;<s:a action="forumManage_moveDown?id=%{id}" cssClass="btn btn-success btn-mini">下移</s:a>
										</s:else>
								
									</td>
									</s:iterator>
									</tbody>
									</table> 
									
									
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

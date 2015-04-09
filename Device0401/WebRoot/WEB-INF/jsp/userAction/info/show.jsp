<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
	<!-- container-fluid -->
	<head>
		<title>设备管理系统</title>
		<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
        <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.tables.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.form_validation.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
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
								    <s:if test="%{name == '个人信息'}">						    
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
				<a href="user_info.action" title="个人信息" class="current">个人信息</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-th"></i>
								</span>
								<h5>个人用户信息</h5>
							</div>
							<div class="widget-content nopadding">
								<dl class="dl-horizontal">
								  <dt>名称</dt>
								  <dd>${user.name}</dd>
								</dl>
								<dl class="dl-horizontal">
								  <dt>登录名</dt>
								  <dd>${user.loginName}</dd>
								</dl>
								<dl class="dl-horizontal">
								  <dt>性别</dt>
								  <dd>${user.gender }</dd>
								</dl>
								
								<dl class="dl-horizontal">
								  <dt>联系电话 </dt>
								  <dd>${user.phoneNumber}</dd>
								</dl>	
								<dl class="dl-horizontal">
								  <dt>Email</dt>
								  <dd>${user.email }</dd>
								</dl>	
								<dl class="dl-horizontal">
								  <dt>公司</dt>
								  <dd>${user.company.name }</dd>
								</dl>	
								<dl class="dl-horizontal">
								  <dt>部门</dt>
								  <dd>${user.department.name }</dd>
								</dl>
								<dl class="dl-horizontal">
								  <dt>上级领导人</dt>
								  <dd>${user.manager.name }</dd>
								</dl>
								<dl class="dl-horizontal">
								  <dt>角色</dt>
								  <dd>
								  <s:if test="#user.roles != null">
								      <s:iterator value="#user.roles">
								          ${description}
								      </s:iterator>
								  </s:if>
								  </dd>
								</dl>
								<dl class="dl-horizontal">
								  <dt>自我介绍</dt>
								  <dd>${user.description }</dd>
								</dl>									
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

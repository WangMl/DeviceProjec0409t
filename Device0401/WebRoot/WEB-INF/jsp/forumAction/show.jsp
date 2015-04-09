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
								    <s:if test="%{name == '论坛'}">						    
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
				<a href="forum_list.action" class="current" title="论坛" >论坛</a>
			</div>
			<div class="container-fluid">
			    <div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
                            <div class="widget-title">

							    <h5>${forum.name}</h5>
								<div class="buttons"><s:a action="topic_addUI?forumId=%{#forum.id}" cssClass="btn btn-mini"><i class="icon-plus"></i>发新帖</s:a></div>
										
							</div>
							<div class="widget-content nopadding">
								<ul class="recent-comments">
								   <s:iterator value="recordList">
									<li class="li-style">
										<div class="user-thumb" >
											<img width="40" height="40" alt="User" src="img/topicType${type }.jpg" />
										</div>
										<span class="user-info"> 用户: ${author.name } 时间: ${postTime } </span>
										<div class="comments" style="margin-top:21px;">
											<span class="user-info"> 　　　　　 <a href="#" class="btn btn-danger btn-mini">删除</a></span>

											<p>
												<s:a action="topic_show?id=%{id}"><h5>${title}</h5></s:a>
											</p>
											
										</div>
									</li>
									</s:iterator>
									
								</ul>
							</div>
							<%@ include file="/WEB-INF/jsp/public/pageView.jspf" %>
							<s:form action="forum_show?id=%{id}"></s:form> 
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

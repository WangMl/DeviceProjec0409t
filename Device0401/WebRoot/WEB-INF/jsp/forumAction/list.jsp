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
			    <div id="dashboard">
			   
			  
			    <div class="row-fluid">
			        <s:iterator value="#forumList0" status="status">		               
            		<div class="span3 responsive" data-tablet="span6" data-desktop="span3">

								<div class="dashboard-stat custom${status.count }">
                                    <div class="row-fluid">
                                        <div class="span6">
											<div class="visual">
												<i class="">${name}</i>

											</div>
										 </div>
		                                 <div class="span6">
											<div class="details">

												<div class="number">

													${topicCount}

												</div>

												<div class="desc">                           

													总贴数

												</div>

											</div>
										</div>
									</div>

									<s:a cssClass="more" action="forum_show?id=%{id}">

									点击进入>> <i class="m-icon-swapright m-icon-white"></i>

									</s:a>                 

								</div>

							</div>
						    </s:iterator>
                       </div>    
                       <div class="row-fluid">
			        <s:iterator value="#forumList1" status="status">		               
            		<div class="span3 responsive" data-tablet="span6" data-desktop="span3">

								<div class="dashboard-stat custom${status.count+4 }">
                                    <div class="row-fluid">
                                        <div class="span6">
											<div class="visual">
												<i class="">${name}</i>

											</div>
										 </div>
		                                 <div class="span6">
											<div class="details">

												<div class="number">

													${topicCount}

												</div>

												<div class="desc">                           

													总贴数

												</div>

											</div>
										</div>
									</div>

									<s:a cssClass="more" action="forum_show?id=%{id}">

									点击进入>> <i class="m-icon-swapright m-icon-white"></i>

									</s:a>                 

								</div>

							</div>
						    </s:iterator>
                       </div>
                       <div class="row-fluid">
			        <s:iterator value="#forumList2" status="status">		               
            		<div class="span3 responsive" data-tablet="span6" data-desktop="span3">

								<div class="dashboard-stat custom${status.count+8 }">
                                    <div class="row-fluid">
                                        <div class="span6">
											<div class="visual">
												<i class="">${name}</i>

											</div>
										 </div>
		                                 <div class="span6">
											<div class="details">

												<div class="number">

													${topicCount}

												</div>

												<div class="desc">                           

													总贴数

												</div>

											</div>
										</div>
									</div>

									<s:a cssClass="more" action="forum_show?id=%{id}">

									点击进入>> <i class="m-icon-swapright m-icon-white"></i>

									</s:a>                 

								</div>

							</div>
						    </s:iterator>
                       </div> 
                         <div class="row-fluid">
			        <s:iterator value="#forumList3" status="status">		               
            		<div class="span3 responsive" data-tablet="span6" data-desktop="span3">

								<div class="dashboard-stat custom${status.count+8 }">
                                    <div class="row-fluid">
                                        <div class="span6">
											<div class="visual">
												<i class="">${name}</i>

											</div>
										 </div>
		                                 <div class="span6">
											<div class="details">

												<div class="number">

													${topicCount}

												</div>

												<div class="desc">                           

													总贴数

												</div>

											</div>
										</div>
									</div>

									<s:a cssClass="more" action="forum_show?id=%{id}">

									点击进入>> <i class="m-icon-swapright m-icon-white"></i>

									</s:a>                 

								</div>

							</div>
						    </s:iterator>
                       </div> 
                         <div class="row-fluid">
			        <s:iterator value="#forumList4" status="status">		               
            		<div class="span3 responsive" data-tablet="span6" data-desktop="span3">

								<div class="dashboard-stat custom${status.count+8 }">
                                    <div class="row-fluid">
                                        <div class="span6">
											<div class="visual">
												<i class="">${name}</i>

											</div>
										 </div>
		                                 <div class="span6">
											<div class="details">

												<div class="number">

													${topicCount}

												</div>

												<div class="desc">                           

													总贴数

												</div>

											</div>
										</div>
									</div>

									<s:a cssClass="more" action="forum_show?id=%{id}">

									点击进入>> <i class="m-icon-swapright m-icon-white"></i>

									</s:a>                 

								</div>

							</div>
						    </s:iterator>
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

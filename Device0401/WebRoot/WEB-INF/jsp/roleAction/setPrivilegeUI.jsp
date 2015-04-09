<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html>
<html lang="en">
	<!-- container-fluid -->
	<head>
		<title>设备管理系统</title>
		<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
		<script language="javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<!--start treeview -->
		<link type="text/css"  href="${pageContext.request.contextPath}/js/jquery_treeview/jquery.treeview.css"/>
		<!--end treeview -->
		<!-- start jquery alert-->
		<link href="${pageContext.request.contextPath}/css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
		
		<!-- end jquery alert-->
		<!--start treeview -->
		<script rel="stylesheet" src="${pageContext.request.contextPath}/js/jquery_treeview/jquery.treeview.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery_treeview/jquery.treeview.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/privilege.css">
		
         <!-- start jquery alert-->
		<script src="${pageContext.request.contextPath}/js/jquery.alerts.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.myalert.js" type="text/javascript"></script>
		<!-- end jquery alert-->

		<script type="text/javascript">
	 		$(function(){
			// 指定事件处理函数
			$("[name=privilegeIds]").click(function(){
				
				// 当选中或取消一个权限时，也同时选中或取消所有的下级权限
				$(this).siblings("ul").find("input").attr("checked", this.checked);
				
				// 当选中一个权限时，也要选中所有的直接上级权限
				if(this.checked == true){
					$(this).parents("li").children("input").attr("checked", true);
				}
				
			});
		});
	    	
	    	$(function(){
	    		$("#tree").treeview();
	    	});
	    </script>
    </head>
	<body>
		
		
		<div id="header">
			<h1><a href="./dashboard.html">管理系统</a></h1>		
		</div>
		
		<div id="search">
			<input type="text" placeholder="请输入搜索内容..." /><button type="submit" class="tip-right" title="Search"><i class="icon-search icon-white"></i></button>
		</div>
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse dropdown" id="personInfo"><a title="" href="#" data-toggle="dropdown" data-target="#personInfo" class="dropdown-toggle"><i class="icon icon-user"></i> <span class="text">个人资料</span><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a class="sAdd" title="" href="system_user_changePass.html">重置密码</a></li>
                        <li><a class="sOutbox" title="" href="system_user_check.html">查看个人资料</a></li>
                        <li><a class="sInbox" title="" href="system_user_saveUI.html">修改个人资料</a></li>

                    </ul>
                </li>
                <li class="btn btn-inverse dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a class="sAdd" title="" href="#">新消息</a></li>
                    </ul>
                </li>
                <li class="btn btn-inverse"><a title="" href="user_logout.action"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
            </ul>
        </div>
            
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
								    <s:if test="%{name == '岗位管理'}">						    
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
				<a href="role_list.action" title="岗位管理" class="current">岗位管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
	                 <div class="span12">
	                 <s:form action="role_setPrivilege">
    	             <s:hidden name="id"></s:hidden>
						<div class="widget-box">
							<div class="widget-title">

							    <h5>分配权限</h5>
								
										
							</div>
							<div class="widget-content nopadding">
								<table width="180px" style="margin-left:20px;">
									
									<tbody>
									<tr>
									<td>
										<ul id="tree">
											<s:iterator value="#application.topPrivilegeList">
												<li>
													<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
													<label for="cb_${id}"><span class="folder">${name}</span></label>
													<ul>
													<s:iterator value="children">
														<li>
															<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
															<label for="cb_${id}"><span class="folder">${name}</span></label>
														<ul>
														<s:iterator value="children">
															<li>
																<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
																<label for="cb_${id}"><span class="folder">${name}</span></label>
															</li>
														</s:iterator>
														</ul>
													</li>		
												</s:iterator>
												</ul>
											</li>
										</s:iterator>
										</ul>
									</td>							
									</tr>
									
									</tbody>
									</table> 
									
									
							</div>
							
						</div>
						<input type="submit" value="提交" class="btn btn-primary" />
						</s:form>	                 	
	                 </div>
				</div>
				<div class="row-fluid">
					<div id="footer" class="span12">
						2015 &copy; 郑州轻工业学院 </div>
				</div>
			</div>
		</div>
	</body>
	<!--end treeview -->
</html>

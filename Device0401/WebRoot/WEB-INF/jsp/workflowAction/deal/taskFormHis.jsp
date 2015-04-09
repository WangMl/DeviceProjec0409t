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
		<title>设备管理系统<</title>
        <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
        <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.tables.js"></script>
        <script src="${pageContext.request.contextPath}/js/unicorn.form_validation.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
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
								    <s:if test="%{name == '待办'}">						    
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
				<s:a action="deviceBill_list" cssClass="current" title="设备申请">设备申请</s:a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>设备单</h5>
								
							</div>
							<div class="widget-content nopadding">
							   <s:form cssClass="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate" >
                                   <div class="control-group">
                                        <label class="control-label">设备名称:</label>
                                        <div class="controls">
                                            <s:textfield disabled="true" type="text" name="name" id="name" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">描述原因:</label>
                                        <div class="controls">
                                            <s:textfield disabled="true" type="text" name="description" id="description" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">备注:</label>
                                        <div class="controls">
                                            <s:textarea  disabled="true" name="remark" id="remark" cols="50" rows="5"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">设备地点:</label>
                                        <div class="controls">
                                            <s:textfield disabled="true" type="text" name="position" id="position" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">预计费用:</label>
                                        <div class="controls">
                                            <s:textfield disabled="true" type="text" name="fee" id="fee" />
                                        </div>
                                    </div>
                                 </s:form>
							</div>
						</div>			
					</div>
				</div>
				<div class="row-fluid">
	                 <div class="span12">
						<div class="widget-box">
							<div class="widget-title">
							    <h5>显示请假申请的批注信息</h5>				
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead >
									<tr>
									<th>批注人</th>
									<th>时间</th>
									<th>批注信息</th>
									</tr>
									</thead>
									<tbody>
									<s:if test="#commentList!=null && #commentList.size()>0">
									<s:iterator value="#commentList">
									<tr class="gradeX">				
									<td>${userId }</td>
									<td><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${fullMessage }</td>
									</s:iterator>
									</s:if>
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

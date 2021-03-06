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
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/uniform.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select2.css" />		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycustom.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.grey.css" class="skin-color" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
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
								    <s:if test="%{name == '用户管理'}">						    
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
				<a href="user_list.action" title="用户管理" class="current">用户管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>用户数据</h5>
								
							</div>
							<div class="widget-content nopadding">
								<s:form cssClass="form-horizontal" method="post" action="user_%{id == null ? 'add' : 'edit'}" name="basic_validate" id="basic_validate" novalidate="novalidate" >
                                    <s:hidden name="id"></s:hidden>
                                    <div class="control-group">
                                        <label class="control-label">登陆名</label>
                                        <div class="controls">
                                            <s:textfield type="text" name="loginName" id="loginName" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">姓名</label>
                                        <div class="controls">
                                            <s:textfield type="text" name="name" id="name" />
                                        </div>
                                    </div>
									
									<div class="control-group">

										<label class="control-label">性别</label>

											<div class="controls">
											       <s:if test="%{#session.user.isMan(gender)}">
											            <label class="radio">

														<input type="radio" name="gender" value="男"  checked />
	
														男
	
														</label>
	
														<label class="radio">
	
														<input type="radio" name="gender" value="女" />
	
														女
	
														</label>  
	
														<label class="radio">
	
														<input type="radio" name="gender" value="保密" />
	
														保密
	
														</label>  
											       </s:if>
											       <s:elseif test="#session.user.isWoman(gender)">
											       <label class="radio">

														<input type="radio" name="gender" value="男"  />
	
														男
	
														</label>
	
														<label class="radio">
	
														<input type="radio" name="gender" value="女" checked />
	
														女
	
														</label>  
	
														<label class="radio">
	
														<input type="radio" name="gender" value="保密" />
	
														保密
	
														</label>  
											       </s:elseif>
											       <s:else>
											            <label class="radio">

														<input type="radio" name="gender" value="男"  />
	
														男
	
														</label>
	
														<label class="radio">
	
														<input type="radio" name="gender" value="女" />
	
														女
	
														</label>  
	
														<label class="radio">
	
														<input type="radio" name="gender" value="保密" checked />
	
														保密
	
														</label>  
											       </s:else>
                                                
											</div>

									</div>
									<div class="control-group">
                                        <label class="control-label">所属公司</label>
                                        <div class="controls">
                                            <s:select name="companyId" cssClass="select-medium"
			                        		list="#companyList" listKey="id" listValue="name"
			                        		headerKey="" headerValue="==请选择公司==" />
                                        </div>
                                    </div>
									<div class="control-group">
                                        <label class="control-label">所属部门</label>
                                        <div class="controls">
                                            <s:select name="departmentId" cssClass="select-medium"
			                        		list="#departmentList" listKey="id" listValue="name"
			                        		headerKey="" headerValue="==请选择部门==" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">岗位</label>
                                        <div class="controls">
										    <div class="row-fluid">
											                 <div class="span10">
																<div class="widget-box">
																	<div class="widget-title">
										
																	    <h5>鼠标单击，可进行多选</h5>
																		
																	</div>
																	<div class="widget-content nopadding">
																		
																		<s:select name="roleIds" cssClass="select-max"
											                        		multiple="true" size="10" 
											                        		list="#roleList" listKey="id" listValue="name"
											                        	/>
																														
																	</div>
																	
																</div>	                 	
											                 </div>
														</div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">联系电话</label>
                                        <div class="controls">
                                            <s:textfield type="text" name="phoneNumber" id="phoneNumber" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Email</label>
                                        <div class="controls">
                                            <s:textfield type="text" name="email" id="email" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">自我介绍</label>
                                        <div class="controls">
                                            <s:textarea cssClass="form-control" rows="3" name="description" cssStyle="height:200px;"></s:textarea>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <input type="reset" value="重置" class="btn btn-success" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="submit" value="提交" class="btn btn-primary" />
                                    </div>
                                </s:form>    
                               
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
		

            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script>
            <script src="${pageContext.request.contextPath}/js/select2.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
            <script src="${pageContext.request.contextPath}/js/unicorn.tables.js"></script>
            <script src="${pageContext.request.contextPath}/js/unicorn.form_validation.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	</body>
</html>

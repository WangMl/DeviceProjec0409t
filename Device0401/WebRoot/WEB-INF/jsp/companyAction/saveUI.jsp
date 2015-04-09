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
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/blue/forum.css" />
		<script language="javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js" charset="utf-8"></script>
	    <script type="text/javascript">
			$(function(){
				var fck = new FCKeditor("content");
				fck.Width = "82%";
				
				fck.ToolbarSet = "bbs";
				fck.BasePath = "${pageContext.request.contextPath}/fckeditor/";
				//fck.Config['SkinPath'] = "${pageContext.request.contextPath}/scriipt/fckeditoreditor/skins/office2003/";
				//fck.Config['SkinPath'] = "http://bbs.itcast.cn:80/widgets/fckeditor/editor/skins/office2003/";
				fck.ReplaceTextarea();
			});
			
	    </script>
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
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>部门数据</h5>
								
							</div>
							<div class="widget-content nopadding">
								<s:form cssClass="form-horizontal" method="post" action="company_%{id == null ? 'add' : 'edit'}" name="basic_validate" id="basic_validate" novalidate="novalidate" >
                                     <s:hidden name="id"></s:hidden>
                                     <div class="control-group">
                                        <label class="control-label">名称</label>
                                        <div class="controls">
                                            <s:textfield type="text" name="name" id="name" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">简介</label>
                                        <div class="controls">
                                            <s:textfield  type="text" name="description" id="description" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">联系电话</label>
                                        <div class="controls">
                                            <s:textfield  type="text" name="phoneNumber" id="phoneNumber" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">EMAL</label>
                                        <div class="controls">
                                            <s:textfield  type="text" name="email" id="email" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">地址</label>
                                        <div class="controls">
                                            <s:textfield  type="text" name="address" id="address" />
                                        </div>
                                    </div>
                                     <div class="control-group">
                                        <label class="control-label">详细介绍</label>
                                        <div class="controls">
                                            <s:textarea cssClass="form-control" rows="3" name="content" cssStyle="height:200px;"></s:textarea>
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
		

            
	</body>
</html>

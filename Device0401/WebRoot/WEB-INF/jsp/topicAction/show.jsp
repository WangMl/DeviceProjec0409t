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
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <script language="javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js" charset="utf-8"></script>
        <script type="text/javascript">
		$(function(){
			var fck = new FCKeditor("content");
			fck.Width = "90%";
			fck.ToolbarSet = "bbs";
			fck.BasePath = "${pageContext.request.contextPath}/fckeditor/";
			fck.ReplaceTextarea();
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
                <li class="btn btn-inverse"><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
            </ul>
        </div>
            
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
				<a href="forum_list.action" class="tip-bottom" title="论坛" >论坛</a>
				<s:a action="forum_show?id=%{#topic.forum.id}" class="current" title="主题添加" >${topic.forum.name}</s:a>
			</div>
			<div class="container-fluid">
			    <s:if test="currentPage == 1">
			    <div class="row-fluid">
			         <div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-comment"></i>
								</span>
								<h5>${topic.title}</h5>
								<label class="position_right"><h5><s:a action="topic_essence?id=%{#topic.id}" cssClass="tip-bottom" title="精华"><i class="icon-heart"></i></s:a>　<s:a action="topic_topPost?id=%{#topic.id}&forumId=%{#topic.forum.id}" cssClass="tip-bottom" title="置顶"><i class="icon-thumbs-up"></i></s:a><s:a action="reply_addUI?id=%{#topic.id}&forumId=%{#topic.forum.id}">　回复</s:a>@楼主　${topic.author.name }　　时间：${topic.postTime}</h5></label>
							</div>
							<div class="widget-content">
                               ${topic.content}
							</div>
						</div>
					</div>
			    </div>
			    </s:if>
			    <s:iterator value="recordList" status="status">
			    <div class="row-fluid">
			         <div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-user"></i>
								</span>
								<h5>${(currentPage - 1) * pageSize + status.count}楼</h5>
								<label class="position_right"><h5>用户：${author.name}　　时间：${postTime }</h5></label>
							</div>
							<div class="widget-content">
								${content}
							</div>
						</div>
					</div>
			    </div>
			    </s:iterator>
			    
			    <%@ include file="/WEB-INF/jsp/public/pageView.jspf" %>
				<s:form action="topic_show?id=%{#topic.id}"></s:form> 
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-envelope"></i>									
								</span>
								<h5>直接回复</h5>
								
							</div>
							<div class="widget-content nopadding">
								<s:form cssClass="form-horizontal" method="post" action="reply_add" name="basic_validate" id="basic_validate" novalidate="novalidate" >
                                    <s:hidden name="topicId" value="%{#topic.id}"></s:hidden>
                                    <div class="control-group">
                                       
                                        <div class="controls">
                                            <s:textarea cssClass="form-control" rows="3" name="content" style="height:200px;"></s:textarea>
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

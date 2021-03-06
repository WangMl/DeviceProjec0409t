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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" />	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.grey.css" class="skin-color" />
		<!-- start jquery alert-->
		<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
		 <!-- end jquery alert-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
	<body>	
		<%@ include file="/WEB-INF/jsp/public/topMenu.jspf" %>     
       <div id="sidebar">
			<a href="index.html" class="visible-phone"><i class="icon icon-home"></i> 首页</a>
			<ul>
				<li class="active"><a href="index.html"><i class="icon icon-home"></i> <span>首页</span></a></li>
				<s:iterator value="#application.topPrivilegeList">
				     <s:if test="#session.user.hasPrivilegeByName(name)">
						<li class="submenu">
							<a href="#"><i class="${imgClass}"></i> <span>${name}</span> </a>
							<ul>
							    <s:iterator value="children">
								<li><a href="${pageContext.request.contextPath}${url}.action">${name}</a></li>
								</s:iterator>
							</ul>
						</li>
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
				<a href="index.jsp" title="首页" class="tip-bottom"><i class="icon-home"></i> 首页</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12 center" style="text-align: center;">					
						<ul class="stat-boxes">
							<li>
								<div class="left peity_bar_good"><span>2,4,9,7,12,10,12</span>+20%</div>
								<div class="right">
									<strong>36094</strong>
									访问量
								</div>
							</li>
							<li>
								<div class="left peity_bar_neutral"><span>20,15,18,14,10,9,9,9</span>0%</div>
								<div class="right">
									<strong>${online}</strong>
									在线用户
								</div>
							</li>
							<li>
								<div class="left peity_bar_bad"><span>3,5,9,7,12,20,10</span>-50%</div>
								<div class="right">
									<strong>8650</strong>
									成功申请
								</div>
							</li>
							<li>
								<div class="left peity_line_good"><span>12,6,9,23,14,10,17</span>+70%</div>
								<div class="right">
									<strong>8650</strong>
									失败申请
								</div>
							</li>
						</ul>
					</div>	
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="alert alert-info">
							欢迎来到<strong>设备后台管理系统</strong>. 别忘记退出哦!
							<a href="#" data-dismiss="alert" class="close">×</a>
						</div>
						<div class="widget-box">
							<div class="widget-title"><span class="icon"><i class="icon-signal"></i></span><h5>网站统计</h5><div class="buttons"><a href="#" class="btn btn-mini"><i class="icon-refresh"></i> 状态</a></div></div>
							<div class="widget-content">
								<div class="row-fluid">
								<div class="span4">
									<ul class="site-stats">
										<li><i class="icon-user"></i> <strong>1433</strong> <small>所有用户</small></li>
										<li><i class="icon-arrow-right"></i> <strong>16</strong> <small>新用户 (上周)</small></li>
										<li class="divider"></li>
										<li><i class="icon-align-center"></i> <strong>259</strong> <small>总设备</small></li>
										<li><i class="icon-tag"></i> <strong>8650</strong> <small>总共申请</small></li>
										<li><i class="icon-repeat"></i> <strong>29</strong> <small>待办</small></li>
									</ul>
								</div>
								<div class="span8">
									<div class="chart"></div>
								</div>	
								</div>							
							</div>
						</div>					
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="widget-box">
							<div class="widget-title"><span class="icon"><i class="icon-file"></i></span><h5>最近消息</h5><span title="54 total posts" class="label label-info tip-left">54</span></div>
							<div class="widget-content nopadding">
								<ul class="recent-posts">
									<li>
										<div class="user-thumb">
											<img width="40" height="40" alt="User" src="img/demo/av2.jpg" />
										</div>
										<div class="article-post">
											<span class="user-info"> By: neytiri on 2 Aug 2012, 09:27 AM, IP: 186.56.45.7 </span>
											<p>
												<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
											</p>
											<a href="#" class="btn btn-primary btn-mini">修改</a> <a href="#" class="btn btn-success btn-mini">查看</a> <a href="#" class="btn btn-danger btn-mini delete">删除</a>
										</div>
									</li>
									<li>
										<div class="user-thumb">
											<img width="40" height="40" alt="User" src="img/demo/av3.jpg" />
										</div>
										<div class="article-post">
											<span class="user-info"> By: john on on 24 Jun 2012, 04:12 PM, IP: 192.168.24.3 </span>
											<p>
												<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
											</p>
											<a href="#" class="btn btn-primary btn-mini">修改</a> <a href="#" class="btn btn-success btn-mini">查看</a> <a href="#" class="btn btn-danger btn-mini delete">删除</a>
										</div>
									</li>
									<li>
										<div class="user-thumb">
											<img width="40" height="40" alt="User" src="img/demo/av1.jpg" />
										</div>
										<div class="article-post">
											<span class="user-info"> By: michelle on 22 Jun 2012, 02:44 PM, IP: 172.10.56.3 </span>
											<p>
												<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
											</p>
											<a href="#" class="btn btn-primary btn-mini">修改</a> <a href="#" class="btn btn-success btn-mini">查看</a> <a href="#" class="btn btn-danger btn-mini delete">删除</a>
										</div>
									</li>
									<li class="viewall">
										<a title="View all posts" class="tip-top" href="#"> + 更多 + </a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="widget-box">
							<div class="widget-title"><span class="icon"><i class="icon-comment"></i></span><h5>最新评论</h5><span title="88 total comments" class="label label-info tip-left">88</span></div>
							<div class="widget-content nopadding">
								<ul class="recent-comments">
									<li>
										<div class="user-thumb">
											<img width="40" height="40" alt="User" src="img/demo/av1.jpg" />
										</div>
										<div class="comments">
											<span class="user-info"> User: michelle on IP: 172.10.56.3 </span>
											<p>
												<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
											</p>
											<a href="#" class="btn btn-primary btn-mini">修改</a> <a href="#" class="btn btn-success btn-mini">查看</a> <a href="#" class="btn btn-danger btn-mini delete">删除</a>
										</div>
									</li>
									<li>
										<div class="user-thumb">
											<img width="40" height="40" alt="User" src="img/demo/av3.jpg" />
										</div>
										<div class="comments">
											<span class="user-info"> User: john on IP: 192.168.24.3 </span>
											<p>
												<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
											</p>
											<a href="#" class="btn btn-primary btn-mini">修改</a> <a href="#" class="btn btn-success btn-mini">查看</a> <a href="#" class="btn btn-danger btn-mini delete">删除</a>
										</div>
									</li>
									<li>
										<div class="user-thumb">
											<img width="40" height="40" alt="User" src="img/demo/av2.jpg" />
										</div>
										<div class="comments">
											<span class="user-info"> User: neytiri on IP: 186.56.45.7 </span>
											<p>
												<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
											</p>
											<a href="#" class="btn btn-primary btn-mini">修改</a> <a href="#" class="btn btn-success btn-mini">查看</a> <a href="#" class="btn btn-danger btn-mini delete">删除</a>
										</div>
									</li>
									<li class="viewall">
										<a title="View all comments" class="tip-top" href="#"> + 更多 + </a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box widget-calendar">
							<div class="widget-title"><span class="icon"><i class="icon-calendar"></i></span><h5>日历</h5></div>
							<div class="widget-content nopadding">
								<div class="calendar"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div id="footer" class="span12">
						2012 &copy; UniAdmin. </div>
				</div>
			</div>
		</div>
		

            <script src="${pageContext.request.contextPath}/js/excanvas.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.flot.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.peity.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
            <script src="${pageContext.request.contextPath}/js/unicorn.dashboard.js"></script>
              <!-- start jquery alert-->
		   <script src="${pageContext.request.contextPath}/js/jquery.alerts.js" type="text/javascript"></script>
		   <script src="${pageContext.request.contextPath}/js/jquery.myalert.js" type="text/javascript"></script>
		   <!-- end jquery alert-->
	</body>
</html>


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<header class="container-fluid" id="header">
	<!-- <img src="../../assets/images/logo-admin.png" class="pull-left logo" /> -->
	<h3 class="pull-left site-name"></h3>
	<ul class="module-list">
		<!-- <li class="selected"><a href="">控制台</a></li>
		<li class="split-line"></li>
		-->
	</ul>
	<div class="opt pull-right">
		<ul>
			<li><a href="#"><i class="fa fa-refresh"></i><p>缓存</p></a></li>
			<li class="split-line"></li>
			<li><a href="<%=basePath %>" target="_blank"><i class="fa fa-home"></i><p>首页</p></a></li>
			<li class="split-line"></li>
			<li><a href="#"><i class="fa fa-close"></i><p>退出</p></a></li>
		</ul>
		<div class="clearfix"></div>
	</div>
</header>
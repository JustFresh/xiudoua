<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>assets/js/home/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/home/jqueryslidemenu.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/home/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/home/jquery.eislideshow.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/home/custom.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/jsHome.js"></script>
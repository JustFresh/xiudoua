<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>assets/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/plugin/jeDate/jquery.jedate.js"></script>

<script type="text/javascript" src="<%=basePath %>assets/js/require.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/js/jsAdmin.js"></script>
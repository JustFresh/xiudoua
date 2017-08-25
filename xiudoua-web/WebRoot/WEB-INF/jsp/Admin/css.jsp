<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>***网站</title>
<meta name="keywords" content="关键字" />
<meta name="description" content="描述" />
<meta name="author" content="JustFresh" />
<link rel="shortcut icon" type="image/ico" href="">
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/css/bootstrap-switch.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/css/font-awesome.min.css" />

<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/plugin/jeDate/skin/jedate.css" />

<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/css/common.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/css/cssAdmin.css" />
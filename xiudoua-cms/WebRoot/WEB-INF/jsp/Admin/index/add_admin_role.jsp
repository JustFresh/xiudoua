<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/power.css" />
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="tab-nav">
							<ul class="pull-left">
								<c:if test="${opt == null }">
									<li class="selected"><a href="<%=basePath %>admin/index.htm?mod=index&act=power">权限设置 11111${opt }</a></li>
									<li><a href="<%=basePath %>admin/index.htm?mod=index&act=power&opt=add_admin_role">添加权限组</a></li>
								</c:if>
								<c:if test="${opt != null }">
									<li><a href="<%=basePath %>admin/index.htm?mod=index&act=power">权限设置</a></li>
									<li class="selected"><a href="<%=basePath %>admin/index.htm?mod=index&act=power&opt=add_admin_role">添加权限组</a></li>
								</c:if>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid add-power">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form id="">
							<div class="form-group">
							    <label>组名称</label>
							    <input type="text" class="form-control" placeholder="请输入要添加的权限组名称" name="roleName" />
							 </div>
							<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/admin/js.do"></jsp:include>
</body>
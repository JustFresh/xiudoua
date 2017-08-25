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
									<li class="selected"><a href="<%=basePath %>admin/index.htm?mod=index&act=power">权限设置</a></li>
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
			
			<div class="container-fluid role-choose">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form>
						 	<div class="form-group">
						    	<label>权限组</label>
						    	<select name="roleId" class="form-control">
						    		<option value="2">系统管理员</option>
						    		<option value="3">网编</option>
						    	</select>
						  	</div>
						</form>
					</div>
				</div>
			</div>
			
			<div class="container-fluid power-list">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form id="">
							<table class="table table-hover">
								<tr>
									<th>控制台</th>
									<td><input type="checkbox" name="power" value="" checked="true" /> 控制台</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 关于我们</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 站点设置</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 权限设置</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 系统留言</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 友情链接</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 消息通知</td>
								</tr>
								<tr>
									<th>CMS</th>
									<td><input type="checkbox" name="power" value="" checked="true" /> 广告管理</td>
									<td><input type="checkbox" name="power" value="" checked="true" /> 栏目管理</td>
									<td colspan="5"><input type="checkbox" name="power" value="" checked="true" /> 文章管理</td>
								</tr>
							</table>
							<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
						</form><form>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>
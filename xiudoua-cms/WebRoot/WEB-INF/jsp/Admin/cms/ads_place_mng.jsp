<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/ads_place.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=cms&act=ads">广告管理</a></li>
								<li><a href="<%=basePath %>admin/index.htm?mod=cms&act=ads&opt=ads_places">广告位管理</a></li>
								<c:if test="${adsPlace == null }">
									<li class="selected"><a href="javascript: void(0)">添加CMS广告位</a></li>
								</c:if>
								<c:if test="${adsPlace != null }">
									<li class="selected"><a href="javascript: void(0)">编辑CMS广告位</a></li>
								</c:if>
								
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid mng-form">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form id="adsPlaceForm">
							<div class="form-group">
								<label>广告位名称</label>
								<input type="hidden" class="form-control" name="id" value="${adsPlace.id }"/>
								<input type="text" class="form-control" name="name" placeholder="广告位名称..." value="${adsPlace.name }" />
							</div>
							<div class="form-group">
								<label for="exampleInputFile">宽度</label> 
								<input type="number" class="form-control" name="width" placeholder="请填写宽度" value="${adsPlace.width }" />
								<p class="help-block">单位：PX</p>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">高度</label> 
								<input type="number" class="form-control" name="height" placeholder="请填写宽度" value="${adsPlace.height }" />
								<p class="help-block">单位：PX</p>
							</div>
							<div class="form-group">
								<label>状态</label>
								<select class="form-control" name="status">
									<option value="1" selected>--启用--</option>
									<option value="-1">--禁用--</option>
								</select>
							</div>
							<button type="button" class="btn btn-success" onclick="submitFn()"><i class="fa fa-save"></i> 保存</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/ads_place.js" charset="utf-8"></script>
	
</body>
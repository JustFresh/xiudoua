<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/links.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=index&act=links">友情链接</a></li>
								<c:if test="${links == null }">
									<li class="selected"><a href="javascript: void(0)">添加友情链接</a></li>
								</c:if>
								<c:if test="${links != null }">
									<li class="selected"><a href="javascript: void(0)">编辑友情链接</a></li>
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
						<form id="linksForm">
							<div class="form-group">
								<label>友情链接名称</label>
								<input type="hidden" class="form-control" name="id" value="${links.id }"/>
								<input type="text" class="form-control" name="name" placeholder="请填写友情链接名称..." value="${links.name }" />
							</div>
							<div class="form-group">
								<label for="exampleInputFile">友情链接图片</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#logo','#thumbLogo','uploadLogo','links')" id="uploadLogo" name="file" />
							    <p class="help-block">缩略图尺寸200px*50px，请上传JPG、JPEG、PNG格式照片</p>
							    <input type="hidden" name="logo" id="logo" value="${links.logo }"/>
							    <c:if test="${links != null }">
							    	<img src="<%=basePath %>${links.logo }" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${links == null }">
							    	<img src="" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>链接地址</label>
								<c:if test="${links == null }">
									<input type="text" class="form-control" name="url" placeholder="链接地址必填..." value="#" />
								</c:if>
								<c:if test="${links != null }">
									<input type="text" class="form-control" name="url" placeholder="链接地址必填..." value="${links.url }" />
								</c:if>
								<p class="help-block">若没有确切的链接地址，请填写#代替</p>
							</div>
							<div class="form-group">
								<label>排序</label>
								<c:if test="${links == null }">
									<input type="text" class="form-control" name="reorder" value="1" />
								</c:if>
								<c:if test="${links != null }">
									<input type="text" class="form-control" name="reorder" value="${links.reorder }" />
								</c:if>
								
							</div>
							<div class="form-group">
								<label>新窗口打开</label>
								<select class="form-control" name="target">
									<option value="" selected>--否--</option>
									<option value="_blank">--是--</option>
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index/links.js" charset="utf-8"></script>
	
</body>
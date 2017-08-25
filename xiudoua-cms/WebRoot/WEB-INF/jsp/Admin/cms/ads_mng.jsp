<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/ads.css" />
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
								<c:if test="${ads == null }">
									<li class="selected"><a href="javascript: void(0)">添加CMS广告</a></li>
								</c:if>
								<c:if test="${ads != null }">
									<li class="selected"><a href="javascript: void(0)">编辑CMS广告</a></li>
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
						<form id="adsForm">
							<div class="form-group">
								<label>广告位</label>
								<input type="hidden" class="form-control" name="id" value="${ads.id }"/>
								<select class="form-control" name="spaceId" id="spaceId">
									<c:if test="${placeList != null }">
										<option value="">--请选择广告位--</option>
										<c:forEach var="adsPlace" items="${placeList }" varStatus="status">
											<option value="${adsPlace.id }" <c:if test="${ads.spaceId==adsPlace.id }">selected</c:if>>${adsPlace.name }</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label>广告名称</label>
								<input type="text" class="form-control" name="name" placeholder="广告名称必填..." value="${ads.name }" />
								<p class="help-block">广告名称必填</p>
							</div>
							<div class="form-group">
								<label>广告标题</label>
								<input type="text" class="form-control" name="title" placeholder="广告标题必填..." value="${ads.title }" />
								<p class="help-block">广告标题必填</p>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">广告图片</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#thumb','#thumbLogo','uploadLogo','ads')" id="uploadLogo" name="file" />
							    <p class="help-block" id="thumbWarning"></p>
							    <input type="hidden" name="thumb" id="thumb" value="${ads.thumb }"/>
							    <c:if test="${ads != null }">
							    	<img src="<%=basePath %>${ads.thumb }" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${ads == null }">
							    	<img src="" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>链接地址</label>
								<c:if test="${ads == null }">
									<input type="text" class="form-control" name="linkUrl" placeholder="链接地址必填..." value="#" />
								</c:if>
								<c:if test="${ads != null }">
									<input type="text" class="form-control" name="linkUrl" placeholder="链接地址必填..." value="${ads.linkUrl }" />
								</c:if>
								<p class="help-block">若没有确切的链接地址，请填写#代替</p>
							</div>
							<div class="form-group">
								<label>排序</label>
								<c:if test="${ads == null }">
									<input type="text" class="form-control" name="reorder" value="1" />
								</c:if>
								<c:if test="${ads != null }">
									<input type="text" class="form-control" name="reorder" value="${ads.reorder }" />
								</c:if>
								
							</div>
							<div class="form-group">
								<label>状态</label>
								<select class="form-control" name="status">
									<option value="1" selected>--启用--</option>
									<option value="-1">--禁用--</option>
								</select>
							</div>
							<div class="form-group">
								<label>备注</label>
								<textarea class="form-control" name="description" rows="5"></textarea>
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/ads.js" charset="utf-8"></script>
	
</body>
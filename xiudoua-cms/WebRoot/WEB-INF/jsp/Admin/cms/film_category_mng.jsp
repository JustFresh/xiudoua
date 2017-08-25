<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/film_cagetorys.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=cms&act=film_categorys">分类管理</a></li>
								<c:if test="${category == null }">
									<li class="selected"><a href="javascript: void(0)">添加影片分类</a></li>
								</c:if>
								<c:if test="${category != null }">
									<li class="selected"><a href="javascript: void(0)">编辑影片分类</a></li>
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
						<form id="filmCategoryForm">
							<div class="form-group">
								<label>父级栏目</label>
								<input type="hidden" class="form-control" name="id" value="${category.id }"/>
								<select class="form-control" name="parentId" id="parentId">
									<option value="">--请选择父级栏目--</option>
									<c:if test="${categoryList != null }">
										<c:forEach var="model" items="${categoryList }" varStatus="status">
											<option value="${model.id }" <c:if test="${model.id==channel.parentId }">selected</c:if>>${model.name }</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label>分类名称</label>
								<input type="text" class="form-control" name="name" placeholder="分类名称必填..." value="${category.name }" />
								<p class="help-block">分类名称必填</p>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">缩略图</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#thumb','#thumbLogo','uploadLogo','filmCategory')" id="uploadLogo" name="file" />
							    <p class="help-block" id="thumbWarning"></p>
							    <input type="hidden" name="thumb" id="thumb" value="${category.thumb }"/>
							    <c:if test="${category != null }">
							    	<img src="<%=basePath %>${category.thumb }" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${category == null }">
							    	<img src="" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>类型</label>
								<div class="form-control">
									<input type="radio" name="filmType" value="1" checked /> 电影单集
									<input type="radio" name="filmType" value="2" /> 电视续集
								</div>
							</div>
							<div class="form-group">
								<label>状态</label>
								<div class="form-control">
									<input type="radio" name="status" value="1" checked /> 启用
									<input type="radio" name="status" value="-1" /> 禁用
								</div>
							</div>
							<div class="form-group">
								<label>排序</label>
								<c:if test="${category == null }">
									<input type="text" class="form-control" name="reorder" value="1" />
								</c:if>
								<c:if test="${category != null }">
									<input type="text" class="form-control" name="reorder" value="${category.reorder }" />
								</c:if>
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/film_categorys.js" charset="utf-8"></script>
</body>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/channels.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=cms&act=channels">栏目管理</a></li>
								<c:if test="${channel == null }">
									<li class="selected"><a href="javascript: void(0)">添加CMS栏目</a></li>
								</c:if>
								<c:if test="${channel != null }">
									<li class="selected"><a href="javascript: void(0)">编辑CMS栏目</a></li>
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
						<form id="channelForm">
							<div class="form-group">
								<label>父级栏目</label>
								<input type="hidden" class="form-control" name="id" value="${channel.id }"/>
								<select class="form-control" name="parentId" id="parentId">
									<option value="">--请选择父级栏目--</option>
									<c:if test="${channelList != null }">
										<c:forEach var="model" items="${channelList }" varStatus="status">
											<option value="${model.id }" <c:if test="${model.id==channel.parentId }">selected</c:if>>${model.name }</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label>栏目名称</label>
								<input type="text" class="form-control" name="name" placeholder="栏目名称必填..." value="${channel.name }" />
								<p class="help-block">栏目名称必填</p>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">缩略图</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#thumb','#thumbLogo','uploadLogo','channels')" id="uploadLogo" name="file" />
							    <p class="help-block" id="thumbWarning"></p>
							    <input type="hidden" name="thumb" id="thumb" value="${channel.thumb }"/>
							    <c:if test="${channel != null }">
							    	<img src="<%=basePath %>${channel.thumb }" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${channel == null }">
							    	<img src="" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>栏目类型</label>
								<div class="form-control">
									<input type="radio" name="cType" value="1" checked /> 缩略图文章 
									<input type="radio" name="cType" value="2" /> 普通文章 
									<input type="radio" name="cType" value="3" /> 视频文章 
									<input type="radio" name="cType" value="4" /> 文件下载 
								</div>
							</div>
							<div class="form-group">
								<label>顶部导航</label>
								<div class="form-control">
									<input type="radio" name="isNav" value="1" checked /> 是
									<input type="radio" name="isNav" value="-1" /> 否
								</div>
							</div>
							<div class="form-group">
								<label>新窗口打开</label>
								<div class="form-control">
									<input type="radio" name="isBlank" value="1" /> 是
									<input type="radio" name="isBlank" value="-1" checked/> 否
								</div>
							</div>
							<div class="form-group">
								<label>排序</label>
								<c:if test="${channel == null }">
									<input type="text" class="form-control" name="reorder" value="1" />
								</c:if>
								<c:if test="${channel != null }">
									<input type="text" class="form-control" name="reorder" value="${channel.reorder }" />
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
								<label>栏目简介</label>
								<textarea class="form-control" name="introduce" rows="5"></textarea>
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/channels.js" charset="utf-8"></script>
	
</body>
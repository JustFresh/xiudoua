<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/contents.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=cms&act=contents">CMS文章管理</a></li>
								<c:if test="${ads == null }">
									<li class="selected"><a href="javascript: void(0)">添加CMS文章</a></li>
								</c:if>
								<c:if test="${ads != null }">
									<li class="selected"><a href="javascript: void(0)">编辑CMS文章</a></li>
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
					<form id="contentForm">
						<div class="col-sm-12 col-md-8">
							<div class="form-group">
								<label>标题</label>
								<input type="hidden" name="id" value="${content.id }" />
								<input type="text" class="form-control" name="title" placeholder="文章标题必填..." value="${content.title }" />
							</div>
							<div class="form-group">
								<label>栏目</label>
								<select name="channelId" class="form-control" id="channelId">
									<option value="">--请选择--</option>
									<c:forEach var="model" items="${channelList }" varStatus="status">
										<option value="${model.id }" <c:if test="${model.id==content.channelId }">selected</c:if>>${model.name }</option>
									</c:forEach>
								</select>
								<input type="hidden" name="channelName" id="channelName" value="${content.channelName }" />
							</div>
							<div class="form-group">
								<label>来源</label>
								<c:if test="${content.source != null }">
									<input type="text" class="form-control" name="source" value="${content.source }" />
								</c:if>
								<c:if test="${content.source == null }">
									<input type="text" class="form-control" name="source" value="本站原创" />
								</c:if>
							</div>
							<div class="form-group">
								<label>关键字</label>
								<input type="text" class="form-control" name="seoKeywords" placeholder="关键字不填写则默认为标题" value="${content.extObj.seoKeywords }"  />
							</div>
							<div class="form-group">
								<label>摘要</label>
								<textarea class="form-control" name="abstracts" rows="5">${content.extObj.abstracts }</textarea>
							</div>
						</div>
						<div class="col-sm-12 col-md-4">
							<div class="form-group">
								<label for="exampleInputFile">缩略图</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#thumb','#thumbLogo','uploadThumb','contents')" id="uploadThumb" name="file" />
							    <p class="help-block">缩略图尺寸300px*300px，请上传JPG、JPEG、PNG格式照片</p>
							    <input type="hidden" name="thumb" id="thumb" value="${content.thumb }"/>
							    <c:if test="${content != null }">
							    	<img src="<%=basePath %>${content.thumb }" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${content == null }">
							    	<img src="<%=basePath %>assets/images/default-content.jpg" style="max-width: 130px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>状态</label>
								<div class="form-control">
									<c:if test="${content.status != null }">
										<input type="radio" name="status" value="1" <c:if test="${content.status == 1 }">checked</c:if> /> 启用
										<input type="radio" name="status" value="-1" <c:if test="${content.status == -1 }">checked</c:if> /> 禁用
									</c:if>
									<c:if test="${content.status == null }">
										<input type="radio" name="status" value="1" checked/> 启用
										<input type="radio" name="status" value="-1" /> 禁用
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label>推荐</label>
								<div class="form-control">
									<c:if test="${content.isRecommend != null }">
										<input type="radio" name="isRecommend" value="-1" <c:if test="${content.isRecommend == -1 }">checked</c:if> /> 否
										<input type="radio" name="isRecommend" value="1" <c:if test="${content.isRecommend == 1 }">checked</c:if> /> 是
									</c:if>
									<c:if test="${content.isRecommend == null }">
										<input type="radio" name="isRecommend" value="-1" checked/> 否
										<input type="radio" name="isRecommend" value="1" /> 是
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label>置顶</label>
								<div class="form-control">
									<c:if test="${content.isTop != null }">
										<input type="radio" name="isTop" value="-1" <c:if test="${content.isTop == -1 }">checked</c:if> /> 否
										<input type="radio" name="isTop" value="1" <c:if test="${content.isTop == 1 }">checked</c:if> /> 是
									</c:if>
									<c:if test="${content.isTop == null }">
										<input type="radio" name="isTop" value="-1" checked/> 否
										<input type="radio" name="isTop" value="1" /> 是
									</c:if>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="col-sm-12 col-md-12">
							<div class="form-group">
								<label>内容</label>
								<textarea id="content" style="height: 400px;" name="content">${content.extObj.content }</textarea>
							</div>
							<button type="button" class="btn btn-success" onclick="submitFn()"><i class="fa fa-save"></i> 保存</button>
						</div>
					</form>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/plugin/ueditor1.4.3.3/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=basePath %>assets/plugin/ueditor1.4.3.3/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('content');
    </script>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/contents.js" charset="utf-8"></script>
	
</body>
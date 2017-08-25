<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/films.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=cms&act=films">影片管理</a></li>
								<c:if test="${film == null }">
									<li class="selected"><a href="javascript: void(0)">添加影片</a></li>
								</c:if>
								<c:if test="${film != null }">
									<li class="selected"><a href="javascript: void(0)">编辑影片</a></li>
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
					<form id="filmForm">
						<div class="col-sm-12 col-md-6">
							<div class="form-group">
								<label>影片分类</label>
								<input type="hidden" class="form-control" name="id" value="${film.id }"/>
								<input type="hidden" class="form-control" name="categoryName" value="${film.categoryName }" id="categoryName" />
								<select class="form-control" name="categoryId" id="categoryId">
									<option value="">--请选择影片分类--</option>
									<c:if test="${categoryList != null }">
										<c:forEach var="model" items="${categoryList }" varStatus="status">
											<option value="${model.id }" <c:if test="${model.id==film.categoryId }">selected</c:if>>${model.name }</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label>影片标题</label>
								<input type="text" class="form-control" name="title" placeholder="影片标题必填..." value="${film.title }" />
								<p class="help-block">影片标题必填</p>
							</div>
							<div class="form-group">
								<label>演员表</label>
								<c:if test="${film.stars == null }">
									<input type="text" class="form-control" name="stars" value="未知" />
								</c:if>
								<c:if test="${film.stars != null }">
									<input type="text" class="form-control" name="stars" value="${film.stars }" />
								</c:if>
								<p class="help-block">演员表必填</p>
							</div>
							<div class="form-group">
								<label>发行地</label>
								<c:if test="${film.country == null }">
									<input type="text" class="form-control" name="country" value="中国大陆" />
								</c:if>
								<c:if test="${film.country != null }">
									<input type="text" class="form-control" name="country" value="${film.country }" />
								</c:if>
								<p class="help-block">发行地必填</p>
							</div>
							<div class="form-group">
								<label>上映时间</label>
								<input type="text" class="form-control" name="releaseTime" placeholder="上映时间必填..." value="${film.releaseTime }" />
								<p class="help-block">上映时间必填</p>
							</div>
							<div class="form-group">
								<label>清晰度</label>
								<div class="form-control">
									<c:if test="${film.definition != null }">
										<input type="radio" name="definition" value="抢版" <c:if test="${film.definition == '抢版' }">checked</c:if> /> 抢版
										<input type="radio" name="definition" value="标清" <c:if test="${film.definition == '标清' }">checked</c:if> /> 标清
										<input type="radio" name="definition" value="高清" <c:if test="${film.definition == '高清' }">checked</c:if> /> 高清
										<input type="radio" name="definition" value="超清" <c:if test="${film.definition == '超清' }">checked</c:if> /> 超清
										<input type="radio" name="definition" value="蓝光" <c:if test="${film.definition == '蓝光' }">checked</c:if> /> 蓝光
									</c:if>
									<c:if test="${film.definition == null }">
										<input type="radio" name="definition" value="抢版" /> 抢版
										<input type="radio" name="definition" value="标清" /> 标清
										<input type="radio" name="definition" value="高清" checked /> 高清
										<input type="radio" name="definition" value="超清" /> 超清
										<input type="radio" name="definition" value="蓝光" /> 蓝光
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label>豆瓣评分</label>
								<c:if test="${film.douban == null }">
									<input type="text" class="form-control" name="douban" value="8" />
								</c:if>
								<c:if test="${film.douban != null }">
									<input type="text" class="form-control" name="douban" value="${film.douban }" />
								</c:if>
							</div>
							<div class="form-group">
								<label>状态</label>
								<div class="form-control">
									<c:if test="${film.status == null }">
										<input type="radio" name="status" value="1" checked /> 启用
										<input type="radio" name="status" value="-1"/> 禁用
									</c:if>
									<c:if test="${film.status != null }">
										<input type="radio" name="status" value="1" <c:if test="${film.status == 1 }">checked</c:if> /> 启用
										<input type="radio" name="status" value="-1" <c:if test="${film.status == -1 }">checked</c:if> /> 禁用
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label>来源</label>
								<c:if test="${film.source == null }">
									<input type="text" class="form-control" name="source" value="互联网搜集" />
								</c:if>
								<c:if test="${film.source != null }">
									<input type="text" class="form-control" name="source" value="${film.source }" />
								</c:if>
								<p class="help-block">影片来源必填</p>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div class="form-group">
								<label for="exampleInputFile">缩略图</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#thumb','#thumbLogo','uploadLogo','filmCategory')" id="uploadLogo" name="file" />
							    <p class="help-block">缩略图尺寸为500px*700px，格式为JPG、JPEG、PNG格式</p>
							    <c:if test="${film != null }">
							    	<input type="hidden" name="thumb" id="thumb" value="${film.thumb }"/>
							    	<img src="<%=basePath %>${film.thumb }" style="max-width: 100px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${film == null }">
							    	<input type="hidden" name="thumb" id="thumb" value="assets/images/default-film.jpg" />
							    	<img src="<%=basePath %>assets/images/default-film.jpg" style="max-width: 100px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>网盘下载地址</label>
								<c:if test="${film == wangpan }">
									<input type="text" class="form-control" name="wangpan" value="#" />
								</c:if>
								<c:if test="${film != wangpan }">
									<input type="text" class="form-control" name="wangpan" value="${film.wangpan }" />
								</c:if>
							</div>
							<div class="form-group">
								<label>迅雷下载地址</label>
								<c:if test="${film == xunlei }">
									<input type="text" class="form-control" name="xunlei" value="#" />
								</c:if>
								<c:if test="${film != xunlei }">
									<input type="text" class="form-control" name="xunlei" value="${film.xunlei }" />
								</c:if>
							</div>
							<div class="form-group">
								<label>影片简介</label>
								<c:if test="${film == abstracts }">
									<textarea class="form-control" name="abstracts" rows="4">这是一部牛掰的电影！！！</textarea>
								</c:if>
								<c:if test="${film != abstracts }">
									<textarea class="form-control" name="abstracts" rows="4">${film.abstracts }</textarea>
								</c:if>
								<p class="help-block">影片简介必填</p>
							</div>
							<div class="form-group">
								<label>相册列表</label>
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<td>
												<div class="upfilebox">
										            <input type="file" accept="image/*" onchange="uploadImg('#image1','#imgs1','uploadImgs1','filmImages')" id="uploadImgs1" name="file" />
										            <label>图片一</label>
												    <input type="hidden" name="image1" id="image1" value="assets/images/default-film-img.jpg" />
										        </div>
											</td>
											<td>
												<div class="upfilebox">
										            <input type="file" accept="image/*" onchange="uploadImg('#image2','#imgs2','uploadImgs2','filmImages')" id="uploadImgs2" name="file" />
										            <label>图片二</label>
												    <input type="hidden" name="image2" id="image2" value="assets/images/default-film-img.jpg" />
										        </div>
											</td>
											<td>
												<div class="upfilebox">
										            <input type="file" accept="image/*" onchange="uploadImg('#image3','#imgs3','uploadImgs3','filmImages')" id="uploadImgs3" name="file" />
										            <label>图片三</label>
												    <input type="hidden" name="image3" id="image3" value="assets/images/default-film-img.jpg" />
										        </div>
											</td>
											<td>
												<div class="upfilebox">
										            <input type="file" accept="image/*" onchange="uploadImg('#image4','#imgs4','uploadImgs4','filmImages')" id="uploadImgs4" name="file" />
										            <label>图片四</label>
												    <input type="hidden" name="image4" id="image4" value="assets/images/default-film-img.jpg" />
										        </div>
											</td>
											<td>
												<div class="upfilebox">
										            <input type="file" accept="image/*" onchange="uploadImg('#image5','#imgs5','uploadImgs5','filmImages')" id="uploadImgs5" name="file" />
										            <label>图片五</label>
												    <input type="hidden" name="image5" id="image5" value="assets/images/default-film-img.jpg" />
										        </div>
											</td>
										</tr>
										<tr>
											<c:if test="${!empty film.images}">
												<c:forEach var="image" items="${film.images}" varStatus="status" begin="0" end="5">
													<td><img src="<%=basePath %>${image.filmImage }" style="max-width: 100px;" id="imgs${status.index + 1 }" /></td>
												</c:forEach>
											</c:if>
											<c:if test="${empty film.images}">
												<td><img src="<%=basePath %>assets/images/default-film-img.jpg" style="max-width: 100px;" id="imgs1" /></td>
												<td><img src="<%=basePath %>assets/images/default-film-img.jpg" style="max-width: 100px;" id="imgs2" /></td>
												<td><img src="<%=basePath %>assets/images/default-film-img.jpg" style="max-width: 100px;" id="imgs3" /></td>
												<td><img src="<%=basePath %>assets/images/default-film-img.jpg" style="max-width: 100px;" id="imgs4" /></td>
												<td><img src="<%=basePath %>assets/images/default-film-img.jpg" style="max-width: 100px;" id="imgs5" /></td>
											</c:if>
										</tr>
									</thead>
								</table>
								<p class="help-block">缩略图尺寸为720px*400px，格式为JPG、JPEG、PNG格式;每部影片最多5张相册图片！！！</p>
							</div>
						</div>
						
						<div class="col-sm-12 col-md-12">
							<div class="form-group">
								<label>影片详情</label>
								<textarea id="content" style="height: 400px;" name="content">${film.content }</textarea>
							</div>
						</div>
						<div class="col-sm-12 col-md-12">
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/films.js" charset="utf-8"></script>
</body>
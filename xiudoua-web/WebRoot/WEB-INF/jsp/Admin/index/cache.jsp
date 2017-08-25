<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/cache.css" />
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="panel panel-warning info-panel">
						  	<div class="panel-heading">清理缓存</div>
						  	<div class="panel-body">
						  		<form action="" method="">
						  			<div class="form-group">
						  				<span class="check-block">
						  					<input type="checkbox" name="checkall" /> 全部
						  				</span>
						  			</div>
						  			<div class="form-group">
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 网站配置
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 商品分类
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 商品列表
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 文章分类
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 文章列表
						  				</span>
						  			</div>
						  			<div class="form-group">
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 首页
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> SEO
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 统计报告
						  				</span>
						  				<span class="check-block">
						  					<input type="checkbox" name="config" /> 广告缓存
						  				</span>
						  			</div>
						  			<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 清理缓存</button>
						  		</form>
						  	</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>		 
		</div>
		
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>
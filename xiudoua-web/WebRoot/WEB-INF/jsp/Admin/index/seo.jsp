<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/seo.css" />
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
								<li class="selected"><a href="javascript: void(0)">首页</a></li>
								<li><a href="javascript: void(0)">文章</a></li>
								<li><a href="javascript: void(0)">文章分类</a></li>
								<li><a href="javascript: void(0)">商品</a></li>
								<li><a href="javascript: void(0)">商品分类</a></li>
								<li><a href="javascript: void(0)">抢购</a></li>
								<li><a href="javascript: void(0)">品牌</a></li>
								<li><a href="javascript: void(0)">积分中心</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid warning-info">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<h4><i class="fa fa-warning"></i> 操作提示</h4>
						<p>插入的变量必需包括花括号“{}”，当应用范围不支持该变量时，该变量将不会在前台显示(变量后边的分隔符也不会显示)，留空为系统默认设置，SEO自定义支持手写。以下是可用SEO变量: </p>
						<p>插入的变量必需包括花括号“{}”，当应用范围不支持该变量时，该变量将不会在前台显示(变量后边的分隔符也不会显示)，留空为系统默认设置，SEO自定义支持手写。以下是可用SEO变量: </p>
					</div>
				</div>
			</div>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<ul class="tab-panel">
							<li class="selected">
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="首页标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" value="首页关键字" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control" value="首页描述" />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="文章标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control"  />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="文章标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control"  />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="文章标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control"  />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="文章标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control"  />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="文章标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control"  />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label><b>*</b> title</label>
										<input type="text" class="form-control" value="文章标题" />
									</div>
									<div class="form-group">
										<label><b>*</b> keywords</label>
										<input type="text" class="form-control" />
									</div>
									<div class="form-group">
										<label><b>*</b> description</label>
										<input type="text" class="form-control"  />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript">
	$(function(){
		$(".main .content .tab-nav ul li").click(function(){
			$(this).addClass("selected").siblings().removeClass("selected");
			$(".main .content .tab-panel li").eq($(this).index()).addClass("selected").siblings().removeClass("selected");
		});
	});
	</script>
</body>
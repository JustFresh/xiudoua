<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/uploadConfig.css" />
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
								<li class="selected"><a href="javascript: void(0)">上传参数</a></li>
								<li><a href="javascript: void(0)">默认图片</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
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
										<label>图片存放类型:</label> 
										<input type="radio" name="" value="1" checked /> 按文件名存放<br/>
										<input type="radio" name="" value="1"/> 按年份存放<br/>
										<input type="radio" name="" value="1"/> 按年月存放<br/>
										<input type="radio" name="" value="1"/> 按年月日存放<br/>
									</div>
									<div class="form-group">
										<label><b>*</b> 图片大小（KB）</label>
										<input type="text" class="form-control" value="1024" />
									</div>
									<div class="form-group">
										<label><b>*</b> 图片扩展名</label>
										<input type="text" class="form-control" value="gif,jpg,jpeg,bmp,png,swf" />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>默认商品图片：</label>
										<input type="file" />
									    <p class="help-block">300px*300px</p>
									</div>
									<div class="form-group">
										<label>默认店铺图片：</label>
										<input type="file" />
									    <p class="help-block">200px*60px</p>
									</div>
									<div class="form-group">
										<label>默认头像图片：</label>
										<input type="file" />
									    <p class="help-block">100px*100px</p>
									</div>
									<div class="form-group">
										<label>默认会员图片：</label>
										<input type="file" />
									    <p class="help-block">128px*128px</p>
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
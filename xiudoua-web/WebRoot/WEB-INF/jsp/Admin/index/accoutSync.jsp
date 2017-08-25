<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/accountSync.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-qq"></i> QQ互联</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-weibo"></i> 新浪微博</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-weixin"></i> 微信登录</a></li>
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
										<label>是否启用QQ互联功能</label> 
										是<input type="radio" name="" value="1" checked /> 
										否<input type="radio" name="" value="0" />
									</div>
									<div class="form-group">
										<label>域名验证信息</label> 
										<textarea rows="5" class="form-control"></textarea>
									</div>
									<div class="form-group">
										<label><b>*</b> 应用标识</label> 
										<input type="text" class="form-control" placeholder="请输入应用标识..." />
										<p class="help-block"><a href="https://connect.qq.com/" target="_blank" class="btn btn-warning">在线申请</a></p>
									</div>
									<div class="form-group">
										<label><b>*</b> 应用秘钥</label> 
										<input type="text" class="form-control" placeholder="请输入应用秘钥..." />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>新浪微博登录功能</label> 
										是<input type="radio" name="" value="1" checked /> 
										否<input type="radio" name="" value="0" />
									</div>
									<div class="form-group">
										<label>域名验证信息</label> 
										<textarea rows="5" class="form-control"></textarea>
									</div>
									<div class="form-group">
										<label><b>*</b> 应用标识</label> 
										<input type="text" class="form-control" placeholder="请输入应用标识..." />
										<p class="help-block"><a href="http://open.weibo.com/index.php" target="_blank" class="btn btn-warning">在线申请</a></p>
									</div>
									<div class="form-group">
										<label><b>*</b> 应用秘钥</label> 
										<input type="text" class="form-control" placeholder="请输入应用秘钥..." />
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>微信登录功能</label> 
										是<input type="radio" name="" value="1" checked /> 
										否<input type="radio" name="" value="0" />
									</div>
									<div class="form-group">
										<label>域名验证信息</label> 
										<textarea rows="5" class="form-control"></textarea>
									</div>
									<div class="form-group">
										<label><b>*</b> 应用标识</label> 
										<input type="text" class="form-control" placeholder="请输入应用标识..." />
										<p class="help-block"><a href="http://open.weibo.com/index.php" target="_blank" class="btn btn-warning">在线申请</a></p>
									</div>
									<div class="form-group">
										<label><b>*</b> 应用秘钥</label> 
										<input type="text" class="form-control" placeholder="请输入应用秘钥..." />
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
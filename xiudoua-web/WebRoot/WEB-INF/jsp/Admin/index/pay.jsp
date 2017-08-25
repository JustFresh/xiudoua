<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/pay.css" />
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
								<li class="selected"><a href="javascript: void(0)">支付宝<em class="success">已开启</em></a></li>
								<li><a href="javascript: void(0)">微信支付<em class="success">已开启</em></a></li>
								<li><a href="javascript: void(0)">财付通<em class="danger">关闭中</em></a></li>
								<li><a href="javascript: void(0)">网银在线<em class="danger">关闭中</em></a></li>
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
										<label>支付宝账号<em>（即时到账）</em></label> 
										<input type="text" class="form-control" placeholder="请填写您的支付宝账号..." />
									</div>
									<div class="form-group">
										<label>交易安全校验码（key）</label> 
										<input type="text" class="form-control" placeholder="请填写您的交易安全校验码..." />
									</div>
									<div class="form-group">
										<label>合作者身份（partner ID）</label> 
										<input type="text" class="form-control" placeholder="请填写您的partner ID..." />
									</div>
									<div class="form-group">
										<label>状态</label> 
										<input type="radio" name="" value="1" checked />启用 <br/>
										<input type="radio" name="" value="0" />关闭
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>公众号的唯一标识（appid）</label> 
										<input type="text" class="form-control" placeholder="请填写您的服务号AppID..." />
									</div>
									<div class="form-group">
										<label>商户号（mch_id）</label> 
										<input type="text" class="form-control" placeholder="请填写您的商户号ID..." />
									</div>
									<div class="form-group">
										<label>服务号的AppSecret</label> 
										<input type="text" class="form-control" placeholder="请填写您的AppSecret..." />
									</div>
									<div class="form-group">
										<label>商户支付key</label> 
										<input type="text" class="form-control" placeholder="请填写您的商户支付key..." />
									</div>
									<div class="form-group">
										<label>状态</label> 
										<input type="radio" name="" value="1" checked />启用 <br/>
										<input type="radio" name="" value="0" />关闭
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>财付通商户号</label> 
										<input type="text" class="form-control" placeholder="请填写您的财付通账号..." />
									</div>
									<div class="form-group">
										<label>财付通密钥</label> 
										<input type="text" class="form-control" placeholder="请填写您的财付通密码..." />
									</div>
									<div class="form-group">
										<label>状态</label> 
										<input type="radio" name="" value="1" checked />启用 <br/>
										<input type="radio" name="" value="0" />关闭
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>网银在线商户号</label> 
										<input type="text" class="form-control" placeholder="请填写您的网银在线商户号..." />
									</div>
									<div class="form-group">
										<label>网银在线密钥</label> 
										<input type="text" class="form-control" placeholder="请填写您的网银在线密钥..." />
									</div>
									<div class="form-group">
										<label>状态</label> 
										<input type="radio" name="" value="1" checked />启用 <br/>
										<input type="radio" name="" value="0" />关闭
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
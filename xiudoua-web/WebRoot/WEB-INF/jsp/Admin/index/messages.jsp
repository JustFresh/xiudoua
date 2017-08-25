<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/messages.css" />
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
								<li class="selected"><a href="javascript: void(0)">邮件设置</a></li>
								<li><a href="javascript: void(0)">短信平台设置</a></li>
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
										<label>SMTP服务器：<em>（设置 SMTP 服务器的地址，如 smtp.163.com）</em></label> 
										<input type="text" class="form-control" placeholder="请填写您的SMTP服务器地址..." />
									</div>
									<div class="form-group">
										<label>SMTP端口：<em>（设置 SMTP 服务器的端口，默认为 25）</em></label> 
										<input type="text" class="form-control" value="25" />
									</div>
									<div class="form-group">
										<label>发信人邮件地址:<em>（使用SMTP协议发送的邮件地址，如 abc@163.com）</em></label> 
										<input type="text" class="form-control" placeholder="请填写您的SMTP服务器地址..." />
									</div>
									<div class="form-group">
										<label>SMTP 身份验证用户名:：<em>（如 abc）</em></label> 
										<input type="text" class="form-control" placeholder="请填写您的SMTP服务器地址..." />
									</div>
									<div class="form-group">
										<label>SMTP 身份验证密码：<em>（abc@163.com邮件的密码，如 123456）</em></label> 
										<input type="password" class="form-control" placeholder="请填写您的SMTP服务器地址..." />
									</div>
									<div class="form-group">
										<label>测试接收的邮件地址:</label> 
										<input type="text" class="form-control" />
										<p class="help-block">
											<a href="javascript: void(0)" class="btn btn-default btn-sm">测试</a>
										</p>
									</div>
									<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
								</form>
							</li>
							<li>
								<form action="" method="post">
									<div class="form-group">
										<label>选择短信平台：<em>（二选一）</em></label> 
										<input type="radio" checked /> 短信宝 <br />
										<input type="radio" /> 云片网络
									</div>
									<div class="form-group">
										<label>短信服务商名称</label> 
										<input type="text" class="form-control" value="短信宝" />
										<p class="help-block">
											可选填写【短信宝<a href="http://api.smsbao.com/" target="_blank">http://api.smsbao.com/</a>】， 
											【云片网络<a href="http://www.yunpian.com/" target="_blank">http://www.yunpian.com/</a>】
										</p>
									</div>
									<div class="form-group">
										<label>短信平台账号:<em>（用户名）</em></label> 
										<input type="text" class="form-control" placeholder="请填写短信平台账号..." />
									</div>
									<div class="form-group">
										<label>短信平台密码</label> 
										<input type="text" class="form-control" placeholder="请填写短息平台密码..." />
									</div>
									<div class="form-group">
										<label>短信平台key<em>（可选填写【使用云片网络时用到】）</em></label> 
										<input type="password" class="form-control" placeholder="请填写短信平台key..." />
									</div>
									<div class="form-group">
										<label>短信内容签名</label> 
										<input type="password" class="form-control" placeholder="请填写短信内容签名..." />
									</div>
									<div class="form-group">
										<label>备注信息<em>（选填）</em></label> 
										<textarea rows="5" class="form-control"></textarea>
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
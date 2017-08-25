<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/config.css" />
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form method="post" class="config-form" id="settingsForm" enctype="multipart/form-data">
							<div class="form-group">
								<label>网站 名称<em>（网站名称，将显示在前台顶部欢迎信息等位置）</em></label> 
								<input type="text" class="form-control" placeholder="请输入网站名称..." name="siteName" value="${settings.siteName }" />
							</div>
							<div class="form-group">
								<label>网站LOGO<em>（如果你不知道LOGO，我只有一个大写的“服”）</em></label>
								<input type="file" accept="image/*" onchange="uploadImg('#logo','#thumbLogo','uploadLogo','settings')" id="uploadLogo" name="file" />
							    <p class="help-block">LOGO尺寸234px*60px，png格式</p>
							    <input type="hidden" name="logo" id="logo" value="${settings.logo }" />
							    <img src="<%=basePath %>${settings.logo }" style="max-width: 200px;" id="thumbLogo" />
							</div>
							<div class="form-group">
								<label>微信二维码<em>（如果你不知道LOGO，我只有一个大写的“服”）</em></label>
								<input type="file" accept="image/*" onchange="uploadImg('#weixin','#thumbWeixin','uploadWeixin','settings')" id="uploadWeixin" name="file" />
							    <p class="help-block">二维码为正方形，jpg或png格式</p>
							    <input type="hidden" name="weixin" id="weixin" value="${settings.weixin }"/>
							    <img src="<%=basePath %>${settings.weixin }" style="max-width: 200px;" id="thumbWeixin" />
							</div>
							<div class="form-group">
								<label>备案号<em>（前台页面底部可以显示 ICP 备案信息）</em></label> 
								<input type="text" class="form-control" placeholder="请输入网站备案信息..." name="recordNumber" value="${settings.recordNumber }" />
							</div>
							<div class="form-group">
								<label>客服 电话<em>（显示在网站的底部）</em></label> 
								<input type="text" class="form-control" placeholder="请输入网站客服电话..." name="siteNumber" value="${settings.siteNumber }" />
							</div>
							<div class="form-group">
								<label>电子 邮件<em>（显示在网站的底部）</em></label> 
								<input type="text" class="form-control" placeholder="请输入网站电子邮件..." name="siteEmail" value="${settings.siteEmail }" />
							</div>
							<div class="form-group">
								<label>第三方统计代码<em>（前台页面底部可以显示第三方统计）</em></label> 
								<textarea rows="5" class="form-control" name="thirdStatistics">${settings.thirdStatistics }</textarea>
								<input type="hidden" value="${settings.longitude }" id="longitude" />
								<input type="hidden" value="${settings.latitude }" id="latitude" />
							</div>
							<button type="button" class="btn btn-success" onclick="saveSettings()"><i class="fa fa-save"></i> 保存设置</button>
						</form>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index/config.js"></script>
</body>
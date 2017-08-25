<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/aboutUs.css" />
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="panel panel-warning info-panel">
						  	<div class="panel-heading">关于网站介绍</div>
						  	<div class="panel-body">
								<form>
									<div class="form-group">
										<label>网站 名称<em>（网站名称，将显示在前台顶部欢迎信息等位置）</em></label> 
										<input type="text" class="form-control" value="***网站" readonly />
									</div>
									<div class="form-group">
										<label>网站LOGO<em>（如果你不知道LOGO，我只有一个大写的“服”）</em></label>
										<img src="<%=basePath %>assets/images/logo.png" class="logo" />
									</div>
									<div class="form-group">
										<label>备案号<em>（前台页面底部可以显示 ICP 备案信息）</em></label> 
										<input type="text" class="form-control" value="黔ICP备*****号" readonly />
									</div>
									<div class="form-group">
										<label>客服电话<em>（显示在网站的底部）</em></label> 
										<input type="text" class="form-control" value="400-****-****" readonly />
									</div>
									<div class="form-group">
										<label>电子邮件<em>（显示在网站的底部）</em></label> 
										<input type="text" class="form-control" value="**********@qq.com" readonly />
									</div>
									<div class="form-group">
										<label>第三方统计代码<em>（前台页面底部可以显示第三方统计）</em></label> 
										<textarea rows="5" class="form-control"></textarea>
									</div>
									<div class="form-group">
										<label>地图展示<em>（展示平台位置）</em></label> 
										<div id="map" class="form-control" style="height: 500px;"></div>
									</div>
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index.js"></script>
	<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.3&key=f51c689d1dc29ee2767d078cdf54d0a4"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script type="text/javascript">
    var map = new AMap.Map('map', {
        resizeEnable: true,
        zoom:11,
        center: [104.898282,26.589085]
    });
    </script>
</body>
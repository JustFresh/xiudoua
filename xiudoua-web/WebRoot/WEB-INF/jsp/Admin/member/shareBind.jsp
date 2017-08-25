<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/member/shareBind.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-share"></i> 分享绑定</a></li>
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
						<p>开启并设置以下接口配置信息后，SNS分享店铺和商品信息功能中将可以使用站外分享信息功能</p>
					</div>
				</div>
			</div>
			
			<div class="container-fluid share-content">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>分享接口名称</th>
									<th>接口地址</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>腾讯微博</td>
									<td>http://t.qq.com</td>
									<td>否</td>
									<td>
										<a href="#" class="btn-outline btn-outline-success">开启</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td>新浪微博</td>
									<td>http://www.weibo.com</td>
									<td>否</td>
									<td>
										<a href="#" class="btn-outline btn-outline-success">开启</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>
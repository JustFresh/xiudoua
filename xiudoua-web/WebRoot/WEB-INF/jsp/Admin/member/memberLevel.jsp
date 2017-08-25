<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/member/memberLevel.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cog"></i> 级别管理</a></li>
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
						<p>“会员级别设置”提交后，当会员符合某个级别后将自动升至该级别，请谨慎设置会员级别</p>
						<p>建议：一、级别应该是逐层递增，例如“级别2”所需经验值高于“级别1”；二、设置的第一个级别所需经验值应为0；三、信息应填写完整</p>
					</div>
				</div>
			</div>
			
			<div class="container-fluid level">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<h4><i class="fa fa-level-down"></i>会员级别设置：</h4>
						<form action="" method="post">
							<dl>
								<dt>
									<label class="pull-left">级别</label>
									<div class="detail pull-left">
										经验值
									</div>
									<div class="clearfix"></div>
								</dt>
								<dd>
									<label class="pull-left">黄铜大仙</label>
									<div class="detail pull-left">
										<input type="text" class="input-text" name="" value="0" />
									</div>
									<div class="clearfix"></div>
								</dd>
								<dd>
									<label class="pull-left">白银渣渣</label>
									<div class="detail pull-left">
										<input type="text" class="input-text" name="" value="1024" />
									</div>
									<div class="clearfix"></div>
								</dd>
								<dd>
									<label class="pull-left">黄金战士</label>
									<div class="detail pull-left">
										<input type="text" class="input-text" name="" value="8888" />
									</div>
									<div class="clearfix"></div>
								</dd>
								<dd>
									<label class="pull-left">铂金小神</label>
									<div class="detail pull-left">
										<input type="text" class="input-text" name="" value="10000" />
									</div>
									<div class="clearfix"></div>
								</dd>
								<dd>
									<label class="pull-left">钻石大师</label>
									<div class="detail pull-left">
										<input type="text" class="input-text" name="" value="50000" />
									</div>
									<div class="clearfix"></div>
								</dd>
							</dl>
							<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>
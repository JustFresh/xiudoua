<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/member/infoList.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-info"></i> 发送通知</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid info-content">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form action="" method="post">
							<div class="form-line">
								<label>发送类型：</label>
								<div class="content-box">
									<input type="radio" name="" value="0" checked /> 全部会员 <br/>
									<input type="radio" name="" value="1" /> 指定会员 
								</div>
							</div>
							<div class="form-line">
								<label>会员列表：</label>
								<div class="content-box">
									<textarea rows="5"></textarea>
									<span>每行填写一个会员名</span>
								</div>
							</div>
							<div class="form-line">
								<label>通知内容：</label>
								<div class="content-box">
									<textarea rows="5"></textarea>
								</div>
							</div>
							<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>
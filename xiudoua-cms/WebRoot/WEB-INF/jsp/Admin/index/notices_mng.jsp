<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/notices.css" />
<!-- JustFresh 2017-07-31 begin 选择接收用户对话框 -->
<div id="acceptUsersDialog" class="hide">
	<div class="opt-form container-fluid">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<form action="" id="acceptUsersForm">
					<ul>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- JustFresh 2017-07-31 end 选择接收用户对话框 -->

<!-- JustFresh 2017-07-31 begin 选择接收用户对话框 -->
<div id="refuseUsersDialog" class="hide">
	<div class="opt-form container-fluid">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<form action="" id="refuseUsersForm">
					<ul>
						
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- JustFresh 2017-07-31 end 选择接收用户对话框 -->
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
								<li><a href="<%=basePath %>admin/index.htm?mod=index&act=notices">系统通知</a></li>
								<c:if test="${links == null }">
									<li class="selected"><a href="javascript: void(0)">添加系统通知</a></li>
								</c:if>
								<c:if test="${links != null }">
									<li class="selected"><a href="javascript: void(0)">编辑系统通知</a></li>
								</c:if>
								
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid mng-form">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form id="noticesForm">
							<input type="hidden" class="form-control" name="id" value="${notices.id }"/>
							<div class="form-group">
								<label>接收通知人</label>
								<div class="form-control">
									<input type="radio" name="isSendToAll" value="1" checked /> 所有人员
									<input type="radio" name="isSendToAll" value="-1" /> 指定人员
								</div>
							</div>
							<div class="form-group">
								<label>接收通知人员名单</label><br>
								<button type="button" class="btn btn-warning" onclick="openAcceptDialog()"><i class="fa fa-user"></i> 请选择</button>
								<p class="help-block" id="acceptNames"></p>
								<input type="hidden" name="acceptIds" id="acceptIds" />
							</div>
							<div class="form-group">
								<label>接收通知人员黑名单</label><br>
								<button type="button" class="btn btn-danger" onclick="openRefuseDialog()"><i class="fa fa-close"></i> 请选择</button>
								<p class="help-block" id="refuseNames"></p>
								<input type="hidden" name="refuseIds" id="refuseIds" />
							</div>
							<div class="form-group">
								<label>通知标题</label>
								<input type="text" class="form-control" name="title" placeholder="请输入通知标题..." value="${notices.title }"/>
							</div>
							<div class="form-group">
								<label>通知内容</label>
								<textarea class="form-control" rows="7" name="content">${notices.content }</textarea>
							</div>
							<button type="button" class="btn btn-success" onclick="submitFn()"><i class="fa fa-save"></i> 保存</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index/notices.js" charset="utf-8"></script>
	
</body>
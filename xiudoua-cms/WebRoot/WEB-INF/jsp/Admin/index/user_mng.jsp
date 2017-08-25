<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/users.css" />
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
								<li><a href="<%=basePath %>admin/index.htm?mod=index&act=users">系统用户</a></li>
								<c:if test="${links == null }">
									<li class="selected"><a href="javascript: void(0)">添加系统用户</a></li>
								</c:if>
								<c:if test="${links != null }">
									<li class="selected"><a href="javascript: void(0)">编辑系统用户</a></li>
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
						<form id="userForm">
							<div class="form-group">
								<label>登录名</label>
								<input type="hidden" class="form-control" name="id" value="${user.id }"/>
								<input type="text" class="form-control" name="userName" placeholder="请填写用户登录名..." value="${user.userName }" />
							</div>
							<div class="form-group">
								<label>用户昵称</label>
								<input type="text" class="form-control" name="nickName" placeholder="请填写用户昵称..." value="${user.nickName }" />
							</div>
							<div class="form-group">
								<label for="exampleInputFile">用户头像</label> 
								<input type="file" accept="image/*" onchange="uploadImg('#thumb','#thumbLogo','uploadThumb','users')" id="uploadThumb" name="file" />
							    <p class="help-block">用户头像尺寸200px*200px，请上传JPG、JPEG、PNG格式照片</p>
							    <input type="hidden" name="thumb" id="thumb" value="${user.thumb }"/>
							    <c:if test="${links != null }">
							    	<img src="<%=basePath %>${user.thumb }" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>		    
							    <c:if test="${links == null }">
							    	<img src="" style="max-width: 200px;" id="thumbLogo" />
							    </c:if>
							</div>
							<div class="form-group">
								<label>登录密码</label>
								<input type="password" class="form-control" name="password" placeholder="请填写登录密码..." value="${user.password }" />
								<p class="help-block">登录密码由6-20位字母、数字和特殊字符组成。</p>
							</div>
							<div class="form-group">
								<label>联系电话</label>
								<input type="text" class="form-control" name="phone" placeholder="请填写联系电话..." value="${user.phone }" />
							</div>
							<div class="form-group">
								<label>电话验证</label>
								<div class="form-control">
									<input type="radio" name="isCheckPhone" value="-1" checked /> 未验证
									<input type="radio" name="isCheckPhone" value="1" /> 已验证
								</div>
							</div>
							<div class="form-group">
								<label>联系邮箱</label>
								<input type="text" class="form-control" name="email" placeholder="请填写联系邮箱..." value="${user.email }" />
							</div>
							<div class="form-group">
								<label>邮箱验证</label>
								<div class="form-control">
									<input type="radio" name="isCheckEmail" value="-1" checked /> 未验证
									<input type="radio" name="isCheckEmail" value="1" /> 已验证
								</div>
							</div>
							<div class="form-group">
								<label>联系QQ</label>
								<input type="text" class="form-control" name="qq" placeholder="请填写联系QQ..." value="${user.qq }" />
							</div>
							<div class="form-group">
								<label>性别</label>
								<div class="form-control">
									<input type="radio" name="gender" value="男" checked /> 男
									<input type="radio" name="gender" value="女" /> 女
								</div>
							</div>
							<div class="form-group">
								<label>家庭住址</label>
								<input type="text" class="form-control" name="address" placeholder="请填写家庭住址..." value="${user.address }" />
							</div>
							<div class="form-group">
								<label>状态</label>
								<div class="form-control">
									<input type="radio" name="status" value="1" checked /> 启用
									<input type="radio" name="status" value="-1" /> 禁用
								</div>
							</div>
							<div class="form-group">
								<label>个人简介</label>
								<textarea class="form-control" rows="5" name="introduce"></textarea>
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index/users.js" charset="utf-8"></script>
	
</body>
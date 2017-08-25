<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/login.css" />
<body>
<div class="login-box">
	<h3>***管理后台</h3>
	<div class="login">
		<form name="loginForm" id="loginForm">
			<div class="form-group">
				<label>登录名</label>
				<input type="text" class="form-control" name="loginName" placeholder="请输入管理员登录名..." required />
			</div>
			<div class="form-group">
				<label>密码</label>
				<input type="password" class="form-control" name="password" placeholder="请输入管理员登录密码..." required />
			</div>
			<div class="form-group">
				<label>验证码</label>
				<div class="clearfix"></div>
				<input type="number" class="form-control checkcode" placeholder="请输入验证码..." name="checkcode" required min="1" max="9999" />
				<img id="verify" onclick="refVerify()" class="pull-right" title="点击切换验证码" src="<%=basePath %>/admin/getVerifyCode.do"/>
				<div class="clearfix"></div>
			</div>
			<button type="button" class="btn btn-success btn-block" onclick="login()"><i class="fa fa-rocket"></i> 登录</button>
		</form>
	</div>
</div>
<jsp:include page="/admin/js.do"></jsp:include>
<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/login.js"></script>
<script type="text/javascript">
	var act = 0;
	var bgTimer = setInterval(function(){
		if(act < 3){
			act ++;
		}else{
			act = 0;
		}
		$("body").css("background","url(<%=basePath %>assets/images/admin-bg/" + (act+1) + ".jpg)  top center no-repeat");
	},5000);
	</script>
</body>
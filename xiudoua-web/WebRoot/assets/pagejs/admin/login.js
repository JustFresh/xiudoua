/**
 * @desc: 管理员登录页面的JS文件
 * @time: 2017-06-24 15::39
 * @autohor: JustFresh
 * @version: v1.0.0
 */
var admin = {};
admin.loginName = null,admin.password = null,admin.checkcode = null;
$(function(){
	
});

var login = function(){
	if(checkform("#loginForm")){
		//进行ajax登录
		$.ajax({
			type: "post",
			url: siteUrl + "/admin/rlogin.htm",
			data: admin,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					window.location.href = siteUrl + "/admin/index.htm?mod=index&act=index";
				}
			}
		});
	}
};

var checkform = function(formId){
	admin.loginName = $(formId).find("input[name='loginName']").val();
	if(admin.loginName == null || admin.loginName.trim() == ""){
		layer.msg("用户名不能为空");
		return false;
	}
	admin.password = $(formId).find("input[name='password']").val();
	if(admin.password == null || admin.password.trim() == ""){
		layer.msg("登录密码不能为空");
		return false;
	}
	admin.checkcode = $(formId).find("input[name='checkcode']").val();
	if(admin.checkcode == null || admin.checkcode.trim() == ""){
		layer.msg("验证码不能为空");
		return false;
	}
	return true;
};

var refVerify = function(){
	$('#verify').attr("src", siteUrl + "/admin/getVerifyCode.do?timestamp=" + (new Date()).valueOf());
};
/**
 * @description：后台管理/站点设置的JS文件
 * @author：JustFresh
 * @time：2017-07-29
 */

var settingsForm = {};

var saveSettings = function(){
	if(checkForm()){
		//准备提交
		$.ajax({
			type: "post",
			url: siteUrl + "admin/siteConfig.htm",
			data: settingsForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.reload();
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	settingsForm = $("#settingsForm").serializeJson();
	if(settingsForm == undefined || settingsForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(settingsForm.siteName == null || settingsForm.siteName.trim() == ""){
		layer.msg("站点名称你最起码得输入一个吧！！！");
	}
	return true;
};
/**
 * @description：系统后台用户管理JS文件
 * @author：JustFresh
 * @time：2017-07-29 21:00
 */

var userForm = {};
var checkAll = false;

function changeCheckboxStatus(inputName){
	if(checkAll){
		//反选
		$("input[name=" + inputName + "]").removeAttr("checked");
		checkAll = false;
	}else{
		//全选
		$("input[name='" + inputName + "']").attr("checked","true");
		checkAll = true;
	}
}

function batchRemove(inputName,table){
	var ids = '';
	$.each($("input[name='" + inputName + "']:checked"),function(){
           ids += $(this).val() + ",";
       });
	if(ids == null || ids.trim() == ""){
		layer.msg("请选择需要批量删除的数据！！！");
		return;
	}else{
		layer.confirm('确定执行批量删除操作！！！', {
			btn: ['确定','再想想'] //按钮
		}, function(){
			//确认要删除
			$.ajax({
				type: "post",
				url: siteUrl + "admin/" + table + "/batchRemove.htm",
				data: {
					ids: ids
				},dataType: "json",
				success: function(res){
					layer.msg(res.msg);
					if(res.success){
						setTimeout(function(){
							window.location.href = siteUrl + "admin/index.htm?mod=index&act=users";
						},2000);
					}
				}
			});
		},function(){
			layer.close();
		});
	}
}

var submitFn = function(){
	if(checkForm()){
		//提交增加/编辑友情链接
		var url = "";
		if(userForm.id != null && userForm.id != "" && parseInt(userForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/user/editUser.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/user/addUser.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: userForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=index&act=users";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	userForm = $("#userForm").serializeJson();
	if(userForm == undefined || userForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(userForm.userName == null || userForm.userName.trim() == ""){
		layer.msg("请输入用户登录名！！！");
		return false;
	}
	if(userForm.thumb == null || userForm.thumb.trim() == ""){
		layer.msg("请上传用户头像！！！");
		return false;
	}
	if(userForm.password == null || userForm.password.trim() == ""){
		layer.msg("请填写用户登录密码！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除数据！！！");
		return;
	}
	layer.confirm('确定删除数据', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/user/removeUser.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=index&act=users";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};

var changeStatus = function(userId,status){
	$.ajax({
		type: "post",
		url: siteUrl + "admin/user/changeStatus.htm",
		data: {id: userId,status: status},dataType: "json",
		success: function(res){
			layer.msg(res.msg);
			if(res.success){
				setTimeout(function(){
					window.location.href = siteUrl + "admin/index.htm?mod=index&act=users";
				},2000);
			}
		}
	});
};
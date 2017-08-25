/**
 *
 *
 */
var users = {};
var noticesForm = {};
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

$(function(){
	//页面加载的时候查询用户数据存储
	$.ajax({
		type: "post",
		url: siteUrl + "admin/user/getList.htm",
		data: {},
		dataType: "json",
		success: function(res){
			if(res.success){
				users = res.obj;
			}
		}
	});
	
});

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
							window.location.href = siteUrl + "admin/index.htm?mod=index&act=notices";
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
		//提交增加/编辑系统通知
		var url = "";
		if(noticesForm.id != null && noticesForm.id != "" && parseInt(noticesForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/notices/editNotices.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/notices/addNotices.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: noticesForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=index&act=notices";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	noticesForm = $("#noticesForm").serializeJson();
	if(noticesForm == undefined || noticesForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(noticesForm.title == null || noticesForm.title.trim() == ""){
		layer.msg("标题必填！！！");
		return false;
	}
	if(noticesForm.content == null || noticesForm.content.trim() == ""){
		layer.msg("内容必填！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的数据！！！");
		return;
	}
	layer.confirm('确定删除系统通知', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/notices/removeNotices.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=index&act=notices";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};

var openAcceptDialog = function(){
	var acceptIds = "";
	var acceptNames = "";
	//清除对话框上面用户选择数据
	$('#acceptUsersDialog ul').empty();
	//将用户数据渲染到页面上
	if(users != undefined && users != null && users.length > 0){
		var usersHtml = "";
		for(var i=0;i<users.length;i++){
			usersHtml += "<li><input type='checkbox' name='userIds' value='" + users[i].id + "' /> <span>" + users[i].nickName + "</span></li>";
		}
		$('#acceptUsersDialog ul').append(usersHtml);
	}
	//页面层
	layer.open({
		type: 1,
		title: "白名单用户选择",
		skin: 'layui-layer-rim', //加上边框
		area: ['500px', '520px'], //宽高
		content: $('#acceptUsersDialog'),
		btn: ['确认'],
		yes: function(){
			acceptIds = $("#acceptUsersForm").serializeJson().userIds;
			$("#acceptIds").val(acceptIds);
			$('#acceptUsersDialog input').each(function(){
				if($(this).attr("checked")){
					acceptNames += "<span style='margin-right:5px;'>" + $(this).parent().find("span").text() + "</span>";
				}
			});
			$("#acceptNames").empty();
			$("#acceptNames").append(acceptNames);
			layer.closeAll();
		}
	});
	$("#acceptUsersDialog").removeClass("hide");
};

var openRefuseDialog = function(){
	var refuseIds = "";
	var refuseNames = "";
	//清除对话框上面用户选择数据
	$('#refuseUsersDialog ul').empty();
	//将用户数据渲染到页面上
	if(users != undefined && users != null && users.length > 0){
		var usersHtml = "";
		for(var i=0;i<users.length;i++){
			usersHtml += "<li><input type='checkbox' name='userIds' value='" + users[i].id + "' /> <span>" + users[i].nickName + "</span></li>";
		}
		$('#refuseUsersDialog ul').append(usersHtml);
	}
	//页面层
	layer.open({
		type: 1,
		title: "黑名单用户选择",
		skin: 'layui-layer-rim', //加上边框
		area: ['500px', '520px'], //宽高
		content: $('#refuseUsersDialog'),
		btn: ['确认'],
		yes: function(){
			refuseIds = $("#refuseUsersForm").serializeJson().userIds;
			$("#refuseIds").val(refuseIds);
			$('#refuseUsersDialog input').each(function(){
				if($(this).attr("checked")){
					refuseNames += "<span style='margin-right:5px;'>" + $(this).parent().find("span").text() + "</span>";
				}
			});
			$("#refuseNames").empty();
			$("#refuseNames").append(refuseNames);
			layer.closeAll();
		}
	});
	$("#refuseUsersDialog").removeClass("hide");
};
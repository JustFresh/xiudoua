/**
 *
 *
 */

var channelForm = {};
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
							window.location.href = siteUrl + "admin/index.htm?mod=cms&act=channels";
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
		//提交增加/编辑栏目
		var url = "";
		if(channelForm.id != null && channelForm.id != "" && parseInt(channelForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/channel/editChannel.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/channel/addChannel.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: channelForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=channels";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	channelForm = $("#channelForm").serializeJson();
	if(channelForm == undefined || channelForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(channelForm.name == null || channelForm.name.trim() == ""){
		layer.msg("请输入栏目名称！！！");
		return false;
	}
	if(channelForm.thumb == null || channelForm.thumb.trim() == ""){
		layer.msg("请上传栏目图片！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的栏目！！！");
		return;
	}
	layer.confirm('确定删除栏目', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/channel/removeChannel.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=channels";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};

var changeStatus = function(channelId,status){
	$.ajax({
		type: "post",
		url: siteUrl + "admin/channel/changeStatus.htm",
		data: {id: channelId,status: status},dataType: "json",
		success: function(res){
			layer.msg(res.msg);
			if(res.success){
				setTimeout(function(){
					window.location.href = siteUrl + "admin/index.htm?mod=cms&act=channels";
				},2000);
			}
		}
	});
};

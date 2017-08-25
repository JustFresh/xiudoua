/**
 *
 *
 */

var adsForm = {};
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
							window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads";
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
		//提交增加/编辑广告
		var url = "";
		if(adsForm.id != null && adsForm.id != "" && parseInt(adsForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/ads/editAds.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/ads/addAds.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: adsForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	adsForm = $("#adsForm").serializeJson();
	if(adsForm == undefined || adsForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(adsForm.spaceId == null || adsForm.spaceId.trim() == ""){
		layer.msg("请选择广告位！！！");
		return false;
	}
	if(adsForm.name == null || adsForm.name.trim() == ""){
		layer.msg("请输入广告名称！！！");
		return false;
	}
	if(adsForm.title == null || adsForm.title.trim() == ""){
		layer.msg("请填写广告标题！！！");
		return false;
	}
	if(adsForm.thumb == null || adsForm.thumb.trim() == ""){
		layer.msg("请上传广告图片！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的广告！！！");
		return;
	}
	layer.confirm('确定删除广告', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/ads/removeAds.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};

var changeStatus = function(adsId,status){
	$.ajax({
		type: "post",
		url: siteUrl + "admin/ads/changeStatus.htm",
		data: {id: adsId,status: status},dataType: "json",
		success: function(res){
			layer.msg(res.msg);
			if(res.success){
				setTimeout(function(){
					window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads";
				},2000);
			}
		}
	});
};

$(function(){
	$("#spaceId").change(function(){
		if($(this).val() != ""){
			//查询当前广告位信息并回显具体宽度、高度到页面上
			$.ajax({
				type: "post",
				url: siteUrl + "admin/adsPlace/getOne.htm",
				data: {
					id: $(this).val()
				},dataType: "json",
				success: function(res){
					if(res.success){
						var tempHtml = "";
						tempHtml += "宽度：" + res.obj.width + "PX ";
						tempHtml += "高度：" + res.obj.height + "PX";
						$("#thumbWarning").empty();
						$("#thumbWarning").append(tempHtml);
					}
				}
			});
		}else{
			$("#thumbWarning").empty();
		}
	});
});
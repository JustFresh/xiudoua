/**
 *
 *
 */

var adsPlaceForm = {};
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
							window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads&opt=ads_places";
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
		//提交增加/编辑广告位
		var url = "";
		if(adsPlaceForm.id != null && adsPlaceForm.id != "" && parseInt(adsPlaceForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/adsPlace/editAdsPlace.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/adsPlace/addAdsPlace.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: adsPlaceForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads&opt=ads_places";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	adsPlaceForm = $("#adsPlaceForm").serializeJson();
	if(adsPlaceForm == undefined || adsPlaceForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(adsPlaceForm.name == null || adsPlaceForm.name.trim() == ""){
		layer.msg("请输入广告位名称！！！");
		return false;
	}
	if(adsPlaceForm.width == null || adsPlaceForm.width.trim() == ""){
		layer.msg("请填写宽度！！！");
		return false;
	}
	if(adsPlaceForm.height == null || adsPlaceForm.height.trim() == ""){
		layer.msg("请填写高度！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的广告位！！！");
		return;
	}
	layer.confirm('确定删除广告位', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/adsPlace/removeAdsPlace.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads&opt=ads_places";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};

var changeStatus = function(adsPlaceId,status){
	$.ajax({
		type: "post",
		url: siteUrl + "admin/adsPlace/changeStatus.htm",
		data: {id: adsPlaceId,status: status},dataType: "json",
		success: function(res){
			layer.msg(res.msg);
			if(res.success){
				setTimeout(function(){
					window.location.href = siteUrl + "admin/index.htm?mod=cms&act=ads&opt=ads_places";
				},2000);
			}
		}
	});
};
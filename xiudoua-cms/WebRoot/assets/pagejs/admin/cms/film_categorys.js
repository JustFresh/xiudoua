/**
 *
 */

var filmCategoryForm = {};
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
							window.location.href = siteUrl + "admin/index.htm?mod=cms&act=film_categorys";
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
		//提交增加/编辑影片分类
		var url = "";
		if(filmCategoryForm.id != null && filmCategoryForm.id != "" && parseInt(filmCategoryForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/filmCategory/editFilmCategory.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/filmCategory/addFilmCategory.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: filmCategoryForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=film_categorys";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	filmCategoryForm = $("#filmCategoryForm").serializeJson();
	if(filmCategoryForm == undefined || filmCategoryForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(filmCategoryForm.name == null || filmCategoryForm.name.trim() == ""){
		layer.msg("请输入影片分类名称！！！");
		return false;
	}
	if(filmCategoryForm.thumb == null || filmCategoryForm.thumb.trim() == ""){
		layer.msg("请上传影片分类图片！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的影片分类！！！");
		return;
	}
	layer.confirm('确定删除影片分类', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/filmCategory/removeFilmCategory.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=film_categorys";
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
		url: siteUrl + "admin/filmCategory/changeStatus.htm",
		data: {id: channelId,status: status},dataType: "json",
		success: function(res){
			layer.msg(res.msg);
			if(res.success){
				setTimeout(function(){
					window.location.href = siteUrl + "admin/index.htm?mod=cms&act=film_categorys";
				},2000);
			}
		}
	});
};
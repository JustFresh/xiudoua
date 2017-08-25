/**
 *
 *
 */

var contentForm = {};
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
							window.location.href = siteUrl + "admin/index.htm?mod=cms&act=contents";
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
		//提交增加/编辑文章
		var url = "";
		if(contentForm.id != null && contentForm.id != "" && parseInt(contentForm.id) > 0){
			//编辑文章信息
			url = siteUrl + "admin/content/editContent.htm";
		}else{
			//添加文章信息
			url = siteUrl + "admin/content/addContent.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: contentForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=contents";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	contentForm = $("#contentForm").serializeJson();
	if(contentForm == undefined || contentForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(contentForm.title == null || contentForm.title.trim() == ""){
		layer.msg("请输入文章标题！！！");
		return false;
	}
	if(contentForm.channelId == null || contentForm.channelId.trim() == ""){
		layer.msg("请选择文章栏目！！！");
		return false;
	}
	if(contentForm.content == null || contentForm.content.trim() == ""){
		layer.msg("请输入文章内容！！！");
		return false;
	}
	//如果未输入来源则默认来源为标题
	if(contentForm.source == null || contentForm.source.trim() == ""){
		contentForm.source = "本站原创";
	}
	//如果未输入关键字则默认关键字为标题
	if(contentForm.seoKeywords == null || contentForm.seoKeywords.trim() == ""){
		contentForm.seoKeywords = contentForm.title;
	}
	//如果未输入摘要则默认摘要为标题
	if(contentForm.abstracts == null || contentForm.abstracts.trim() == ""){
		contentForm.abstracts = contentForm.title;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的文章！！！");
		return;
	}
	layer.confirm('确定删除文章', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/content/removeContent.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=contents";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};

var changeStatus = function(contentId,status){
	if(contentId != null && contentId > 0){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/content/changeStatus.htm",
			data: {id: contentId,status: status},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=contents";
					},2000);
				}
			}
		});
	}
};

var changeRecommend = function(contentId,isRecommend){
	if(contentId != null && contentId > 0){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/content/changeRecommend.htm",
			data: {id: contentId,isRecommend: isRecommend},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=contents";
					},2000);
				}
			}
		});
	}
	
};

var changeTop = function(contentId,isTop){
	if(contentId != null && contentId > 0){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/content/changeTop.htm",
			data: {id: contentId,isTop: isTop},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=contents";
					},2000);
				}
			}
		});
	}
};


$(function(){
	$("#channelId").change(function(){
		if($(this).val() != ""){
			$.ajax({
				type: "post",
				url: siteUrl + "admin/channel/getOne.htm",
				data: {
					id: $(this).val()
				},dataType: "json",
				success: function(res){
					if(res.success){
						$("#channelName").val(res.obj.name);
					}else{
						$("#channelName").val("");
					}
				}
			});
		}else{
			$("#channelName").val("");
		}
	});
});

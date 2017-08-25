/**
 *
 */

var filmForm = {};
var checkAll = false;
var sequelsLineMaxId = 0;

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
							window.location.href = siteUrl + "admin/index.htm?mod=cms&act=films";
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
		//提交增加/编辑影片
		var url = "";
		if(filmForm.id != null && filmForm.id != "" && parseInt(filmForm.id) > 0){
			//编辑影片信息
			url = siteUrl + "admin/film/editFilm.htm";
		}else{
			//添加影片信息
			url = siteUrl + "admin/film/addFilm.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: filmForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=films";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	filmForm = $("#filmForm").serializeJson();
	if(filmForm == undefined || filmForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(filmForm.categoryId == null || filmForm.categoryId.trim() == ""){
		layer.msg("请选择影片分类！！！");
		return false;
	}
	if(filmForm.title == null || filmForm.title.trim() == ""){
		layer.msg("请填写影片标题！！！");
		return false;
	}
	if(filmForm.stars == null || filmForm.stars.trim() == ""){
		layer.msg("请填写演员表！！！");
		return false;
	}
	if(filmForm.releaseTime == null || filmForm.releaseTime.trim() == ""){
		layer.msg("请填写上映时间！！！");
		return false;
	}
	if(filmForm.source == null || filmForm.source.trim() == ""){
		layer.msg("请填写来源！！！");
		return false;
	}
	if(filmForm.content == null || filmForm.content.trim() == ""){
		layer.msg("请填写详细内容！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的影片！！！");
		return;
	}
	layer.confirm('确定删除影片', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/film/removeFilm.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=cms&act=films";
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
		url: siteUrl + "admin/film/changeStatus.htm",
		data: {id: channelId,status: status},dataType: "json",
		success: function(res){
			layer.msg(res.msg);
			if(res.success){
				setTimeout(function(){
					window.location.href = siteUrl + "admin/index.htm?mod=cms&act=films";
				},2000);
			}
		}
	});
};

$(function(){
	
	$("#categoryId").change(function(){
		if($(this).val() != null && $(this).val() != ""){
			$.ajax({
				type: "post",
				url: siteUrl + "admin/filmCategory/getOne.htm",
				data: {
					id: $(this).val()
				},dataType: "json",
				success: function(res){
					if(res.success){
						$("#categoryName").val(res.obj.name);
					}
				}
			});
		}else{
			$("#categoryName").val("");
		}
	});
	
	$("#sequelsList table tr td").click(function(){
		layer.msg($(this).index());
	});
});

/**
 * 打开编辑影片剧集Dialog
 */
var openSequelsDialog = function(title,filmId){
	
	$("#filmId").val(filmId);
	$("#sequelsList table tbody").empty();
	//获取当前影片的剧集并回显到Dialog上
	$.ajax({
		type: "post",
		url: siteUrl + "admin/filmSequels/getList.htm",
		data:{
			filmId: filmId
		},dataType: "json",
		success: function(res){
			if(res.success){
				if(res.obj != null){
					//拼接字符串并显示到页面上
					displaySequels(res.obj);
				}
			}
		}
	});
	
	//页面层
	layer.open({
		type: 1,
		title: title + "剧集列表编辑",
		skin: 'layui-layer-rim', //加上边框
		area: ['1200px', '700px'], //宽高
		content: $('#sequelsDialog'),
		btn: ['确认'],
		yes: function(){
			layer.closeAll();
		}
	});
	$("#sequelsDialog").removeClass("hide");
	
};

var displaySequels = function(sequels){
	var tempHtml = "";
	if(sequels != null && sequels.length > 0){
		for(var i=0;i<sequels.length;i++){
			sequelsLineMaxId++;
			tempHtml += "<tr><td colspan='4'><div class='row'>";
			tempHtml += "<form id='sequelsForm" + sequelsLineMaxId + "'><div class='col-sm-12 col-md-3'>";
			tempHtml += "<input type='text' class='form-control' value='" + sequels[i].name + "' name='name' /></div>";
			tempHtml += "<div class='col-sm-12 col-md-3'>";
			tempHtml += "<input type='text' class='form-control' value='" + sequels[i].wangpan + "' name='wangpan' /></div>";
			tempHtml += "<div class='col-sm-12 col-md-3'>";
			tempHtml += "<input type='text' class='form-control' value='" + sequels[i].xunlei + "' name='xunlei' /></div>";
			tempHtml += "<div class='col-sm-12 col-md-3'>";
			tempHtml += "<a href='javascript: void(0)' class='btn-outline btn-outline-success' onclick='editSequels(" + sequelsLineMaxId + "," + sequels[i].id + ")'>保存修改</a> ";
			tempHtml += "<a href='javascript: void(0)' class='btn-outline btn-outline-danger' onclick='removeSequels(" + sequelsLineMaxId + "," + sequels[i].id + ")'>删除剧集</a>";
			tempHtml += "</div></form></div></td></tr>";
		}
		$("#sequelsList table tbody").append(tempHtml);
	}
	
};

var addSequelsTr = function(sequelsObj){
	if(sequelsObj != null){
		sequelsLineMaxId++;
		var tempHtml = "";
		tempHtml += "<tr><td colspan='4'><div class='row'>";
		tempHtml += "<form id='sequelsForm" + sequelsLineMaxId + "'><div class='col-sm-12 col-md-3'>";
		tempHtml += "<input type='text' class='form-control' value='" + sequelsObj.name + "' name='name' /></div>";
		tempHtml += "<div class='col-sm-12 col-md-3'>";
		tempHtml += "<input type='text' class='form-control' value='" + sequelsObj.wangpan + "' name='wangpan' /></div>";
		tempHtml += "<div class='col-sm-12 col-md-3'>";
		tempHtml += "<input type='text' class='form-control' value='" + sequelsObj.xunlei + "' name='xunlei' /></div>";
		tempHtml += "<div class='col-sm-12 col-md-3'>";
		tempHtml += "<a href='javascript: void(0)' class='btn-outline btn-outline-success' onclick='editSequels(" + sequelsLineMaxId + "," + sequelsObj.id + ")'>保存修改</a> ";
		tempHtml += "<a href='javascript: void(0)' class='btn-outline btn-outline-danger' onclick='removeSequels(" + sequelsLineMaxId + "," + sequelsObj.id + ")'>删除剧集</a>";
		tempHtml += "</div></form></div></td></tr>";
		$("#sequelsList table tbody").append(tempHtml);
	}
};


/**
 * 添加剧集
 */
var addSequels = function(){
	var sequelsForm = $("#sequelsForm").serializeJson();
	if(sequelsForm.name == null || sequelsForm.name.trim() == ""){
		layer.msg("请输入剧集名称！！！");
		return;
	}
	if(sequelsForm.wangpan == null || sequelsForm.wangpan.trim() == ""){
		sequelsForm.wangpan = "#";
	}
	if(sequelsForm.xunlei == null || sequelsForm.xunlei.trim() == ""){
		sequelsForm.xunlei = "#";
	}
	$.ajax({
		type: "post",
		url: siteUrl + "admin/filmSequels/addFilmSequels.htm",
		data:sequelsForm,
		dataType: "json",
		success: function(res){
			if(res.success){
				layer.msg(res.msg);
				//将当前剧集数据显示到dialog页面上
				//改造service增加方法，返回当前添加剧集的ID主键值，并在controller中用json的obj返回，此处构造为了方便删除操作
				sequelsForm.id = res.obj;
				addSequelsTr(sequelsForm);
				//将当前表单数据清空
				$("#sequelsForm input[name='name']").val("");
				$("#sequelsForm input[name='wangpan']").val("#");
				$("#sequelsForm input[name='xunlei']").val("#");
			}
		}
	});
};

var editSequels = function(editFormId,id){
	var formId = "#sequelsForm" + editFormId + "";
	var sequelsForm = $(formId).serializeJson();
	console.info(sequelsForm);
	sequelsForm.id = id;
	if(sequelsForm.name == null || sequelsForm.name.trim() == ""){
		layer.msg("请输入剧集名称！！！");
		return;
	}
	$.ajax({
		type: "post",
		url: siteUrl + "admin/filmSequels/editFilmSequels.htm",
		data:sequelsForm,
		dataType: "json",
		success: function(res){
			if(res.success){
				layer.msg(res.msg);
			}
		}
	});
};

var removeSequels = function(editFormId,id){	
	if(id == null || parseInt(id) < 0){
		layer.msg("请选择需要删除的剧集！！！");
		return;
	}

	layer.confirm('确定删除影片剧集？', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/filmSequels/removeFilmSequels.htm",
			data:{id: id},
			dataType: "json",
			success: function(res){
				if(res.success){
					layer.msg(res.msg);
					//在页面上删除当前列
					var formId = "#sequelsForm" + editFormId + "";
					$(formId).parent().remove();
				}
			}
		});
	}, function(){
		layer.close();
	});
};

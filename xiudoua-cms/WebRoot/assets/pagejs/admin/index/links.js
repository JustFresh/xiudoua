/**
 * @description：系统友情链接管理JS文件
 * @author：JustFresh
 * @time：2017-07-29 15:27
 */
var linksForm = {};
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
							window.location.href = siteUrl + "admin/index.htm?mod=index&act=links";
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
		if(linksForm.id != null && linksForm.id != "" && parseInt(linksForm.id) > 0){
			//编辑链接信息
			url = siteUrl + "admin/links/editLinks.htm";
		}else{
			//添加链接信息
			url = siteUrl + "admin/links/addLinks.htm";
		}
		$.ajax({
			url: url,
			type: "post",
			data: linksForm,
			dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=index&act=links";
					},2000);
				}
			}
		});
	}
};

var checkForm = function(){
	linksForm = $("#linksForm").serializeJson();
	if(linksForm == undefined || linksForm == null){
		layer.msg("表单都木有提交什么！！！");
		return false;
	}
	if(linksForm.name == null || linksForm.name.trim() == ""){
		layer.msg("链接名称你最起码得输入一个吧！！！");
		return false;
	}
	if(linksForm.logo == null || linksForm.logo.trim() == ""){
		layer.msg("链接LOGO你上传一张呗！！！");
		return false;
	}
	return true;
};

var removeFn = function(id){
	if(id == null || parseInt(id) <= 0){
		layer.msg("请选择需要删除的友情链接！！！");
		return;
	}
	layer.confirm('确定删除友情链接', {
		btn: ['确定','再想想'] //按钮
	}, function(){
		$.ajax({
			type: "post",
			url: siteUrl + "admin/links/removeLinks.htm",
			data: {id: id},dataType: "json",
			success: function(res){
				layer.msg(res.msg);
				if(res.success){
					setTimeout(function(){
						window.location.href = siteUrl + "admin/index.htm?mod=index&act=links";
					},2000);
				}
			}
		});
	}, function(){
		layer.close();
	});
};
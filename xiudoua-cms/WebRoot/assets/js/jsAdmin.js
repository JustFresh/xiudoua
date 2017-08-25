/**
 * @desc: 管理员后台公用JS文件
 * @time: 2017-06-24 15:47
 * @autohor: JustFresh
 * @version: v1.0.0
 */

/**
 * @desc: 获取系统后台管理菜单列表数据存储到全局变量
 * @time: 2017-07:02 13:17
 */
com.xiudoua.getAdminMenuList = function(){
	var adminMenuList = {};
	//获取当前管理系统后台菜单
	$.ajax({
		type: "post",
		async: false,
		url: siteUrl + "/assets/json/admin-menu.json",
		data:{},
		dataType: "json",
		success: function(res){
			if(res.success){
				adminMenuList =  res.list;
			}
		}
	});
	return adminMenuList;
};

/**
 * @desc: 获取当前URL链接地址？号后面参数并处理成对象存储
 * @time: 2017-07:02 13:33
 */
com.xiudoua.getUrlParamsObj = function(){
	var urlParams = {};
	var urlStr = window.location.search;
	var urlStr = urlStr.substring(urlStr.indexOf("?")+1,urlStr.length).split("&");
	for(var i in urlStr)
    {
        keyvalue = urlStr[i].split("=");
        key = keyvalue[0];
        value = keyvalue[1];
        urlParams[key] = value;            
    }
    return urlParams;
};

/**
 * @desc: 动态循环输出顶部模块导航到header.jsp——>Jquery操作生成dom
 * @time: 2017-07:02 13:18
 */
com.xiudoua.showModuleList = function(){
	var urlParams = com.xiudoua.getUrlParamsObj();
	//动态赋予系统名称
	$("#header > .site-name").text(siteAdmin);
	var modeleLiStr = "";
	if(window.adminMenuList != null && window.adminMenuList != []){
		for(var i=0;i<window.adminMenuList.length;i++){
			if(urlParams != null && urlParams != {} && urlParams.mod == window.adminMenuList[i].mod){
				modeleLiStr += "<li><a class='selected' ";
				com.xiudoua.showLeftNavList(window.adminMenuList[i].children);
			}else{
				modeleLiStr += "<li><a ";
			}
			modeleLiStr += "href='" + siteUrl +  window.adminMenuList[i].linkUrl + "'>" + window.adminMenuList[i].title + "</a></li>";
			modeleLiStr += "<li class='split-line'></li>";
		}
		$("#header > ul.module-list").append(modeleLiStr);
	}
};

/**
 * @desc: 动态循环输出左侧导航菜单到left_nav.jsp——>Jquery操作生成dom
 * @time: 2017-07:02 13:18
 */
com.xiudoua.showLeftNavList = function(leftNavList){
	var urlParams = com.xiudoua.getUrlParamsObj();
	var leftNavLiStr = "";
	if(leftNavList != null && leftNavList != []){
		for(var i=0;i<leftNavList.length;i++){
			if(urlParams != null && urlParams != {} && urlParams.act == leftNavList[i].act){
				leftNavLiStr += "<li class='selected'>";
			}else{
				leftNavLiStr += "<li>";
			}
			leftNavLiStr += "<a href='" + siteUrl + leftNavList[i].linkUrl + "'><i class='" + leftNavList[i].icon + "'></i>";
			leftNavLiStr += " <span class='hidden-small'>" + leftNavList[i].title + "</span></a></li>";
		}
		$("#leftNav > ul").append(leftNavLiStr);
	}
};

$(function(){
	
	window.adminMenuList = com.xiudoua.getAdminMenuList();
	com.xiudoua.showModuleList();
	
});

//公用方法
/* =========================================彭建红添加部分开始============================================== */
(function($){  
    $.fn.serializeJson=function(){  
        var serializeObj={};  
        var array=this.serializeArray();  
        var str=this.serialize();  
        $(array).each(function(){  
            if(serializeObj[this.name]){  
                if($.isArray(serializeObj[this.name])){  
                    serializeObj[this.name].push(this.value);  
                }else{  
                    serializeObj[this.name]=[serializeObj[this.name],this.value];  
                }  
            }else{  
                serializeObj[this.name]=this.value;   
            }  
        });  
        return serializeObj;  
    };  
})(jQuery);

/**
 * 缩略图上传
 */
var uploadImg = function(fileId,thumbId,optId,dirPath){
	
	$.ajaxFileUpload
    (
        {
        	type: "POST",
            url: '/xiudoua-cms/upload/uploadImg.htm?dirPath=' + dirPath, //用于文件上传的服务器端请求地址
            secureuri: false,
            fileElementId: optId, 
            dataType: 'json', //返回值类型 一般设置为json
            success: function (res, status)  //服务器成功响应处理函数
            {
            	if(res.success){
            		
            		layer.msg("缩略图" + res.obj.fileName + "上传成功");
            		$(fileId).val(res.obj.filePath);
            		$(thumbId).attr("src",'/xiudoua-cms/' + res.obj.filePath);

            	}else{
            		layer.msg(res.msg);
            	}
            },error: function (data, status, e)//服务器响应失败处理函数
            {
            	layer.msg("上传失败，请检查网络后重试");
            }
        }
    );

};
/* =========================================彭建红添加部分结束============================================== */
package com.justfresh.xiudoua.service;

import java.util.List;

import com.justfresh.xiudoua.model.JfCmsFilmCategory;

public interface ICmsFilmCategoryService extends IBaseService<JfCmsFilmCategory> {

	int batchRemove(JfCmsFilmCategory param,String ids) throws Exception;
	
	int changeStatus(JfCmsFilmCategory param) throws Exception;
	
	//获取用于前端页面显示的顶部导航列表
	List<JfCmsFilmCategory> getFilmCategoryNavList();
	
}

package com.justfresh.xiudoua.service;

import java.util.List;

import com.justfresh.xiudoua.model.JfCmsFilm;

public interface ICmsFilmService extends IBaseService<JfCmsFilm> {

	int batchRemove(JfCmsFilm param,String ids) throws Exception;
	
	int changeStatus(JfCmsFilm param) throws Exception;
	
	int add(JfCmsFilm param,List<String> images) throws Exception;
	
	int update(JfCmsFilm param,List<String> images) throws Exception;
	
}

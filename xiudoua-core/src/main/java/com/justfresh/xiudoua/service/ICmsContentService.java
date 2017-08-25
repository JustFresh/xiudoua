package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfCmsContent;
import com.justfresh.xiudoua.model.JfCmsContentExt;

public interface ICmsContentService extends IBaseService<JfCmsContent> {

	int batchRemove(JfCmsContent param,String ids) throws Exception;
	
	int changeStatus(JfCmsContent param) throws Exception;
	
	int isRecommend(JfCmsContent param) throws Exception;
	
	int isTop(JfCmsContent param) throws Exception;
	
	int add(JfCmsContent param,JfCmsContentExt ext) throws Exception;
	
	int update(JfCmsContent param,JfCmsContentExt ext) throws Exception;
	
	JfCmsContent getHomeOne(JfCmsContent param) throws Exception; 
}

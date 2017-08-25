package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfCmsAds;

public interface ICmsAdsService extends IBaseService<JfCmsAds> {

	int batchRemove(JfCmsAds param,String ids) throws Exception;
	
	int changeStatus(JfCmsAds param) throws Exception;
	
}

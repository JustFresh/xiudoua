package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfCmsAdsPlace;

public interface ICmsAdsPlaceService extends IBaseService<JfCmsAdsPlace> {

	int batchRemove(JfCmsAdsPlace param,String ids) throws Exception;
	
	int changeStatus(JfCmsAdsPlace param) throws Exception;
	
}

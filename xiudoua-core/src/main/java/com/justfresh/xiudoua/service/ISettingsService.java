package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.entity.SiteConfig;
import com.justfresh.xiudoua.model.JfSettings;

public interface ISettingsService extends IBaseService<JfSettings> {

	int editSettings(SiteConfig config) throws Exception;
	
}

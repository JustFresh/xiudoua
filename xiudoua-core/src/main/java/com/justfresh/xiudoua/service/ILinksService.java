package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfLinks;

public interface ILinksService extends IBaseService<JfLinks> {

	int batchRemove(JfLinks param,String ids) throws Exception;
	
}

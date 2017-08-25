package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfNotices;

public interface INoticesService extends IBaseService<JfNotices> {

	int batchRemove(JfNotices param,String ids) throws Exception;
	
}

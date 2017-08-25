package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfUser;

public interface IUserService extends IBaseService<JfUser> {

	int batchRemove(JfUser param,String ids) throws Exception;
	
	int changeStatus(JfUser param) throws Exception;
	
}

package com.justfresh.xiudoua.service;

import com.justfresh.xiudoua.model.JfAdmin;

public interface IAdminService extends IBaseService<JfAdmin>{
	
	public JfAdmin login(JfAdmin param) throws Exception;
	
	public boolean checkLoginName(String loginName);
	
	public JfAdmin updatePwd(JfAdmin param) throws Exception;
	
}

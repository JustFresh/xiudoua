package com.justfresh.cms.xiudoua.utils;

import javax.servlet.http.HttpServletRequest;

public class Config {
	
	public static String urlConfig(HttpServletRequest request,String module,String method,String params){
		
		String url = "";
		url += request.getScheme()+"://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
		url += module + "/";
		url += method + "?";
		url += params;
		return url;
		
	}

}

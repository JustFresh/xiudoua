package com.justfresh.xiudoua.service;

import java.util.List;

import com.justfresh.xiudoua.model.JfCmsChannel;

public interface ICmsChannelService extends IBaseService<JfCmsChannel> {

	int batchRemove(JfCmsChannel param,String ids) throws Exception;
	
	int changeStatus(JfCmsChannel param) throws Exception;
	
	//获取用于前端页面显示的顶部导航列表
	List<JfCmsChannel> getChannelList();
	
}

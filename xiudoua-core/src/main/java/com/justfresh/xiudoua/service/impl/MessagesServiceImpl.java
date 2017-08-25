package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfMessagesMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfMessages;
import com.justfresh.xiudoua.model.JfMessagesExample;
import com.justfresh.xiudoua.service.IMessagesService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("messagesService")
public class MessagesServiceImpl implements IMessagesService {
	
	@Autowired
	private JfMessagesMapper messagesMapper;
	
	private JfMessagesExample getExample(JfMessages param){
		
		JfMessagesExample example = new JfMessagesExample();
		JfMessagesExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getUserName() != null && !"".equals(param.getUserName())){
			c.andUserNameLike("%" + param.getUserName() + "%");
		}
		if(param.getEmail() != null && !"".equals(param.getEmail())){
			c.andEmailLike("%" + param.getEmail() + "%");
		}
		if(param.getContent() != null && !"".equals(param.getContent())){
			c.andContentLike("%" + param.getContent() + "%");
		}
		return example;
		
	}

	public int add(JfMessages param) throws Exception {
		if(param.getUserName() == null || "".equals(param.getUserName())){
			throw new Exception("请填上您的大名！！！");
		}
		if(param.getEmail() == null || "".equals(param.getEmail())){
			throw new Exception("请天上您的邮箱地址！！！");
		}
		if(param.getContent() == null || "".equals(param.getContent())){
			throw new Exception("请填上您要留言的内容！！！");
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.messagesMapper.selectMaxIdByExample(new JfMessagesExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setAddTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.messagesMapper.insert(param);
	}

	public int delete(JfMessages param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.messagesMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfMessages param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.messagesMapper.updateByPrimaryKeySelective(param);
	}

	public JfMessages getOne(JfMessages param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.messagesMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfMessages> getList(JfMessages param) throws Exception {
		return this.messagesMapper.selectByExample(this.getExample(param));
	}

	public Page<JfMessages> page(JfMessages param) throws Exception {
		
		Page<JfMessages> page = new Page<JfMessages>();
		Map<String, String> params = param.getParams();
		JfMessagesExample example = this.getExample(param);
		List<JfMessages> list = new ArrayList<JfMessages>();
		if(params.size()>1){
			list = this.messagesMapper.selectWithPageByExample(example, params);
		}else{
			list = this.messagesMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.messagesMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

}

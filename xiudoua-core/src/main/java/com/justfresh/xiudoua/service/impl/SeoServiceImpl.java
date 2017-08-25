package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfSeoMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfSeo;
import com.justfresh.xiudoua.model.JfSeoExample;
import com.justfresh.xiudoua.service.ISeoService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("seoService")
public class SeoServiceImpl implements ISeoService {
	
	@Autowired
	private JfSeoMapper seoMapper;
	
	private JfSeoExample getExample(JfSeo param){
		
		JfSeoExample example = new JfSeoExample();
		JfSeoExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getTitle() != null && !"".equals(param.getTitle())){
			c.andTitleLike("%" + param.getTitle() + "%");
		}
		if(param.getKeywords() != null && !"".equals(param.getKeywords())){
			c.andKeywordsLike("%" + param.getKeywords() + "%");
		}
		return example;
		
	}

	public int add(JfSeo param) throws Exception {
		if(param.getTitle() == null || "".equals(param.getTitle())){
			throw new Exception("请输入SEO标题！！！");
		}
		if(param.getKeywords() == null || "".equals(param.getKeywords())){
			throw new Exception("请输入SEO关键值！！！");
		}
		if(param.getDescription() == null || "".equals(param.getDescription())){
			throw new Exception("请输入SEO的内容！！！");
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.seoMapper.selectMaxIdByExample(new JfSeoExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		return this.seoMapper.insert(param);
	}

	public int delete(JfSeo param) throws Exception {
		
		return 0;
	}

	public int update(JfSeo param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.seoMapper.updateByPrimaryKeySelective(param);
	}

	public JfSeo getOne(JfSeo param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.seoMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfSeo> getList(JfSeo param) throws Exception {
		return this.seoMapper.selectByExample(this.getExample(param));
	}

	public Page<JfSeo> page(JfSeo param) throws Exception {
		
		Page<JfSeo> page = new Page<JfSeo>();
		Map<String, String> params = param.getParams();
		JfSeoExample example = this.getExample(param);
		List<JfSeo> list = new ArrayList<JfSeo>();
		if(params.size()>1){
			list = this.seoMapper.selectWithPageByExample(example, params);
		}else{
			list = this.seoMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.seoMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

}

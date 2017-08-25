package com.justfresh.xiudoua.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsFilmSequelsMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsFilmSequels;
import com.justfresh.xiudoua.model.JfCmsFilmSequelsExample;
import com.justfresh.xiudoua.service.ICmsFilmSequelsService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsFilmSequelsService")
public class CmsFilmSequelsServiceImpl implements ICmsFilmSequelsService {
	
	@Autowired
	private JfCmsFilmSequelsMapper cmsFilmSequelsMapper;
	
	private JfCmsFilmSequelsExample getExample(JfCmsFilmSequels param){
		
		JfCmsFilmSequelsExample example = new JfCmsFilmSequelsExample();
		JfCmsFilmSequelsExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getFilmId() != null && param.getFilmId() > 0){
			c.andFilmIdEqualTo(param.getFilmId());
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName() + "%");
		}
		if(param.getTitle() != null && !"".equals(param.getTitle())){
			c.andTitleLike("%" + param.getTitle() + "%");
		}
		if(param.getWangpan() != null && !"".equals(param.getWangpan())){
			c.andWangpanEqualTo(param.getWangpan());
		}
		return example;
		
	}

	public int add(JfCmsFilmSequels param) throws Exception {
		
		if(param.getFilmId() == null || param.getFilmId() == 0){
			throw new Exception("请选择需要添加的剧集的影片！！！");
		}
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请填写剧集名称！！！");
		}
		if(param.getReorder() == null || param.getReorder() == 0){
			param.setReorder(1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsFilmSequelsMapper.selectMaxIdByExample(new JfCmsFilmSequelsExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		int count = this.cmsFilmSequelsMapper.insert(param);
		if(count > 0){
			return maxId + 1;
		}
		return 0;
		
	}

	public int delete(JfCmsFilmSequels param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.cmsFilmSequelsMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfCmsFilmSequels param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.cmsFilmSequelsMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsFilmSequels getOne(JfCmsFilmSequels param) throws Exception {
		if(param.getId() == null || param.getId() == 0){ 
			throw new Exception("请选择需要查询的行数据");
		}
		return this.cmsFilmSequelsMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfCmsFilmSequels> getList(JfCmsFilmSequels param) throws Exception {
		return this.cmsFilmSequelsMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsFilmSequels> page(JfCmsFilmSequels param) throws Exception {
		
		return null;
	}

}

package com.justfresh.xiudoua.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsFilmImagesMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsFilmImages;
import com.justfresh.xiudoua.model.JfCmsFilmImagesExample;
import com.justfresh.xiudoua.service.ICmsFilmImagesService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsFilmImagesService")
public class CmsFilmImagesServiceImpl implements ICmsFilmImagesService {
	
	@Autowired
	private JfCmsFilmImagesMapper cmsFilmImagesMapper;
	
	private JfCmsFilmImagesExample getExample(JfCmsFilmImages param){
		
		JfCmsFilmImagesExample example = new JfCmsFilmImagesExample();
		JfCmsFilmImagesExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getIsDefault() != null && param.getIsDefault() != 0 ){
			c.andIsDefaultEqualTo(param.getIsDefault());
		}
		return example;
		
	}

	public int add(JfCmsFilmImages param) throws Exception {
		
		if(param.getFilmId() == null || param.getFilmId() == 0){
			throw new Exception("请选择需要上传的数据再上传相册！！！");
		}
		if(param.getFilmImage() == null || param.getFilmImage().equals("")){
			throw new Exception("请上传缩略图！！！");
		}
		if(param.getReorder() == null || param.getReorder() == 0){
			param.setReorder(1);
		}
		if(param.getIsDefault() == null || param.getIsDefault() == 0){
			param.setReorder(-1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsFilmImagesMapper.selectMaxIdByExample(new JfCmsFilmImagesExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		return this.cmsFilmImagesMapper.insert(param);
		
	}

	public int delete(JfCmsFilmImages param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.cmsFilmImagesMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfCmsFilmImages param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.cmsFilmImagesMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsFilmImages getOne(JfCmsFilmImages param) throws Exception {
		if(param.getId() == null || param.getId() == 0){ 
			throw new Exception("请选择需要查询的行数据");
		}
		return this.cmsFilmImagesMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfCmsFilmImages> getList(JfCmsFilmImages param)throws Exception {
		return this.cmsFilmImagesMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsFilmImages> page(JfCmsFilmImages param) throws Exception {
		return null;
	}

}

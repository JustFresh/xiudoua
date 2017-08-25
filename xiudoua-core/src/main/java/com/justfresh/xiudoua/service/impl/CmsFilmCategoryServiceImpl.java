package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsFilmCategoryMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsFilmCategory;
import com.justfresh.xiudoua.model.JfCmsFilmCategoryExample;
import com.justfresh.xiudoua.service.ICmsFilmCategoryService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsFilmCategoryService")
public class CmsFilmCategoryServiceImpl implements ICmsFilmCategoryService {
	
	@Autowired
	private JfCmsFilmCategoryMapper cmsFilmCategoryMapper;
	
	private JfCmsFilmCategoryExample getExample(JfCmsFilmCategory param){
		
		JfCmsFilmCategoryExample example = new JfCmsFilmCategoryExample();
		JfCmsFilmCategoryExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName() + "%");
		}
		if(param.getStatus() != null && param.getStatus() != 0 && !"".equals(param.getStatus())){
			c.andStatusEqualTo(param.getStatus());
		}
		if(param.getFilmType() != null && param.getFilmType() != 0){
			c.andFilmTypeEqualTo(param.getFilmType());
		}
		return example;
		
	}

	public int add(JfCmsFilmCategory param) throws Exception {
		if(param.getFilmType() == null || param.getFilmType() == 0){
			throw new Exception("请选择类型！！！");
		}
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请输入分类名称");
		}
		if(param.getParentId() == null){
			param.setParentId(0);
			param.setLevel(1);
			param.setFullName(param.getName());
		}else if(param.getParentId() != 0){
			//获取当前栏目的父级栏目
			JfCmsFilmCategory parent = this.cmsFilmCategoryMapper.selectByPrimaryKey(param.getParentId());
			param.setFullName(parent.getFullName() + "/" + param.getName());
			param.setLevel(parent.getLevel() + 1);
		}
		if(param.getStatus() == null || param.getStatus() == 0){
			param.setStatus((byte) -1);
		}
		if(param.getReorder() == null || param.getReorder() == 0){
			param.setReorder(1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsFilmCategoryMapper.selectMaxIdByExample(new JfCmsFilmCategoryExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setCreateTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.cmsFilmCategoryMapper.insert(param);
	}

	public int delete(JfCmsFilmCategory param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.cmsFilmCategoryMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfCmsFilmCategory param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.cmsFilmCategoryMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsFilmCategory getOne(JfCmsFilmCategory param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.cmsFilmCategoryMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfCmsFilmCategory> getList(JfCmsFilmCategory param) throws Exception {
		return this.cmsFilmCategoryMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsFilmCategory> page(JfCmsFilmCategory param) throws Exception {
		
		Page<JfCmsFilmCategory> page = new Page<JfCmsFilmCategory>();
		if(param.getOrder() == null || param.getOrder() == ""){
			param.setOrder("desc");
		}
		if(param.getSort()== null || param.getSort() == ""){
			param.setSort("id");
		}
		if(param.getPage() == 0){
			param.setPage(1);
		}
		if(param.getRows() == 0){
			param.setRows(10);
		}
		Map<String, String> params = param.getParams();
		JfCmsFilmCategoryExample example = this.getExample(param);
		List<JfCmsFilmCategory> list = new ArrayList<JfCmsFilmCategory>();
		if(params.size()>1){
			list = this.cmsFilmCategoryMapper.selectWithPageByExample(example, params);
		}else{
			list = this.cmsFilmCategoryMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.cmsFilmCategoryMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

	public int batchRemove(JfCmsFilmCategory param, String ids) throws Exception {
		
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的数据列表再进行批量删除操作");
		}
		JfCmsFilmCategoryExample example = new JfCmsFilmCategoryExample();
		JfCmsFilmCategoryExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.cmsFilmCategoryMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
		
	}

	public int changeStatus(JfCmsFilmCategory param) throws Exception {
		
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfCmsFilmCategory temp = new JfCmsFilmCategory();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.cmsFilmCategoryMapper.updateByPrimaryKeySelective(temp);
		
	}

	public List<JfCmsFilmCategory> getFilmCategoryNavList(){
		JfCmsFilmCategoryExample example = new JfCmsFilmCategoryExample();
		JfCmsFilmCategoryExample.Criteria c = example.createCriteria();
		c.andStatusEqualTo((byte) 1);
		c.andLevelEqualTo(1);
		example.setOrderByClause("reorder asc");
		//获取一级菜单列表
		List<JfCmsFilmCategory> levelOne = this.cmsFilmCategoryMapper.selectByExample(example);
		if(levelOne != null && levelOne.size() > 0){
			//根据一级菜单查询对应的二级菜单存储到children属性中
			for(int i=0;i<levelOne.size();i++){
				JfCmsFilmCategoryExample levelTowExample = new JfCmsFilmCategoryExample();
				JfCmsFilmCategoryExample.Criteria levelTowC = levelTowExample.createCriteria();
				levelTowC.andStatusEqualTo((byte) 1);
				levelTowC.andLevelEqualTo( 2);
				levelTowC.andParentIdEqualTo(levelOne.get(i).getId());
				List<JfCmsFilmCategory> levelTwo = this.cmsFilmCategoryMapper.selectByExample(levelTowExample);
				levelOne.get(i).setChildren(levelTwo);
			}
			return levelOne;
		}
		return null;
	}

}

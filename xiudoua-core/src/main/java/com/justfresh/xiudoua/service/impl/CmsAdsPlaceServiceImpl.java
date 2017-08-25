package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsAdsPlaceMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsAdsPlace;
import com.justfresh.xiudoua.model.JfCmsAdsPlaceExample;
import com.justfresh.xiudoua.service.ICmsAdsPlaceService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsAdsPlaceService")
public class CmsAdsPlaceServiceImpl implements ICmsAdsPlaceService {
	
	@Autowired
	private JfCmsAdsPlaceMapper cmsAdsPlaceMapper;
	
	private JfCmsAdsPlaceExample getExample(JfCmsAdsPlace param){
		
		JfCmsAdsPlaceExample example = new JfCmsAdsPlaceExample();
		JfCmsAdsPlaceExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName()  + "%");
		}
		if(param.getStatus() != null && !"".equals(param.getStatus().toString())){
			c.andStatusEqualTo(param.getStatus());
		}
		return example;
		
	}

	public int add(JfCmsAdsPlace param) throws Exception {
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请输入广告位名称！！！");
		}
		if(param.getWidth() == null){
			param.setWidth(0);
		}
		if(param.getHeight() == null){
			param.setHeight(0);
		}
		if(param.getStatus() == null){
			param.setStatus((byte) 0);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsAdsPlaceMapper.selectMaxIdByExample(new JfCmsAdsPlaceExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		return this.cmsAdsPlaceMapper.insert(param);
	}

	public int delete(JfCmsAdsPlace param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.cmsAdsPlaceMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfCmsAdsPlace param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.cmsAdsPlaceMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsAdsPlace getOne(JfCmsAdsPlace param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.cmsAdsPlaceMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfCmsAdsPlace> getList(JfCmsAdsPlace param) throws Exception {
		return this.cmsAdsPlaceMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsAdsPlace> page(JfCmsAdsPlace param) throws Exception {
		Page<JfCmsAdsPlace> page = new Page<JfCmsAdsPlace>();
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
		JfCmsAdsPlaceExample example = this.getExample(param);
		List<JfCmsAdsPlace> list = new ArrayList<JfCmsAdsPlace>();
		if(params.size()>1){
			list = this.cmsAdsPlaceMapper.selectWithPageByExample(example, params);
		}else{
			list = this.cmsAdsPlaceMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.cmsAdsPlaceMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	public int batchRemove(JfCmsAdsPlace param, String ids) throws Exception {
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的广告位列表再进行批量删除操作");
		}
		JfCmsAdsPlaceExample example = new JfCmsAdsPlaceExample();
		JfCmsAdsPlaceExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.cmsAdsPlaceMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
	}

	public int changeStatus(JfCmsAdsPlace param) throws Exception {
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfCmsAdsPlace temp = new JfCmsAdsPlace();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.cmsAdsPlaceMapper.updateByPrimaryKeySelective(temp);
	}

}

package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsAdsMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsAds;
import com.justfresh.xiudoua.model.JfCmsAdsExample;
import com.justfresh.xiudoua.service.ICmsAdsService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsAdsService")
public class CmsAdsServiceImpl implements ICmsAdsService {
	
	@Autowired
	private JfCmsAdsMapper cmsAdsMapper;
	
	private JfCmsAdsExample getExample(JfCmsAds param){
		
		JfCmsAdsExample example = new JfCmsAdsExample();
		JfCmsAdsExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getSpaceId() != null && param.getSpaceId() != 0){
			c.andSpaceIdEqualTo(param.getSpaceId());
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName() + "%");
		}
		if(param.getTitle() != null && !"".equals(param.getTitle())){
			c.andTitleLike("%" + param.getTitle() + "%");
		}
		if(param.getStatus() != null && !"-1".equals(param.getStatus().toString())){
			c.andStatusEqualTo(param.getStatus());
		}
		return example;
		
	}

	public int add(JfCmsAds param) throws Exception {
		if(param.getSpaceId() == null || "".equals(param.getSpaceId())){
			throw new Exception("请选择广告位");
		}
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请输入广告名称");
		}
		if(param.getTitle() == null || "".equals(param.getTitle())){
			throw new Exception("请输入广告标题");
		}
		if(param.getLinkUrl() == null || param.getLinkUrl().equals("")){
			param.setLinkUrl("#");
		}
		if(param.getStatus() == null){
			param.setStatus((byte) 0);
		}
		param.setClickNum(0);
		if(param.getReorder() == null){
			param.setReorder(1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsAdsMapper.selectMaxIdByExample(new JfCmsAdsExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setCreateTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.cmsAdsMapper.insert(param);
		
	}

	public int delete(JfCmsAds param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.cmsAdsMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfCmsAds param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.cmsAdsMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsAds getOne(JfCmsAds param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.cmsAdsMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfCmsAds> getList(JfCmsAds param) throws Exception {
		return this.cmsAdsMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsAds> page(JfCmsAds param) throws Exception {
		
		Page<JfCmsAds> page = new Page<JfCmsAds>();
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
		JfCmsAdsExample example = this.getExample(param);
		List<JfCmsAds> list = new ArrayList<JfCmsAds>();
		if(params.size()>1){
			list = this.cmsAdsMapper.selectWithPageByExample(example, params);
		}else{
			list = this.cmsAdsMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.cmsAdsMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

	public int batchRemove(JfCmsAds param, String ids) throws Exception {
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的数据列表再进行批量删除操作");
		}
		JfCmsAdsExample example = new JfCmsAdsExample();
		JfCmsAdsExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.cmsAdsMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
	}

	public int changeStatus(JfCmsAds param) throws Exception {
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfCmsAds temp = new JfCmsAds();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.cmsAdsMapper.updateByPrimaryKeySelective(temp);
	}

}

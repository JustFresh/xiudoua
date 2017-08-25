package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsChannelMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsChannel;
import com.justfresh.xiudoua.model.JfCmsChannelExample;
import com.justfresh.xiudoua.service.ICmsChannelService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsChannelService")
public class CmsChannelServiceImpl implements ICmsChannelService {
	
	@Autowired
	private JfCmsChannelMapper cmsChannelMapper;
	
	private JfCmsChannelExample getExample(JfCmsChannel param){
		
		JfCmsChannelExample example = new JfCmsChannelExample();
		JfCmsChannelExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName() + "%");
		}
		if(param.getcType() != null && param.getcType() != 0){
			c.andCTypeEqualTo(param.getcType());
		}
		if(param.getIsBlank() != null && !"".equals(param.getIsBlank().toString())){
			c.andIsBlankEqualTo(param.getIsBlank());
		}
		if(param.getStatus() != null && !"".equals(param.getStatus().toString())){
			c.andStatusEqualTo(param.getStatus());
		}
		return example;
		
	}

	public int add(JfCmsChannel param) throws Exception {
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请输入栏目名称");
		}
		if(param.getParentId() == null){
			param.setParentId(0);
			param.setLevel((byte) 1);
			param.setFullName(param.getName());
		}else if(param.getParentId() != 0){
			//获取当前栏目的父级栏目
			JfCmsChannel parent = this.cmsChannelMapper.selectByPrimaryKey(param.getParentId());
			param.setFullName(parent.getFullName() + "/" + param.getName());
			param.setLevel((byte) (parent.getLevel() + 1));
		}
		if(param.getIntroduce() == null || "".equals(param.getIntroduce())){
			param.setIntroduce(param.getFullName());
		}
		if(param.getcType() == null || param.getcType() == 0){
			param.setcType((byte) 1);
		}
		if(param.getIsNav() == null){
			param.setIsNav((byte) 0);
		}
		if(param.getIsBlank() == null){
			param.setIsBlank((byte) 0);
		}
		if(param.getStatus() == null){
			param.setStatus((byte) 0);
		}
		if(param.getReorder() == null){
			param.setReorder(1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsChannelMapper.selectMaxIdByExample(new JfCmsChannelExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setCreateTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.cmsChannelMapper.insert(param);
	}

	public int delete(JfCmsChannel param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.cmsChannelMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfCmsChannel param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.cmsChannelMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsChannel getOne(JfCmsChannel param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.cmsChannelMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfCmsChannel> getList(JfCmsChannel param) throws Exception {
		return this.cmsChannelMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsChannel> page(JfCmsChannel param) throws Exception {
		
		Page<JfCmsChannel> page = new Page<JfCmsChannel>();
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
		JfCmsChannelExample example = this.getExample(param);
		List<JfCmsChannel> list = new ArrayList<JfCmsChannel>();
		if(params.size()>1){
			list = this.cmsChannelMapper.selectWithPageByExample(example, params);
		}else{
			list = this.cmsChannelMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.cmsChannelMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

	public int batchRemove(JfCmsChannel param, String ids) throws Exception {
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的数据列表再进行批量删除操作");
		}
		JfCmsChannelExample example = new JfCmsChannelExample();
		JfCmsChannelExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.cmsChannelMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
	}

	public int changeStatus(JfCmsChannel param) throws Exception {
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfCmsChannel temp = new JfCmsChannel();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.cmsChannelMapper.updateByPrimaryKeySelective(temp);
	}

	//获取用于前端页面显示的顶部导航列表
	public List<JfCmsChannel> getChannelList() {
		JfCmsChannelExample example = new JfCmsChannelExample();
		JfCmsChannelExample.Criteria c = example.createCriteria();
		c.andStatusEqualTo((byte) 1);
		c.andLevelEqualTo((byte) 1);
		example.setOrderByClause("reorder asc");
		//获取一级菜单列表
		List<JfCmsChannel> levelOne = this.cmsChannelMapper.selectByExample(example);
		if(levelOne != null && levelOne.size() > 0){
			//根据一级菜单查询对应的二级菜单存储到children属性中
			for(int i=0;i<levelOne.size();i++){
				JfCmsChannelExample levelTowExample = new JfCmsChannelExample();
				JfCmsChannelExample.Criteria levelTowC = levelTowExample.createCriteria();
				levelTowC.andStatusEqualTo((byte) 1);
				levelTowC.andLevelEqualTo((byte) 2);
				levelTowC.andParentIdEqualTo(levelOne.get(i).getId());
				List<JfCmsChannel> levelTwo = this.cmsChannelMapper.selectByExample(levelTowExample);
				levelOne.get(i).setChildren(levelTwo);
			}
			return levelOne;
		}
		return null;
	}

}

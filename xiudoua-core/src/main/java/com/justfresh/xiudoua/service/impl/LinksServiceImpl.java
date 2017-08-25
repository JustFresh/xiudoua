package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfLinksMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfLinks;
import com.justfresh.xiudoua.model.JfLinksExample;
import com.justfresh.xiudoua.service.ILinksService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("linksService")
public class LinksServiceImpl implements ILinksService {
	
	@Autowired
	private JfLinksMapper linksMapper;
	
	private JfLinksExample getExample(JfLinks param){
		
		JfLinksExample example = new JfLinksExample();
		JfLinksExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName() + "%");
		}
		if(param.getTarget() != null && !"-1".equals(param.getTarget())){
			c.andTargetEqualTo(param.getTarget());
		}
		return example;
		
	}

	public int add(JfLinks param) throws Exception {
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请输入友情链接名称");
		}
		if(param.getUrl() == null || "".equals(param.getUrl())){
			param.setUrl("#");
		}
		if(param.getLogo() == null || "".equals(param.getLogo())){
			throw new Exception("请上传友情链接LOGO");
		}
		if(param.getTarget() == null || "".equals(param.getTarget())){
			param.setTarget("");
		}
		if(param.getReorder() == null || param.getReorder() == 0){
			param.setReorder(1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.linksMapper.selectMaxIdByExample(new JfLinksExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		return this.linksMapper.insert(param);
	}

	public int delete(JfLinks param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.linksMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfLinks param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.linksMapper.updateByPrimaryKeySelective(param);
	}

	public JfLinks getOne(JfLinks param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.linksMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfLinks> getList(JfLinks param) throws Exception {
		return this.linksMapper.selectByExample(this.getExample(param));
	}

	public Page<JfLinks> page(JfLinks param) throws Exception {
		Page<JfLinks> page = new Page<JfLinks>();
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
		JfLinksExample example = this.getExample(param);
		List<JfLinks> list = new ArrayList<JfLinks>();
		if(params.size()>1){
			list = this.linksMapper.selectWithPageByExample(example, params);
		}else{
			list = this.linksMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.linksMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	public int batchRemove(JfLinks param, String ids) throws Exception {
		
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的友情链接列表再进行批量删除操作");
		}
		JfLinksExample example = new JfLinksExample();
		JfLinksExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.linksMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
		
	}

}

package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfAdminRoleMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfAdminRole;
import com.justfresh.xiudoua.model.JfAdminRoleExample;
import com.justfresh.xiudoua.service.IAdminRoleService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("adminRoleService")
public class AdminRoleServiceImpl implements IAdminRoleService {
	
	@Autowired
	private JfAdminRoleMapper adminRoleMapper;
	
	private JfAdminRoleExample getExample(JfAdminRole param){
		
		JfAdminRoleExample example = new JfAdminRoleExample();
		JfAdminRoleExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getRoleName() != null && !"".equals(param.getRoleName())){
			c.andRoleNameLike("%" + param.getRoleName() + "%");
		}
		return example;
		
	}

	public int add(JfAdminRole param) throws Exception {
		if(param.getRoleName() == null || "".equals(param.getRoleName())){
			throw new Exception("请输入管理员角色名称");
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.adminRoleMapper.selectMaxIdByExample(new JfAdminRoleExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		return this.adminRoleMapper.insert(param);
	}

	public int delete(JfAdminRole param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.adminRoleMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfAdminRole param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.adminRoleMapper.updateByPrimaryKeySelective(param);
	}

	public JfAdminRole getOne(JfAdminRole param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.adminRoleMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfAdminRole> getList(JfAdminRole param) throws Exception {
		return this.adminRoleMapper.selectByExample(this.getExample(param));
	}

	public Page<JfAdminRole> page(JfAdminRole param) throws Exception {
		
		Page<JfAdminRole> page = new Page<JfAdminRole>();
		Map<String, String> params = param.getParams();
		JfAdminRoleExample example = this.getExample(param);
		List<JfAdminRole> list = new ArrayList<JfAdminRole>();
		if(params.size()>1){
			list = this.adminRoleMapper.selectWithPageByExample(example, params);
		}else{
			list = this.adminRoleMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.adminRoleMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

}

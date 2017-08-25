package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfAdminMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfAdmin;
import com.justfresh.xiudoua.model.JfAdminExample;
import com.justfresh.xiudoua.service.IAdminService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.MD5Util;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("adminService")
public class AdminServiceImpl implements IAdminService {
	
	@Autowired
	private JfAdminMapper adminMapper;
	
	private JfAdminExample getExample(JfAdmin param){
		
		JfAdminExample example = new JfAdminExample();
		JfAdminExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getLoginName() != null && !"".equals(param.getLoginName())){
			c.andLoginNameLike("%" + param.getLoginName() + "%");
		}
		if(param.getRealname() != null && !"".equals(param.getRealname())){
			c.andRealnameLike("%" + param.getRealname() + "%");
		}
		return example;
		
	}
	
	public int add(JfAdmin param) throws Exception {
		if(param.getLoginName() == null || "".equals(param.getLoginName())){
			throw new Exception("请输入管理员登录名！！！");
		}
		if(param.getPassword() == null || "".equals(param.getPassword())){
			throw new Exception("请输入管理员登录密码！！！");
		}else{
			param.setPassword(MD5Util.string2MD5(param.getPassword()));
		}
		if(param.getRealname() == null || param.getRealname().equals("")){
			param.setRealname(param.getLoginName());
		}
		param.setIsSuper((byte) 0);
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.adminMapper.selectMaxIdByExample(new JfAdminExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setLastLoginTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.adminMapper.insert(param);
	}

	public int delete(JfAdmin param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		if(param.getIsSuper() == 1){
			return 0;
		}
		return this.adminMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfAdmin param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.adminMapper.updateByPrimaryKeySelective(param);
	}

	public JfAdmin getOne(JfAdmin param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.adminMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfAdmin> getList(JfAdmin param) throws Exception {
		return this.adminMapper.selectByExample(this.getExample(param));
	}

	public Page<JfAdmin> page(JfAdmin param) throws Exception {
		Page<JfAdmin> page = new Page<JfAdmin>();
		Map<String, String> params = param.getParams();
		JfAdminExample example = this.getExample(param);
		List<JfAdmin> list = new ArrayList<JfAdmin>();
		if(params.size()>1){
			list = this.adminMapper.selectWithPageByExample(example, params);
		}else{
			list = this.adminMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.adminMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	public JfAdmin login(JfAdmin param) throws Exception {
		if(param.getLoginName() == null || "".equals(param.getLoginName())){
			throw new Exception("请输入管理员登录名！！！");
		}
		if(param.getPassword() == null || "".equals(param.getParams())){
			throw new Exception("请输入管理员登录密码！！！");
		}
		JfAdminExample example = new JfAdminExample();
		example.createCriteria().andLoginNameEqualTo(param.getLoginName()).andPasswordEqualTo(MD5Util.string2MD5(param.getPassword()));
		List<JfAdmin> adminList = this.adminMapper.selectByExample(example);
		if(adminList != null && adminList.size() > 0){
			return adminList.get(0);
		}
		return null;
	}

	public boolean checkLoginName(String loginName) {
		
		if(loginName != null && !"".equals(loginName)){
			JfAdminExample example = new JfAdminExample();
			example.createCriteria().andLoginNameEqualTo(loginName);
			List<JfAdmin> adminList = this.adminMapper.selectByExample(example);
			if(adminList != null && adminList.size() > 0){
				return true;
			}
		}
		return false;
		
	}

	public JfAdmin updatePwd(JfAdmin param) throws Exception {
		
		if(param.getId() != null && param.getId() != 0 && param.getPassword() != null && !"".equals(param.getPassword())){
			JfAdmin adminModel = new JfAdmin();
			adminModel.setId(param.getId());
			adminModel.setPassword(MD5Util.string2MD5(param.getPassword()));
			int count = this.adminMapper.updateByPrimaryKeySelective(adminModel);
			if(count > 0){
				return this.adminMapper.selectByPrimaryKey(param.getId());
			}
		}
		
		return null;
		
	}

}

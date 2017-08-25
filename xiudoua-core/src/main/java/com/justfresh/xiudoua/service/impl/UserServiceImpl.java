package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfUserMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfUser;
import com.justfresh.xiudoua.model.JfUserExample;
import com.justfresh.xiudoua.service.IUserService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.MD5Util;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private JfUserMapper userMapper;
	
	private JfUserExample getExample(JfUser param){
		
		JfUserExample example = new JfUserExample();
		JfUserExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getNickName() != null && !"".equals(param.getNickName())){
			c.andNickNameLike("%" + param.getNickName() + "%");
		}
		if(param.getPhone() != null && !"".equals(param.getPhone())){
			c.andPhoneLike("%" + param.getPhone() + "%");
		}
		if(param.getEmail() != null && !"".equals(param.getEmail())){
			c.andEmailLike("%" + param.getEmail() + "%");
		}
		if(param.getIsCheckPhone() != null && param.getIsCheckPhone() != 0){
			c.andIsCheckPhoneEqualTo(param.getIsCheckPhone());
		}
		if(param.getIsCheckEmail() != null && param.getIsCheckEmail() != 0){
			c.andIsCheckEmailEqualTo(param.getIsCheckEmail());
		}
		
		return example;
		
	}

	public int add(JfUser param) throws Exception {
		if(param.getUserName() == null || param.getUserName().equals("")){
			throw new Exception("请输入用户登录名！！！");
		}
		if(param.getPassword() == null || "".equals(param.getPassword())){
			throw new Exception("请输入用户密码！！！");
		}else{
			param.setPassword(MD5Util.string2MD5(param.getPassword()));
		}
		if(param.getThumb() == null || "".equals(param.getThumb())){
			throw new Exception("请上传用户头像！！！");
		}
		if(param.getStatus() == null || param.getStatus() == 0){
			throw new Exception("请选择用户状态！！！");
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.userMapper.selectMaxIdByExample(new JfUserExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setRegTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		param.setLastLoginTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.userMapper.insert(param);
	}

	public int delete(JfUser param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.userMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfUser param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.userMapper.updateByPrimaryKeySelective(param);
	}

	public JfUser getOne(JfUser param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.userMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfUser> getList(JfUser param) throws Exception {
		return this.userMapper.selectByExample(this.getExample(param));
	}

	public Page<JfUser> page(JfUser param) throws Exception {
		Page<JfUser> page = new Page<JfUser>();
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
		JfUserExample example = this.getExample(param);
		List<JfUser> list = new ArrayList<JfUser>();
		if(params.size()>1){
			list = this.userMapper.selectWithPageByExample(example, params);
		}else{
			list = this.userMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.userMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	public int batchRemove(JfUser param, String ids) throws Exception {
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的系统用户列表再进行批量删除操作");
		}
		JfUserExample example = new JfUserExample();
		JfUserExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.userMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
	}

	public int changeStatus(JfUser param) throws Exception {
		
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfUser temp = new JfUser();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.userMapper.updateByPrimaryKeySelective(temp);
		
	}

}

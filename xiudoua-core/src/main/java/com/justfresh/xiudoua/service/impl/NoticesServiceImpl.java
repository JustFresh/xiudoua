package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfNoticesMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfNotices;
import com.justfresh.xiudoua.model.JfNoticesExample;
import com.justfresh.xiudoua.service.INoticesService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("noticesService")
public class NoticesServiceImpl implements INoticesService{
	
	@Autowired
	private JfNoticesMapper noticesMapper;
	
	private JfNoticesExample getExample(JfNotices param){
		
		JfNoticesExample example = new JfNoticesExample();
		JfNoticesExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getAcceptIds() != null && !"".equals(param.getAcceptIds())){
			c.andAcceptIdsLike("%" + param.getAcceptIds() + "%");
		}
		if(param.getRefuseIds() != null && !"".equals(param.getRefuseIds())){
			c.andRefuseIdsLike("%" + param.getRefuseIds() + "%");
		}
		if(param.getTitle() != null && !"".equals(param.getTitle())){
			c.andTitleLike("%" + param.getTitle() + "%");
		}
		return example;
		
	}

	public int add(JfNotices param) throws Exception {
		if(param.getIsSendToAll() == null || param.getIsSendToAll() == -1){
			//是否发送给所有人，-1代表不是
			param.setIsSendToAll((byte) -1);
			if(param.getAcceptIds() == null || "".equals(param.getAcceptIds())){
				throw new Exception("请选择需要接收通知的用户！！！");
			}
		}
		if(param.getTitle() == null || "".equals(param.getTitle())){
			throw new Exception("请输入通知的标题！！！");
		}
		if(param.getContent() == null || "".equals(param.getContent())){
			throw new Exception("请输入通知的内容！！！");
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.noticesMapper.selectMaxIdByExample(new JfNoticesExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setSendTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		return this.noticesMapper.insert(param);
	}

	public int delete(JfNotices param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		return this.noticesMapper.deleteByPrimaryKey(param.getId());
	}

	public int update(JfNotices param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		return this.noticesMapper.updateByPrimaryKeySelective(param);
	}

	public JfNotices getOne(JfNotices param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		return this.noticesMapper.selectByPrimaryKey(param.getId());
	}

	public List<JfNotices> getList(JfNotices param) throws Exception {
		return this.noticesMapper.selectByExample(this.getExample(param));
	}

	public Page<JfNotices> page(JfNotices param) throws Exception {
		Page<JfNotices> page = new Page<JfNotices>();
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
		JfNoticesExample example = this.getExample(param);
		List<JfNotices> list = new ArrayList<JfNotices>();
		if(params.size()>1){
			list = this.noticesMapper.selectWithPageByExample(example, params);
		}else{
			list = this.noticesMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.noticesMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	public int batchRemove(JfNotices param, String ids) throws Exception {
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的系统通知列表再进行批量删除操作");
		}
		JfNoticesExample example = new JfNoticesExample();
		JfNoticesExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			return this.noticesMapper.deleteByExample(example);
		} catch (Exception e) {
		}
		return 0;
	}

}

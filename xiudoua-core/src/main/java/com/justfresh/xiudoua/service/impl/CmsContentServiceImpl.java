package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsChannelMapper;
import com.justfresh.xiudoua.dao.JfCmsContentExtMapper;
import com.justfresh.xiudoua.dao.JfCmsContentMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsChannel;
import com.justfresh.xiudoua.model.JfCmsContent;
import com.justfresh.xiudoua.model.JfCmsContentExample;
import com.justfresh.xiudoua.model.JfCmsContentExt;
import com.justfresh.xiudoua.model.JfCmsContentExtExample;
import com.justfresh.xiudoua.service.ICmsContentService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsContentService")
public class CmsContentServiceImpl implements ICmsContentService {
	
	@Autowired
	private JfCmsContentMapper cmsContentMapper;
	
	@Autowired
	private JfCmsContentExtMapper cmsContentExtMapper;
	
	@Autowired
	private JfCmsChannelMapper cmsChannelMapper;
	
	private JfCmsContentExample getExample(JfCmsContent param){
		
		JfCmsContentExample example = new JfCmsContentExample();
		JfCmsContentExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getChannelId() != null && param.getChannelId() != 0){
			c.andChannelIdEqualTo(param.getChannelId());
		}
		if(param.getcType() != null && param.getcType() > 0){
			c.andCTypeEqualTo(param.getcType());
		}
		if(param.getTitle() != null && !"".equals(param.getTitle())){
			c.andTitleLike("%" + param.getTitle() + "%");
		}
		if(param.getAuthorName() != null && !"".equals(param.getAuthorName())){
			c.andAuthorNameLike("%" + param.getAuthorName() + "%");
		}
		if(param.getSource() != null && !"".equals(param.getSource())){
			c.andSourceLike("%" + param.getSource() + "%");
		}
		if(param.getStatus() != null && !"".equals(param.getStatus().toString())){
			c.andStatusEqualTo(param.getStatus());
		}
		if(param.getIsRecommend()!= null && !"".equals(param.getIsRecommend().toString())){
			c.andIsRecommendEqualTo(param.getIsRecommend());
		}
		if(param.getIsTop()!= null && !"".equals(param.getIsTop().toString())){
			c.andIsTopEqualTo(param.getIsTop());
		}
		return example;
		
	}

	public int add(JfCmsContent param) throws Exception {
		return 0;
	}
	
	/**
	 * 添加文章
	 */
	public int add(JfCmsContent param, JfCmsContentExt ext) throws Exception {
		if(param.getAuthorId() == null || param.getAuthorId() == 0){
			throw new Exception("请登录后再进行操作！！！");
		}
		if(param.getTitle() == null || "".equals(param.getTitle())){
			throw new Exception("请输入文章标题！！！");
		}
		if(param.getChannelId() == null || "".equals(param.getChannelId())){
			throw new Exception("请选择栏目！！！");
		}else{
			//查询当前的栏目，并将栏目名、栏目分类写入文章表
			JfCmsChannel channel = this.cmsChannelMapper.selectByPrimaryKey(param.getChannelId());
			param.setChannelName(channel.getName());
			param.setcType(channel.getcType());
		}
		if(param.getThumb() == null || "".equals(param.getThumb())){
			//设置默认图片
			param.setThumb("assets/images/default-content.jpg");
		}
		if(ext.getContent() == null || "".equals(ext.getContent())){
			throw new Exception("请输入文章内容！！！");
		}
		if(ext.getAbstracts() == null || "".equals(ext.getAbstracts())){
			ext.setAbstracts(param.getTitle());
		}
		if(ext.getSeoKeywords() == null || "".equals(ext.getSeoKeywords())){
			ext.setSeoKeywords(param.getTitle());
		}
		if(param.getSource() == null || "".equals(param.getSource())){
			param.setSource("本站原创");
		}
		if(param.getStatus() == null || param.getStatus() == 0){
			param.setStatus((byte) -1);
		}
		if(param.getIsAllowComment() == null || param.getIsAllowComment() == 0){
			param.setIsAllowComment((byte) 1);
		}
		if(param.getIsTop() == null || param.getIsTop() == 0){
			param.setIsTop((byte) -1);
		}
		if(param.getIsRecommend() == null || param.getIsRecommend() == 0){
			param.setIsRecommend((byte) -1);
		}
		//查询当前最大无关ID，并设置新增数据的ID为当前最大ID加1——>用于兼容除MySQL又自动递增之外的其他数据库
		int maxId = 0;
		try {
			maxId = this.cmsContentMapper.selectMaxIdByExample(new JfCmsContentExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setCreateTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		param.setClickNum(0);
		param.setLikeNum(0);
		int count = this.cmsContentMapper.insert(param);
		if(count > 0){
			ext.setContentId(maxId + 1);
			return this.cmsContentExtMapper.insert(ext);
		}
		return 0;
	}

	public int delete(JfCmsContent param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		int count = this.cmsContentExtMapper.deleteByPrimaryKey(param.getId());
		if(count > 0){
			return this.cmsContentMapper.deleteByPrimaryKey(param.getId());
		}
		return 0;
	}

	public int update(JfCmsContent param) throws Exception {
		return 0;
	}
	
	public int update(JfCmsContent param, JfCmsContentExt ext) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		int count = this.cmsContentMapper.updateByPrimaryKeySelective(param);
		if(count > 0){
			ext.setContentId(param.getId());
			return this.cmsContentExtMapper.updateByPrimaryKeySelective(ext);
		}
		return 0;
	}


	public JfCmsContent getOne(JfCmsContent param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		JfCmsContent res = this.cmsContentMapper.selectByPrimaryKey(param.getId());
		if(res != null && res.getId() != null && res.getId() > 0){
			JfCmsContentExt ext = this.cmsContentExtMapper.selectByPrimaryKey(param.getId());
			res.setExtObj(ext);
			return res;
		}
		return null;
	}
	
	//前端页面显示，处理点击量
	public JfCmsContent getHomeOne(JfCmsContent param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		JfCmsContent res = this.cmsContentMapper.selectByPrimaryKey(param.getId());
		if(res != null && res.getId() != null && res.getId() > 0){
			//处理点击量加1
			JfCmsContent temp = new JfCmsContent();
			temp.setId(param.getId());
			int clickNum = res.getClickNum() + 1;
			temp.setClickNum(clickNum);
			this.cmsContentMapper.updateByPrimaryKeySelective(temp);
			JfCmsContentExt ext = this.cmsContentExtMapper.selectByPrimaryKey(param.getId());
			res.setExtObj(ext);
			res.setClickNum(clickNum);
			return res;
		}
		return null;
	}

	public List<JfCmsContent> getList(JfCmsContent param) throws Exception {
		return this.cmsContentMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsContent> page(JfCmsContent param) throws Exception {
		Page<JfCmsContent> page = new Page<JfCmsContent>();
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
		JfCmsContentExample example = this.getExample(param);
		List<JfCmsContent> list = new ArrayList<JfCmsContent>();
		if(params.size()>1){
			list = this.cmsContentMapper.selectWithPageByExample(example, params);
		}else{
			list = this.cmsContentMapper.selectByExample(example);
		}
		page.setList(list);
		//循环当前列表，并查询扩展表数据存储
		page.setTotalRecord(this.cmsContentMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	public int batchRemove(JfCmsContent param, String ids) throws Exception {
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的数据列表再进行批量删除操作");
		}
		JfCmsContentExtExample extExample = new JfCmsContentExtExample();
		JfCmsContentExtExample.Criteria extC = extExample.createCriteria();
		JfCmsContentExample example = new JfCmsContentExample();
		JfCmsContentExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			extC.andContentIdIn(idList);
			c.andIdIn(idList);
			//批量删除扩展表数据
			int count = this.cmsContentExtMapper.deleteByExample(extExample);
			if(count > 0){
				//批量删除主表数据
				return this.cmsContentMapper.deleteByExample(example);
			}
		} catch (Exception e) {
		}
		return 0;
	}

	public int changeStatus(JfCmsContent param) throws Exception {
		
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfCmsContent temp = new JfCmsContent();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.cmsContentMapper.updateByPrimaryKeySelective(temp);
		
	}

	public int isRecommend(JfCmsContent param) throws Exception {
		if(param.getId() == null){
			throw new Exception("请选择需要处理的数据");
		}
		JfCmsContent temp = new JfCmsContent();
		temp.setId(param.getId());
		temp.setIsRecommend(param.getIsRecommend());
		return this.cmsContentMapper.updateByPrimaryKeySelective(temp);
	}

	public int isTop(JfCmsContent param) throws Exception {
		
		if(param.getId() == null){
			throw new Exception("请选择需要处理的数据");
		}
		JfCmsContent temp = new JfCmsContent();
		temp.setId(param.getId());
		temp.setIsTop(param.getIsTop());
		return this.cmsContentMapper.updateByPrimaryKeySelective(temp);
		
	}

}

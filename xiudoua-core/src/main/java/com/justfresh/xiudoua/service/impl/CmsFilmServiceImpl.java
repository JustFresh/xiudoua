package com.justfresh.xiudoua.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfCmsFilmImagesMapper;
import com.justfresh.xiudoua.dao.JfCmsFilmMapper;
import com.justfresh.xiudoua.dao.JfCmsFilmSequelsMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsFilm;
import com.justfresh.xiudoua.model.JfCmsFilmExample;
import com.justfresh.xiudoua.model.JfCmsFilmImages;
import com.justfresh.xiudoua.model.JfCmsFilmImagesExample;
import com.justfresh.xiudoua.model.JfCmsFilmSequels;
import com.justfresh.xiudoua.model.JfCmsFilmSequelsExample;
import com.justfresh.xiudoua.service.ICmsFilmService;
import com.justfresh.xiudoua.utils.DateStampUtil;
import com.justfresh.xiudoua.utils.DateUtil;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("cmsFilmService")
public class CmsFilmServiceImpl implements ICmsFilmService {
	
	@Autowired
	private JfCmsFilmMapper cmsFilmMapper;
	
	@Autowired
	private JfCmsFilmImagesMapper cmsFilmImagesMapper;
	
	@Autowired
	private JfCmsFilmSequelsMapper cmsFilmSequelsMapper;
	
	private JfCmsFilmExample getExample(JfCmsFilm param){
		
		JfCmsFilmExample example = new JfCmsFilmExample();
		JfCmsFilmExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getCategoryId()!= null && param.getCategoryId() != 0){
			c.andCategoryIdEqualTo(param.getCategoryId());
		}
		if(param.getTitle() != null && !"".equals(param.getTitle())){
			c.andTitleLike("%" + param.getTitle() + "%");
		}
		if(param.getStars() != null && !"".equals(param.getStars())){
			c.andStarsLike("%" + param.getStars() + "%");
		}
		if(param.getCountry() != null && !"".equals(param.getCountry())){
			c.andCountryEqualTo(param.getCountry());
		}
		if(param.getDefinition() != null && !"".equals(param.getDefinition())){
			c.andDefinitionEqualTo(param.getDefinition());
		}
		if(param.getSource() != null && !"".equals(param.getSource())){
			c.andSourceEqualTo(param.getSource());
		}
		
		//豆瓣评分
		
		if(param.getStatus() != null && param.getStatus() != 0 && !"".equals(param.getStatus())){
			c.andStatusEqualTo(param.getStatus());
		}
		return example;
		
	}

	public int add(JfCmsFilm param) throws Exception {

		return 0;
		
	}
	
	/**
	 * 重载添加方法，在添加新影片的同时将影片相册列表添加
	 */
	public int add(JfCmsFilm param, List<String> images) throws Exception {
		
		if(param.getCategoryId() == null || param.getCategoryId() == 0){
			throw new Exception("请选择分类！！！");
		}
		if(param.getThumb() == null || param.getThumb().equals("")){
			throw new Exception("请上传缩略图！！！");
		}
		if(param.getTitle() == null || param.getTitle().equals("")){
			throw new Exception("请填写标题！！！");
		}
		if(param.getStars() == null || param.getStars().equals("")){
			throw new Exception("请填写演员表！！！");
		}
		if(param.getCountry() == null || param.getCountry().equals("")){
			throw new Exception("请填写发行国家！！！");
		}
		if(param.getDefinition() == null || param.getDefinition().equals("")){
			throw new Exception("请选择清晰度！！！");
		}
		if(param.getReleaseTime() == null || param.getReleaseTime().equals("")){
			throw new Exception("请填写上映时间！！！");
		}
		if(param.getSource() == null || param.getSource().equals("")){
			throw new Exception("请填写来源！！！");
		}
		if(param.getAbstracts() == null || "".equals(param.getAbstracts())){
			throw new Exception("请填写简介！！！");
		}
		if(param.getDouban() == null || "".equals(param.getDouban())){
			throw new Exception("请填写豆瓣评分！！！");
		}
		if(param.getContent() == null || "".equals(param.getContent())){
			throw new Exception("请填写详细介绍！！！");
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
			maxId = this.cmsFilmMapper.selectMaxIdByExample(new JfCmsFilmExample());
		} catch (Exception e) {
			maxId = 0;
		}
		param.setId(maxId + 1);
		param.setCreateTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		param.setLastUpdateTime(DateStampUtil.dateToStamp(DateUtil.formatDateTime(new Date())));
		int res =  this.cmsFilmMapper.insert(param);
		//如果添加影片成功，则添加影片的相册列表
		if(res > 0){
			if(images != null && images.size() > 0){
				for(int i=0;i<images.size();i++){
					if(images.get(i) != null && !images.get(i).equals("")){
						JfCmsFilmImages cmsFilmImages = new JfCmsFilmImages();
						cmsFilmImages.setFilmId(maxId + 1);
						cmsFilmImages.setFilmImage(images.get(i));
						res += this.cmsFilmImagesMapper.insert(cmsFilmImages);
					}
				}
			}
		}
		return res;
	}

	public int delete(JfCmsFilm param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要删除的行数据");
		}
		int res = this.cmsFilmMapper.deleteByPrimaryKey(param.getId());
		// 如果影片删除成功，则对影片扩展的图片表及剧集表进行删除
		if(res > 0){
			//删除影片的扩展相册图片列表
			JfCmsFilmImagesExample imgExample = new JfCmsFilmImagesExample();
			imgExample.createCriteria().andFilmIdEqualTo(param.getId());
			this.cmsFilmImagesMapper.deleteByExample(imgExample);
			
			//删除影片的扩展剧集列表
			JfCmsFilmSequelsExample sequelsExample = new JfCmsFilmSequelsExample();
			sequelsExample.createCriteria().andFilmIdEqualTo(param.getId());
			this.cmsFilmSequelsMapper.deleteByExample(sequelsExample);
		}
		return res;
	}

	public int update(JfCmsFilm param) throws Exception {
		return 0;
	}
	
	public int update(JfCmsFilm param, List<String> images) throws Exception {
		
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要修改的行数据");
		}
		int res = this.cmsFilmMapper.updateByPrimaryKeySelective(param);
		if(res > 0){
			//如果影片信息修改成功，则对影片的图片列表进行先删除清空，再添加操作
			//1.清空当前影片的相册
			JfCmsFilmImagesExample imgExample = new JfCmsFilmImagesExample();
			imgExample.createCriteria().andFilmIdEqualTo(param.getId());
			this.cmsFilmImagesMapper.deleteByExample(imgExample);
			//2.添加新的图片列表
			if(images != null && images.size() > 0){
				for(int i=0;i<images.size();i++){
					if(images.get(i) != null && !images.get(i).equals("")){
						JfCmsFilmImages cmsFilmImages = new JfCmsFilmImages();
						cmsFilmImages.setFilmId(param.getId());
						cmsFilmImages.setFilmImage(images.get(i));
						this.cmsFilmImagesMapper.insert(cmsFilmImages);
					}
				}
			}
		}
		return this.cmsFilmMapper.updateByPrimaryKeySelective(param);
	}

	public JfCmsFilm getOne(JfCmsFilm param) throws Exception {
		if(param.getId() == null || param.getId() == 0){
			throw new Exception("请选择需要查询的行数据");
		}
		
		JfCmsFilm res = this.cmsFilmMapper.selectByPrimaryKey(param.getId());
		if(res != null && res.getId() != null && res.getId() > 0){
			//查询影片图片列表存储
			JfCmsFilmImagesExample imgExample = new JfCmsFilmImagesExample();
			imgExample.createCriteria().andFilmIdEqualTo(res.getId());
			List<JfCmsFilmImages> imgList = this.cmsFilmImagesMapper.selectByExample(imgExample);
			res.setImages(imgList);
			//查询影片续集列表——电视剧的话查询列表数据
			JfCmsFilmSequelsExample sequelsExample = new JfCmsFilmSequelsExample();
			sequelsExample.createCriteria().andFilmIdEqualTo(res.getId());
			List<JfCmsFilmSequels> sequelsList = this.cmsFilmSequelsMapper.selectByExample(sequelsExample);
			res.setSequels(sequelsList);
		}
		return res;
	}

	public List<JfCmsFilm> getList(JfCmsFilm param) throws Exception {
		return this.cmsFilmMapper.selectByExample(this.getExample(param));
	}

	public Page<JfCmsFilm> page(JfCmsFilm param) throws Exception {
		
		Page<JfCmsFilm> page = new Page<JfCmsFilm>();
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
		JfCmsFilmExample example = this.getExample(param);
		List<JfCmsFilm> list = new ArrayList<JfCmsFilm>();
		if(params.size()>1){
			list = this.cmsFilmMapper.selectWithPageByExample(example, params);
		}else{
			list = this.cmsFilmMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.cmsFilmMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
		
	}

	public int batchRemove(JfCmsFilm param, String ids) throws Exception {
		
		if(ids == null || "".equals(ids)){
			throw new Exception("请选择需要删除的数据列表再进行批量删除操作");
		}
		JfCmsFilmExample example = new JfCmsFilmExample();
		JfCmsFilmExample.Criteria c = example.createCriteria();
		try {
			String[] arr = ids.split(",");
			List<Integer> idList = new ArrayList<Integer>();
			if(arr != null && arr.length > 0){
				for(int i=0;i<arr.length;i++){
					idList.add(Integer.parseInt(arr[i]));
				}
			}
			c.andIdIn(idList);
			int count = this.cmsFilmMapper.deleteByExample(example);
			if(count > 0){
				//删除影片扩展的图片表数据
				JfCmsFilmImagesExample imgExample = new JfCmsFilmImagesExample();
				imgExample.createCriteria().andFilmIdIn(idList);
				this.cmsFilmImagesMapper.deleteByExample(imgExample);
				JfCmsFilmSequelsExample sequelsExample = new JfCmsFilmSequelsExample();
				sequelsExample.createCriteria().andFilmIdIn(idList);
				this.cmsFilmSequelsMapper.deleteByExample(sequelsExample);
				return count;
			}
			
		} catch (Exception e) {
		}
		return 0;
		
	}

	public int changeStatus(JfCmsFilm param) throws Exception {
		
		if(param.getId() == null){
			throw new Exception("请选择需要修改状态的数据");
		}
		JfCmsFilm temp = new JfCmsFilm();
		temp.setId(param.getId());
		temp.setStatus(param.getStatus());
		return this.cmsFilmMapper.updateByPrimaryKeySelective(temp);

	}

}

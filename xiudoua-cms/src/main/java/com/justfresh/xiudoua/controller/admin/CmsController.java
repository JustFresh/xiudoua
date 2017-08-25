package com.justfresh.xiudoua.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsAds;
import com.justfresh.xiudoua.model.JfCmsAdsPlace;
import com.justfresh.xiudoua.model.JfCmsChannel;
import com.justfresh.xiudoua.model.JfCmsContent;
import com.justfresh.xiudoua.model.JfCmsFilm;
import com.justfresh.xiudoua.model.JfCmsFilmCategory;
import com.justfresh.xiudoua.service.ICmsAdsPlaceService;
import com.justfresh.xiudoua.service.ICmsAdsService;
import com.justfresh.xiudoua.service.ICmsChannelService;
import com.justfresh.xiudoua.service.ICmsContentService;
import com.justfresh.xiudoua.service.ICmsFilmCategoryService;
import com.justfresh.xiudoua.service.ICmsFilmService;

@Controller
@RequestMapping("/admin/cms")
public class CmsController {
	
	@Autowired
	ICmsAdsService cmsAdsService;
	
	@Autowired
	ICmsAdsPlaceService cmsAdsPlaceService;
	
	@Autowired
	ICmsChannelService cmsChannelService;
	
	@Autowired
	ICmsContentService cmsContentService;
	
	@Autowired
	ICmsFilmCategoryService filmCatogoryService;
	
	@Autowired
	ICmsFilmService filmService;
	
	/**
	 * 广告管理
	 */
	@RequestMapping("/ads")
	public String ads(String mod,String act,String opt,String keywordName,JfCmsAds param,HttpServletRequest request,HttpSession session){
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/cms/" + opt + ".htm";
		}
		JfCmsAdsPlace adsPlace = new JfCmsAdsPlace();
		adsPlace.setStatus((byte) 1);
		try {
			List<JfCmsAdsPlace> placeList = this.cmsAdsPlaceService.getList(adsPlace);
			request.setAttribute("placeList", placeList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		//条件查询系统的CMS广告分页数据存储
		try {
			if(keywordName != null && !"".equals(keywordName)){
				param.setName(new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordName", new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfCmsAds> page = this.cmsAdsService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("ads", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/cms/ads";
	}
	
	//跳转到CMS广告添加/编辑页面
	@RequestMapping("/ads_mng")
	public String ads_mng(String mod,String act,String opt,JfCmsAds param,HttpServletRequest request,HttpSession session){
		JfCmsAdsPlace adsPlace = new JfCmsAdsPlace();
		adsPlace.setStatus((byte) 1);
		try {
			List<JfCmsAdsPlace> placeList = this.cmsAdsPlaceService.getList(adsPlace);
			request.setAttribute("placeList", placeList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfCmsAds ads = this.cmsAdsService.getOne(param);
				request.setAttribute("ads", ads);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/cms/ads_mng";
		
	}
	
	//跳转到CMS广告位添加/编辑页面
	@RequestMapping("/ads_places")
	public String ads_places(String mod,String act,String opt,String keywordName,JfCmsAdsPlace param,HttpServletRequest request,HttpSession session){
		//跳转到编辑页面，存储系统用户对象到页面回显
		try {
			if(keywordName != null && !"".equals(keywordName)){
				param.setName(new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordName", new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfCmsAdsPlace> page = this.cmsAdsPlaceService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("adsPlace", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/cms/ads_places";
		
	}
	
	//跳转到CMS广告位添加/编辑页面
	@RequestMapping("/ads_place_mng")
	public String ads_place_mng(String mod,String act,String opt,JfCmsAdsPlace param,HttpServletRequest request,HttpSession session){
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfCmsAdsPlace adsPlace = this.cmsAdsPlaceService.getOne(param);
				request.setAttribute("adsPlace", adsPlace);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/cms/ads_place_mng";
		
	}
	
	/**
	 * 栏目管理
	 */
	@RequestMapping("/channels")
	public String channels(String mod,String act,String opt,JfCmsChannel param,String keywordName,HttpServletRequest request,HttpSession session){
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/cms/" + opt + ".htm";
		}
		//获取父级栏目查询列表
		JfCmsChannel channel = new JfCmsChannel();
		channel.setStatus((byte) 1);
		channel.setLevel((byte) 1);
		try {
			List<JfCmsChannel> channelList = this.cmsChannelService.getList(channel);
			request.setAttribute("channelList", channelList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		//条件查询系统的CMS广告分页数据存储
		try {
			if(keywordName != null && !"".equals(keywordName)){
				param.setName(new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordName", new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfCmsChannel> page = this.cmsChannelService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("channel", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/cms/channels";
	}
	
	//跳转到CMS栏目位添加/编辑页面
	@RequestMapping("/channel_mng")
	public String channel_mng(String mod,String act,String opt,JfCmsChannel param,HttpServletRequest request,HttpSession session){
		//获取父级栏目查询列表
		JfCmsChannel temp = new JfCmsChannel();
		temp.setStatus((byte) 1);
		temp.setLevel((byte) 1);
		try {
			List<JfCmsChannel> channelList = this.cmsChannelService.getList(temp);
			request.setAttribute("channelList", channelList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfCmsChannel channel = this.cmsChannelService.getOne(param);
				request.setAttribute("channel", channel);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/cms/channel_mng";
		
	}
	
	/**
	 * 文章管理
	 */
	@RequestMapping("/contents")
	public String contents(String mod,String act,String opt,JfCmsContent param,String keywordTitle,String keywordAuthorName,String keywordSource,HttpServletRequest request,HttpSession session){
		
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/cms/" + opt + ".htm";
		}
		//获取父级栏目查询列表
		JfCmsChannel channel = new JfCmsChannel();
		channel.setStatus((byte) 1);
		try {
			List<JfCmsChannel> channelList = this.cmsChannelService.getList(channel);
			request.setAttribute("channelList", channelList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		//条件查询系统的CMS广告分页数据存储
		try {
			if(keywordTitle != null && !"".equals(keywordTitle)){
				param.setTitle(new String(keywordTitle.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordTitle", new String(keywordTitle.getBytes("ISO-8859-1"),"UTF-8"));
			}
			if(keywordAuthorName != null && !"".equals(keywordAuthorName)){
				param.setAuthorName(new String(keywordAuthorName.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordAuthorName", new String(keywordAuthorName.getBytes("ISO-8859-1"),"UTF-8"));
			}
			if(keywordSource != null && !"".equals(keywordSource)){
				param.setSource(new String(keywordSource.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordSource", new String(keywordSource.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfCmsContent> page = this.cmsContentService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("channel", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/cms/contents";
		
	}
	
	//跳转到CMS文章添加/编辑页面
	@RequestMapping("/content_mng")
	public String content_mng(String mod,String act,String opt,JfCmsContent param,HttpServletRequest request,HttpSession session){
		//获取所属栏目列表
		JfCmsChannel temp = new JfCmsChannel();
		temp.setStatus((byte) 1);
		try {
			List<JfCmsChannel> channelList = this.cmsChannelService.getList(temp);
			request.setAttribute("channelList", channelList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfCmsContent content = this.cmsContentService.getOne(param);
				request.setAttribute("content", content);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/cms/content_mng";
		
	}
	
	//跳转到影片分类管理
	@RequestMapping("/film_categorys")
	public String film_categorys(String mod,String act,String opt,JfCmsFilmCategory param,String keywordName,HttpServletRequest request,HttpSession session){
		
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/cms/" + opt + ".htm";
		}
		//获取所属栏目列表
		JfCmsFilmCategory temp = new JfCmsFilmCategory();
		temp.setStatus((byte) 1);
		temp.setLevel(1);
		try {
			List<JfCmsFilmCategory> categoryList = this.filmCatogoryService.getList(temp);
			request.setAttribute("categoryList", categoryList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		//条件查询系统的CMS广告分页数据存储
		try {
			if(keywordName != null && !"".equals(keywordName)){
				param.setName(new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordName", new String(keywordName.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfCmsFilmCategory> page = this.filmCatogoryService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("category", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/cms/film_categorys";
		
	}
	
	//跳转到影片分类添加/编辑页面
	@RequestMapping("/film_category_mng")
	public String film_category_mng(String mod,String act,String opt,JfCmsFilmCategory param,HttpServletRequest request,HttpSession session){
		//获取所属栏目列表
		JfCmsFilmCategory temp = new JfCmsFilmCategory();
		temp.setStatus((byte) 1);
		try {
			List<JfCmsFilmCategory> categoryList = this.filmCatogoryService.getList(temp);
			request.setAttribute("categoryList", categoryList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfCmsFilmCategory category = this.filmCatogoryService.getOne(param);
				request.setAttribute("category", category);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/cms/film_category_mng";
		
	}
	
	//跳转到影片管理
	@RequestMapping("/films")
	public String films(String mod,String act,String opt,JfCmsFilm param,String keywordTitle,String keywordStars,
			String keywordCountry,String keywordSource,HttpServletRequest request,HttpSession session){
		
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/cms/" + opt + ".htm";
		}
		//获取所属栏目列表
		JfCmsFilmCategory temp = new JfCmsFilmCategory();
		temp.setStatus((byte) 1);
		temp.setLevel(1);
		try {
			List<JfCmsFilmCategory> categoryList = this.filmCatogoryService.getList(temp);
			request.setAttribute("categoryList", categoryList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		//条件查询系统的CMS广告分页数据存储
		try {
			if(keywordTitle != null && !"".equals(keywordTitle)){
				param.setTitle(new String(keywordTitle.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordTitle", new String(keywordTitle.getBytes("ISO-8859-1"),"UTF-8"));
			}
			if(keywordStars != null && !"".equals(keywordStars)){
				param.setStars(new String(keywordStars.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordStars", new String(keywordStars.getBytes("ISO-8859-1"),"UTF-8"));
			}
			if(keywordCountry != null && !"".equals(keywordCountry)){
				param.setCountry(new String(keywordCountry.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordCountry", new String(keywordCountry.getBytes("ISO-8859-1"),"UTF-8"));
			}
			if(keywordSource != null && !"".equals(keywordSource)){
				param.setSource(new String(keywordSource.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordSource", new String(keywordSource.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfCmsFilm> page = this.filmService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("film", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/cms/films";
		
	}

	//跳转到影片分类添加/编辑页面
	@RequestMapping("/film_mng")
	public String film_mng(String mod,String act,String opt,JfCmsFilm param,HttpServletRequest request,HttpSession session){
		//获取所属栏目列表
		JfCmsFilmCategory temp = new JfCmsFilmCategory();
		temp.setStatus((byte) 1);
		try {
			List<JfCmsFilmCategory> categoryList = this.filmCatogoryService.getList(temp);
			request.setAttribute("categoryList", categoryList);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfCmsFilm film = this.filmService.getOne(param);
				request.setAttribute("film", film);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/cms/film_mng";
		
	}
		
}

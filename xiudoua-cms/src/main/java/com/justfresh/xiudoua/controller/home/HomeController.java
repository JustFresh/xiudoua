package com.justfresh.xiudoua.controller.home;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.model.JfCmsAds;
import com.justfresh.xiudoua.model.JfCmsChannel;
import com.justfresh.xiudoua.model.JfCmsContent;
import com.justfresh.xiudoua.model.JfCmsFilm;
import com.justfresh.xiudoua.model.JfCmsFilmCategory;
import com.justfresh.xiudoua.model.JfLinks;
import com.justfresh.xiudoua.model.JfSettings;
import com.justfresh.xiudoua.service.ICmsAdsService;
import com.justfresh.xiudoua.service.ICmsChannelService;
import com.justfresh.xiudoua.service.ICmsContentService;
import com.justfresh.xiudoua.service.ICmsFilmCategoryService;
import com.justfresh.xiudoua.service.ICmsFilmService;
import com.justfresh.xiudoua.service.ILinksService;
import com.justfresh.xiudoua.service.ISettingsService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	ICmsFilmCategoryService cmsFilmCategoryService;
	
	@Autowired
	ICmsFilmService cmsFilmService;
	
	@Autowired
	ICmsChannelService cmsChannelService;
	
	@Autowired
	ISettingsService setttingsService;
	
	@Autowired
	ICmsAdsService cmsAdsService;
	
	@Autowired
	ICmsContentService cmsContentService;
	
	@Autowired
	ILinksService linksService;

	@RequestMapping("/{url}")
	public String url(@PathVariable String url, HttpServletRequest request,HttpSession session) {
		return "Home/" + url;
	}
	
	/** 顶部导航 */
	@RequestMapping("/header")
	public String header(HttpServletRequest request, HttpServletResponse response,HttpSession session)  throws IOException{
		//获取网站配置信息——后期可改为获取Spring缓存信息
		//获取导航列表
		//1.获取影片分类列表。
		List<JfCmsFilmCategory> filmCategorys = this.cmsFilmCategoryService.getFilmCategoryNavList();
		request.setAttribute("filmCategorys", filmCategorys);
		
		//2.获取CMS分类列表
		List<JfCmsChannel> channels = this.cmsChannelService.getChannelList();
		request.setAttribute("channels", channels);
		
		Map<String,String> map = new HashMap<String, String>();
		List<JfSettings> settingsList;
		try {
			settingsList = this.setttingsService.getList(new JfSettings());
			if(settingsList != null && settingsList.size() > 0){
				for(int i=0;i<settingsList.size();i++){
					map.put(settingsList.get(i).getName(), settingsList.get(i).getValue());
				}
			}
			request.setAttribute("settings", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "Home/header";
	}
	
	/** 首页Home部分 */
	@RequestMapping("/home")
	public String home(HttpServletRequest request, HttpServletResponse response,HttpSession session)  throws IOException{
		//1.获取前十条状态值为1的轮播数据
		JfCmsAds ads = new JfCmsAds();
		ads.setStatus((byte) 1);
		ads.setRows(10);
		ads.setSpaceId(1);//轮播广告
		//2.获取最新的10部电影展示
		//3.获取最新的9部电视剧展示
		//4.获取最新的9部综艺展示
		//5.获取最新的9部动漫展示
		JfCmsFilm film = new JfCmsFilm();
		film.setStatus((byte) 1);
		
		//6.获取最新5条腰带广告数据展示
		
		//7.获取最新10条文字欲（栏目ID为1）展示
		//8.获取最新7条图片说（栏目ID为2）数据展示
		//9.获取最新视频展——开发视频（栏目ID为5）6条展示
		//11.获取最新视频展——搞笑视频（栏目ID为7）6条展示
		JfCmsContent content = new JfCmsContent();
		content.setStatus((byte) 1);
		try {
			//1.轮播广告
			Page<JfCmsAds> adsPage = this.cmsAdsService.page(ads);
			request.setAttribute("adsPage", adsPage);
			//2.最新10部电影
			film.setCategoryId(1);//电影分类
			film.setRows(10);
			Page<JfCmsFilm> filmPage = this.cmsFilmService.page(film);
			request.setAttribute("filmPage", filmPage);
			//3.最新9部电视剧
			film.setCategoryId(2);//电视剧分类
			film.setRows(9);
			Page<JfCmsFilm> tvPage = this.cmsFilmService.page(film);
			request.setAttribute("tvPage", tvPage);
			//4.最新9部综艺
			film.setCategoryId(3);//综艺分类
			Page<JfCmsFilm> varietyPage = this.cmsFilmService.page(film);
			request.setAttribute("varietyPage", varietyPage);
			//5.最新9部动漫
			film.setCategoryId(4);//动漫分类
			Page<JfCmsFilm> comicPage = this.cmsFilmService.page(film);
			request.setAttribute("comicPage", comicPage);
			//6.最新5条腰带广告
			ads.setSpaceId(3);//腰带广告
			ads.setRows(5);
			Page<JfCmsAds> navbarPage = this.cmsAdsService.page(ads);
			request.setAttribute("navbarPage", navbarPage);
			//7.获取最新10条文字欲（栏目ID为1）展示
			content.setRows(10);
			content.setChannelId(1);
			Page<JfCmsContent> fontsPage = this.cmsContentService.page(content);
			request.setAttribute("fontsPage", fontsPage);
			//8.获取最新7条图片说（栏目ID为2）数据展示
			content.setRows(7);
			content.setChannelId(2);
			Page<JfCmsContent> imagesPage = this.cmsContentService.page(content);
			request.setAttribute("imagesPage", imagesPage);
			//9.获取最新视频展——开发视频（栏目ID为5）6条展示
			content.setRows(6);
			content.setChannelId(5);
			Page<JfCmsContent> developVideoPage = this.cmsContentService.page(content);
			request.setAttribute("developVideoPage", developVideoPage);
			//11.获取最新视频展——搞笑视频（栏目ID为7）6条展示
			content.setChannelId(7);
			Page<JfCmsContent> funnyVideoPage = this.cmsContentService.page(content);
			request.setAttribute("funnyVideoPage", funnyVideoPage);
			
			request.setAttribute("activeNavTitle", "首页");
		} catch (Exception e) {
		}
		
		//2.获取CMS分类列表
		List<JfCmsChannel> channels = this.cmsChannelService.getChannelList();
		request.setAttribute("channels", channels);
		return "Home/home";
	}
	
	/** 电影列表页面 */
	@RequestMapping("/filmlist")
	public String filmlist(JfCmsFilm param,JfCmsFilmCategory category,HttpServletRequest request,HttpSession session){
		if(category.getId() != null && category.getId() > 0){
			try {
				JfCmsFilmCategory brandCategory = this.cmsFilmCategoryService.getOne(category);
				request.setAttribute("brandCategory", brandCategory);
				if(brandCategory.getParentId() > 0){
					JfCmsFilmCategory temp = new JfCmsFilmCategory();
					temp.setId(brandCategory.getParentId());
					JfCmsFilmCategory parent = this.cmsFilmCategoryService.getOne(temp);
					request.setAttribute("activeNavTitle", parent.getName());
				}else{
					request.setAttribute("activeNavTitle", brandCategory.getName());
				}
				
				param.setCategoryId(category.getId());
				param.setRows(25);
				Page<JfCmsFilm> filmPage = this.cmsFilmService.page(param);
				request.setAttribute("filmPage", filmPage);
			} catch (Exception e) {
			}
		}
		return "Home/filmlist";
	}
	
	/** 普通文章列表页面  */
	@RequestMapping("/normallist")
	public String normallist(JfCmsContent param,JfCmsChannel channel,HttpServletRequest request,HttpSession session){
		if(channel.getId() != null && channel.getId() > 0){
			try {
				JfCmsChannel brandChannel = this.cmsChannelService.getOne(channel);
				request.setAttribute("brandChannel", brandChannel);
				if(brandChannel.getParentId() > 0){
					JfCmsChannel temp = new JfCmsChannel();
					temp.setId(brandChannel.getParentId());
					JfCmsChannel parent = this.cmsChannelService.getOne(temp);
					request.setAttribute("activeNavTitle", parent.getName());
				}else{
					request.setAttribute("activeNavTitle", brandChannel.getName());
				}
				param.setStatus((byte) 1);
				param.setChannelId(channel.getId());
				//获取分页文章列表
				param.setRows(6);
				Page<JfCmsContent> contentPage = this.cmsContentService.page(param);
				request.setAttribute("contentPage", contentPage);
			} catch (Exception e) {
				
			}
			
		}
		return "Home/normallist";
	}
	
	/** 图片列表页面  */
	@RequestMapping("/imagelist")
	public String imagelist(JfCmsContent param,JfCmsChannel channel,HttpServletRequest request,HttpSession session){
		if(channel.getId() != null && channel.getId() > 0){
			try {
				JfCmsChannel brandChannel = this.cmsChannelService.getOne(channel);
				request.setAttribute("brandChannel", brandChannel);
				if(brandChannel.getParentId() > 0){
					JfCmsChannel temp = new JfCmsChannel();
					temp.setId(brandChannel.getParentId());
					JfCmsChannel parent = this.cmsChannelService.getOne(temp);
					request.setAttribute("activeNavTitle", parent.getName());
				}else{
					request.setAttribute("activeNavTitle", brandChannel.getName());
				}
				param.setStatus((byte) 1);
				param.setChannelId(channel.getId());
				//获取分页文章列表
				param.setRows(16);
				Page<JfCmsContent> contentPage = this.cmsContentService.page(param);
				request.setAttribute("contentPage", contentPage);
				//获取热门访问列表5条
				//获取推荐视频3条
			}catch (Exception e) {
				
			}
			
		}
		return "Home/imagelist";
	}
	
	/** 视频列表页面  */
	@RequestMapping("/videolist")
	public String videolist(JfCmsContent param,JfCmsChannel channel,HttpServletRequest request,HttpSession session){
		if(channel.getId() != null && channel.getId() > 0){
			try {
				JfCmsChannel brandChannel = this.cmsChannelService.getOne(channel);
				request.setAttribute("brandChannel", brandChannel);
				if(brandChannel.getParentId() > 0){
					JfCmsChannel temp = new JfCmsChannel();
					temp.setId(brandChannel.getParentId());
					JfCmsChannel parent = this.cmsChannelService.getOne(temp);
					request.setAttribute("activeNavTitle", parent.getName());
				}else{
					request.setAttribute("activeNavTitle", brandChannel.getName());
				}
				//获取前5条推荐视频作为轮播
				param.setcType((byte) 3);// 代表查询分类为视频
				param.setStatus((byte) 1);
				param.setRows(5);
				param.setIsRecommend((byte) 1);
				Page<JfCmsContent> slider = this.cmsContentService.page(param);
				request.setAttribute("slider", slider);
				//获取按点击排行的前十条视频展示推荐
				param.setRows(10);
				param.setIsRecommend(null);//置空则不以其为查询条件
				param.setSort("clickNum");//已点击量排序，降序排序
				Page<JfCmsContent> recommends = this.cmsContentService.page(param);
				request.setAttribute("recommends",recommends);
				//获取当前栏目的视频列表（24条）——分页展示
				param.setChannelId(channel.getId());
				param.setRows(24);
				Page<JfCmsContent> contentPage = this.cmsContentService.page(param);
				request.setAttribute("contentPage", contentPage);
			}catch (Exception e) {
				
			}
			
		}
		return "Home/videolist";
	}
	
	/** 视频详情页面  */
	@RequestMapping("/media")
	public String media(JfCmsContent param,HttpServletRequest request, HttpServletResponse response,HttpSession session){
		try {
			JfCmsContent media = this.cmsContentService.getHomeOne(param);
			request.setAttribute("media", media);
			request.setAttribute("activeNavTitle","视频展");
		} catch (Exception e) {
		}
		return "Home/media";
	}
	
	/** 文章详情页面  */
	@RequestMapping("/content")
	public String content(JfCmsContent param,HttpServletRequest request, HttpServletResponse response,HttpSession session){
		try {
			JfCmsContent content = this.cmsContentService.getHomeOne(param);
			request.setAttribute("content", content);
			request.setAttribute("activeNavTitle",content.getChannelName());
			//获取上一篇存储
			//获取下一篇存储
		} catch (Exception e) {
		}
		return "Home/content";
	}
	
	/** 影片详情  */
	@RequestMapping("/film")
	public String film(JfCmsFilm param,Integer sequelsId,HttpServletRequest request, HttpServletResponse response,HttpSession session){
		try {
			JfCmsFilm film = this.cmsFilmService.getOne(param);
			request.setAttribute("film", film);
			request.setAttribute("activeNavTitle",film.getCategoryName());
			if(sequelsId != null && sequelsId > 0){
				request.setAttribute("sequelsId", sequelsId);
			}else{
				request.setAttribute("sequelsId", null);
			}
			//获取上一部存储
			//获取下一部存储
		} catch (Exception e) {
		}
		return "Home/film";
	}
	
	/** 底部版权部分  */
	@RequestMapping("/footer")
	public String footer(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		//获取友情链接列表存储
		try {
			List<JfLinks> linksList = this.linksService.getList(new JfLinks());
			request.setAttribute("linksList", linksList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Home/footer";
	}
	
}

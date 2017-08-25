package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/site")
public class SiteController {

	@Autowired
	IAdminService adminService;
	
	/**
	 * 文章分类
	 */
	@RequestMapping("/articleCategorys")
	public String articleCategorys(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/site/articleCategorys";
	}

	/**
	 * 文章管理
	 */
	@RequestMapping("/articles")
	public String articles(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/site/articles";
	}
	
	/**
	 * 会员协议
	 */
	@RequestMapping("/agreement")
	public String agreement(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/site/agreement";
	}
	
	/**
	 * 页面导航
	 */
	@RequestMapping("/pageNavlist")
	public String pageNavlist(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/site/pageNavlist";
	}
	
	/**
	 * 广告位管理
	 */
	@RequestMapping("/adsPlace")
	public String adsPlace(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/site/adsPlace";
	}
	
	/**
	 * 广告管理
	 */
	@RequestMapping("/ads")
	public String ads(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/site/ads";
	}
	
}

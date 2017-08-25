package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/cms")
public class CmsController {
	
	@Autowired
	IAdminService adminService;
	
	/**
	 * CMS管理
	 */
	@RequestMapping("/index")
	public String index(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/cms/index";
	}
	
	/**
	 * 文章管理
	 */
	@RequestMapping("/articles")
	public String articles(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/cms/articles";
	}
	
	/**
	 * 文章分类
	 */
	@RequestMapping("/articleCategorys")
	public String articleCategorys(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/cms/articleCategorys";
	}
	
	/**
	 * 导航管理
	 */
	@RequestMapping("/navlist")
	public String navlist(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/cms/navlist";
	}
	
	/**
	 * 专题管理
	 */
	@RequestMapping("/topics")
	public String topics(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/cms/topics";
	}
	
}

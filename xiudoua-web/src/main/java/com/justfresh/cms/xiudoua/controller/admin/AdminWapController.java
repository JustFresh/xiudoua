package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/wap")
public class AdminWapController {

	@Autowired
	IAdminService adminService;
	
	/**
	 * WAP设置
	 */
	@RequestMapping("/index")
	public String index(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/wap/index";
	}
	
	/**
	 * 广告管理
	 */
	@RequestMapping("/advs")
	public String advs(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/wap/advs";
	}
	
	/**
	 * 评论管理
	 */
	@RequestMapping("/comments")
	public String comments(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/wap/comments";
	}
	
}

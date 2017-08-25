package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/member")
public class MemberController {

	@Autowired
	IAdminService adminService;
	
	/**
	 * 会员管理
	 */
	@RequestMapping("/index")
	public String index(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/member/index";
	}
	
	/**
	 * 会员等级
	 */
	@RequestMapping("/memberLevel")
	public String memberLevel(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/member/memberLevel";
	}
	
	/**
	 * 经验值管理
	 */
	@RequestMapping("/empirValue")
	public String empirValue(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/member/empirValue";
	}
	
	/**
	 * 会员通知
	 */
	@RequestMapping("/infoList")
	public String infoList(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/member/infoList";
	}
	
	/**
	 * 预存款
	 */
	@RequestMapping("/preDeposit")
	public String preDeposit(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/member/preDeposit";
	}
	
	/**
	 * 分享绑定
	 */
	@RequestMapping("/shareBind")
	public String shareBind(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/member/shareBind";
	}
	
}

package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/operate")
public class OperateController {

	@Autowired
	IAdminService adminService;
	
	/**
	 * 基本设置
	 */
	@RequestMapping("/basic")
	public String basic(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/basic";
	}
	
	/**
	 * 抢购管理
	 */
	@RequestMapping("/panicBuying")
	public String panicBuying(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/panicBuying";
	}
	
	/**
	 * 限时折扣
	 */
	@RequestMapping("/discount")
	public String discount(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/discount";
	}
	
	/**
	 * 满即送
	 */
	@RequestMapping("/fullFree")
	public String fullFree(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/fullFree";
	}
	
	/**
	 * 代金券
	 */
	@RequestMapping("/cashCoupon")
	public String cashCoupon(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/cashCoupon";
	}
	
	/**
	 * 兑换礼品
	 */
	@RequestMapping("/gifts")
	public String gifts(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/gifts";
	}
	
	/**
	 * 平台客服
	 */
	@RequestMapping("/customerService")
	public String customerService(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/customerService";
	}
	
	/**
	 * 平台充值卡
	 */
	@RequestMapping("/chargeCard")
	public String chargeCard(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/operate/chargeCard";
	}
	
}

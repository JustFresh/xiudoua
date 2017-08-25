package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/transaction")
public class TransactionController {
	
	@Autowired
	IAdminService adminService;
	
	/**
	 * 实物订单
	 */
	@RequestMapping("/order")
	public String order(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/transaction/order";
	}

	/**
	 * 退款管理
	 */
	@RequestMapping("/refund")
	public String refund(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/transaction/refund";
	}
	
	/**
	 * 退货管理
	 */
	@RequestMapping("/returnGoods")
	public String returnGoods(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/transaction/returnGoods";
	}
	
	/**
	 * 咨询管理
	 */
	@RequestMapping("/consult")
	public String consult(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/transaction/consult";
	}
	
	/**
	 * 举报管理
	 */
	@RequestMapping("/report")
	public String report(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/transaction/report";
	}
	
	/**
	 * 评价管理
	 */
	@RequestMapping("/comment")
	public String comment(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/transaction/comment";
	}
	
}

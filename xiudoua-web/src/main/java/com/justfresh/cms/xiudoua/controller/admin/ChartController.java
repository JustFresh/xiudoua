package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/chart")
public class ChartController {

	@Autowired
	IAdminService adminService;
	
	/**
	 * 概述及设置
	 */
	@RequestMapping("/index")
	public String index(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/chart/index";
	}
	
	/**
	 * 会员统计
	 */
	@RequestMapping("/memberChart")
	public String memberChart(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/chart/memberChart";
	}
	
	/**
	 * 销量分析
	 */
	@RequestMapping("/saleChart")
	public String saleChart(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/chart/saleChart";
	}
	
	/**
	 * 访问分析
	 */
	@RequestMapping("/visitChart")
	public String visitChart(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/chart/visitChart";
	}
	
}

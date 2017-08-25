package com.justfresh.cms.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.justfresh.xiudoua.service.IAdminService;

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {

	@Autowired
	IAdminService adminService;
	
	@RequestMapping("/categorys")
	public String categorys(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/goods/categorys";
	}
	
	@RequestMapping("/brands")
	public String config(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/goods/brands";
	}
	

	@RequestMapping("/goods")
	public String goods(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/goods/goods";
	}
	
	@RequestMapping("/types")
	public String types(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/goods/types";
	}
	
	@RequestMapping("/spec")
	public String spec(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/goods/spec";
	}
	
	@RequestMapping("/images")
	public String images(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/goods/images";
	}
	
}

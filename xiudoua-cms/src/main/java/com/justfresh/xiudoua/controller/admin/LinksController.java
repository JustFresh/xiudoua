package com.justfresh.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfLinks;
import com.justfresh.xiudoua.service.ILinksService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/links")
public class LinksController {
	
	@Autowired
	ILinksService linksService;

	//添加友情链接
	@ResponseBody
	@RequestMapping("/addLinks")
	public Json addLinks(JfLinks param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.linksService.add(param);
			if(count > 0){
				json.setMsg("添加友情链接成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("添加友情链接失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//编辑友情链接
	@ResponseBody
	@RequestMapping("/editLinks")
	public Json editLinks(JfLinks param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.linksService.update(param);
			if(count > 0){
				json.setMsg("编辑友情链接成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("编辑友情链接失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//删除友情链接
	@ResponseBody
	@RequestMapping("/removeLinks")
	public Json removeLinks(JfLinks param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.linksService.delete(param);
			if(count > 0){
				json.setMsg("删除友情链接成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("删除友情链接失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//批量删除友情链接
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids,JfLinks param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.linksService.batchRemove(param,ids);
			if(count > 0){
				json.setMsg("共删除了" + count + "条友情链接数据");
				json.setSuccess(true);
			}else{
				json.setMsg("批量删除友情链接失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
		
}

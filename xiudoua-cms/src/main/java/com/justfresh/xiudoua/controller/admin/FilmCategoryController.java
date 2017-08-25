package com.justfresh.xiudoua.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfCmsFilmCategory;
import com.justfresh.xiudoua.service.ICmsFilmCategoryService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/filmCategory")
public class FilmCategoryController {
	
	@Autowired
	ICmsFilmCategoryService cmsFilmCategoryService;
	
	//添加影片分类
	@ResponseBody
	@RequestMapping("/addFilmCategory")
	public Json addFilmCategory(JfCmsFilmCategory param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.cmsFilmCategoryService.add(param);
			if(count > 0){
				json.setMsg("添加影片分类成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("添加影片分类失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//编辑影片分类
	@ResponseBody
	@RequestMapping("/editFilmCategory")
	public Json editFilmCategory(JfCmsFilmCategory param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.cmsFilmCategoryService.update(param);
			if(count > 0){
				json.setMsg("编辑影片分类成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("编辑影片分类失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//删除影片分类
	@ResponseBody
	@RequestMapping("/removeFilmCategory")
	public Json removeFilmCategory(JfCmsFilmCategory param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.cmsFilmCategoryService.delete(param);
			if(count > 0){
				json.setMsg("删除影片分类成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("删除影片分类失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//批量删除影片分类
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids,JfCmsFilmCategory param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.cmsFilmCategoryService.batchRemove(param,ids);
			if(count > 0){
				json.setMsg("共删除了" + count + "条影片分类数据");
				json.setSuccess(true);
			}else{
				json.setMsg("批量删除影片分类失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping("/changeStatus")
	@ResponseBody
	public Json changeStatus(JfCmsFilmCategory param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsFilmCategoryService.changeStatus(param);
			if (count > 0) {
				json.setMsg("修改影片分类状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改影片分类状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
	@RequestMapping("/getList")
	@ResponseBody
	public Json getList(JfCmsFilmCategory param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			List<JfCmsFilmCategory> categoryList = this.cmsFilmCategoryService.getList(param);
			if (categoryList != null && categoryList.size() > 0) {
				json.setSuccess(true);
				json.setObj(categoryList);
			} else {
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}

	@RequestMapping("/getOne")
	@ResponseBody
	public Json getOne(JfCmsFilmCategory param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			JfCmsFilmCategory filmCategory = this.cmsFilmCategoryService.getOne(param);
			if (filmCategory != null) {
				json.setSuccess(true);
				json.setObj(filmCategory);
			} else {
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}

}

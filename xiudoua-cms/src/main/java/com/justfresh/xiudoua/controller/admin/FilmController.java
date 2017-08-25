package com.justfresh.xiudoua.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfCmsFilm;
import com.justfresh.xiudoua.service.ICmsFilmService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/film")
public class FilmController {

	@Autowired
	ICmsFilmService cmsFilmService;
	
	//添加影片
	@ResponseBody
	@RequestMapping("/addFilm")
	public Json addFilm(JfCmsFilm param,String image1,String image2,String image3,String image4,String image5,HttpServletRequest request){
		List<String> images = new ArrayList<String>();
		if(image1 != null && !"".equals(image1)){
			images.add(image1);
		}
		if(image2 != null && !"".equals(image2)){
			images.add(image2);
		}
		if(image3 != null && !"".equals(image3)){
			images.add(image3);
		}
		if(image4 != null && !"".equals(image4)){
			images.add(image4);
		}
		if(image5 != null && !"".equals(image5)){
			images.add(image5);
		}
		Json json = new Json();
		try {
			int count = this.cmsFilmService.add(param,images);
			if(count > 0){
				json.setMsg("添加影片成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("添加影片失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//编辑影片
	@ResponseBody
	@RequestMapping("/editFilm")
	public Json editFilm(JfCmsFilm param,String image1,String image2,String image3,String image4,String image5,HttpServletRequest request){
		List<String> images = new ArrayList<String>();
		if(image1 != null && !"".equals(image1)){
			images.add(image1);
		}
		if(image2 != null && !"".equals(image2)){
			images.add(image2);
		}
		if(image3 != null && !"".equals(image3)){
			images.add(image3);
		}
		if(image4 != null && !"".equals(image4)){
			images.add(image4);
		}
		if(image5 != null && !"".equals(image5)){
			images.add(image5);
		}
		Json json = new Json();
		try {
			int count = this.cmsFilmService.update(param,images);
			if(count > 0){
				json.setMsg("编辑影片成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("编辑影片失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
		
	//删除影片
	@ResponseBody
	@RequestMapping("/removeFilm")
	public Json removeFilm(JfCmsFilm param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.cmsFilmService.delete(param);
			if(count > 0){
				json.setMsg("删除影片成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("删除影片失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
		
	//批量删除影片
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids,JfCmsFilm param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.cmsFilmService.batchRemove(param,ids);
			if(count > 0){
				json.setMsg("共删除了" + count + "条影片数据");
				json.setSuccess(true);
			}else{
				json.setMsg("批量删除影片失败！！！");
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
	public Json changeStatus(JfCmsFilm param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsFilmService.changeStatus(param);
			if (count > 0) {
				json.setMsg("修改影片状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改影片状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
}

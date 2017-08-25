package com.justfresh.xiudoua.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfCmsFilmSequels;
import com.justfresh.xiudoua.service.ICmsFilmSequelsService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/filmSequels")
public class FilmSequelsController {

	@Autowired
	ICmsFilmSequelsService cmsFilmSequelsService;

	// 添加影片剧集
	@ResponseBody
	@RequestMapping("/addFilmSequels")
	public Json addFilmSequels(JfCmsFilmSequels param,HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsFilmSequelsService.add(param);
			if (count > 0) {
				json.setMsg("添加影片剧集成功！！！");
				json.setObj(count);
				json.setSuccess(true);
			} else {
				json.setMsg("添加影片剧集失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 编辑影片剧集
	@ResponseBody
	@RequestMapping("/editFilmSequels")
	public Json editFilmSequels(JfCmsFilmSequels param,HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsFilmSequelsService.update(param);
			if (count > 0) {
				json.setMsg("编辑影片剧集成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("编辑影片剧集失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 删除影片剧集
	@ResponseBody
	@RequestMapping("/removeFilmSequels")
	public Json removeFilmSequels(JfCmsFilmSequels param,HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsFilmSequelsService.delete(param);
			if (count > 0) {
				json.setMsg("删除影片剧集成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("删除影片剧集失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	@RequestMapping("/getList")
	@ResponseBody
	public Json getList(JfCmsFilmSequels param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			List<JfCmsFilmSequels> categoryList = this.cmsFilmSequelsService
					.getList(param);
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

}

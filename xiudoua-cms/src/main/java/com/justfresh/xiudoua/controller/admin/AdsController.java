package com.justfresh.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfCmsAds;
import com.justfresh.xiudoua.service.ICmsAdsService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/ads")
public class AdsController {
	
	@Autowired
	ICmsAdsService cmsAdsService;

	// 添加CMS广告
	@ResponseBody
	@RequestMapping("/addAds")
	public Json addAds(JfCmsAds param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsService.add(param);
			if (count > 0) {
				json.setMsg("添加CMS广告成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("添加CMS广告失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 编辑CMS广告
	@ResponseBody
	@RequestMapping("/editAds")
	public Json editAds(JfCmsAds param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsService.update(param);
			if (count > 0) {
				json.setMsg("编辑CMS广告成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("编辑CMS广告失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 删除CMS广告
	@ResponseBody
	@RequestMapping("/removeAds")
	public Json removeAds(JfCmsAds param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsService.delete(param);
			if (count > 0) {
				json.setMsg("删除CMS广告成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("删除CMS广告失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 批量删除CMS广告
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids, JfCmsAds param,
			HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsService.batchRemove(param, ids);
			if (count > 0) {
				json.setMsg("共删除了" + count + "条CMS广告数据");
				json.setSuccess(true);
			} else {
				json.setMsg("批量删除CMS广告失败！！！");
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
	public Json changeStatus(JfCmsAds param, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsAdsService.changeStatus(param);
			if (count > 0) {
				json.setMsg("修改CMS广告状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改CMS广告状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;

	}
	
}

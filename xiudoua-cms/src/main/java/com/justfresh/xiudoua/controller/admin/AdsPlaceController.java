package com.justfresh.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfCmsAdsPlace;
import com.justfresh.xiudoua.service.ICmsAdsPlaceService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/adsPlace")
public class AdsPlaceController {

	@Autowired
	ICmsAdsPlaceService cmsAdsPlaceService;

	// 添加广告位
	@ResponseBody
	@RequestMapping("/addAdsPlace")
	public Json addAdsPlace(JfCmsAdsPlace param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsPlaceService.add(param);
			if (count > 0) {
				json.setMsg("添加广告位成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("添加广告位失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 编辑广告位
	@ResponseBody
	@RequestMapping("/editAdsPlace")
	public Json editAdsPlace(JfCmsAdsPlace param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsPlaceService.update(param);
			if (count > 0) {
				json.setMsg("编辑广告位成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("编辑广告位失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 删除广告位
	@ResponseBody
	@RequestMapping("/removeAdsPlace")
	public Json removeAdsPlace(JfCmsAdsPlace param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsPlaceService.delete(param);
			if (count > 0) {
				json.setMsg("删除广告位成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("删除广告位失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 批量删除广告位
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids, JfCmsAdsPlace param,
			HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsAdsPlaceService.batchRemove(param, ids);
			if (count > 0) {
				json.setMsg("共删除了" + count + "条广告位数据");
				json.setSuccess(true);
			} else {
				json.setMsg("批量删除广告位失败！！！");
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
	public Json changeStatus(JfCmsAdsPlace param, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsAdsPlaceService.changeStatus(param);
			if (count > 0) {
				json.setMsg("修改广告位状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改广告位状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;

	}
	
	// 获取一条数据
	@ResponseBody
	@RequestMapping("/getOne")
	public Json getOne(JfCmsAdsPlace param, HttpServletRequest request,HttpSession session) {
		Json json = new Json();
		try {
			JfCmsAdsPlace adsPlace = this.cmsAdsPlaceService.getOne(param);
			if (adsPlace != null) {
				json.setSuccess(true);
				json.setObj(adsPlace);
			} else {
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

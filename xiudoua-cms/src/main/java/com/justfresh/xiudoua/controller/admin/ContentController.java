package com.justfresh.xiudoua.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfAdmin;
import com.justfresh.xiudoua.model.JfCmsContent;
import com.justfresh.xiudoua.model.JfCmsContentExt;
import com.justfresh.xiudoua.service.ICmsContentService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/content")
public class ContentController {

	@Autowired
	private ICmsContentService cmsContentService;

	// 添加CMS文章
	@ResponseBody
	@RequestMapping("/addContent")
	public Json addContent(JfCmsContent param, JfCmsContentExt ext, HttpServletRequest request,HttpSession session) {
		Json json = new Json();
		try {
			JfAdmin loginAdmin = (JfAdmin)session.getAttribute("loginAdmin");
			if(loginAdmin != null){
				param.setAuthorId(loginAdmin.getId());
				param.setAuthorName(loginAdmin.getLoginName());
			}
			int count = this.cmsContentService.add(param,ext);
			if (count > 0) {
				json.setMsg("添加CMS文章成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("添加CMS文章失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 编辑CMS文章
	@ResponseBody
	@RequestMapping("/editContent")
	public Json editContent(JfCmsContent param, JfCmsContentExt ext,HttpServletRequest request,HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsContentService.update(param,ext);
			if (count > 0) {
				json.setMsg("编辑CMS文章成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("编辑CMS文章失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 删除CMS文章
	@ResponseBody
	@RequestMapping("/removeContent")
	public Json removeContent(JfCmsContent param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsContentService.delete(param);
			if (count > 0) {
				json.setMsg("删除CMS文章成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("删除CMS文章失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 批量删除CMS文章
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids, JfCmsContent param,
			HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsContentService.batchRemove(param, ids);
			if (count > 0) {
				json.setMsg("共删除了" + count + "条CMS文章数据");
				json.setSuccess(true);
			} else {
				json.setMsg("批量删除CMS文章失败！！！");
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
	public Json changeStatus(JfCmsContent param, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsContentService.changeStatus(param);
			if (count > 0) {
				json.setMsg("修改CMS文章状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改CMS文章状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
	@RequestMapping("/changeRecommend")
	@ResponseBody
	public Json changeRecommend(JfCmsContent param, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsContentService.isRecommend(param);
			if (count > 0) {
				json.setMsg("修改CMS文章状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改CMS文章状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
	@RequestMapping("/changeTop")
	@ResponseBody
	public Json changeTop(JfCmsContent param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsContentService.isTop(param);
			if (count > 0) {
				json.setMsg("修改CMS文章状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改CMS文章状态失败！！！");
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
	public Json getList(JfCmsContent param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			List<JfCmsContent> channelList = this.cmsContentService.getList(param);
			if (channelList != null && channelList.size() > 0) {
				json.setSuccess(true);
				json.setObj(channelList);
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

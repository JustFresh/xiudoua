package com.justfresh.xiudoua.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfCmsChannel;
import com.justfresh.xiudoua.service.ICmsChannelService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/channel")
public class ChannelController {

	@Autowired
	private ICmsChannelService cmsChannelService;

	// 添加CMS栏目
	@ResponseBody
	@RequestMapping("/addChannel")
	public Json addChannel(JfCmsChannel param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsChannelService.add(param);
			if (count > 0) {
				json.setMsg("添加CMS栏目成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("添加CMS栏目失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 编辑CMS栏目
	@ResponseBody
	@RequestMapping("/editChannel")
	public Json editChannel(JfCmsChannel param, HttpServletRequest request,HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsChannelService.update(param);
			if (count > 0) {
				json.setMsg("编辑CMS栏目成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("编辑CMS栏目失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 删除CMS栏目
	@ResponseBody
	@RequestMapping("/removeChannel")
	public Json removeChannel(JfCmsChannel param, HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsChannelService.delete(param);
			if (count > 0) {
				json.setMsg("删除CMS栏目成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("删除CMS栏目失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	// 批量删除CMS栏目
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids, JfCmsChannel param,
			HttpServletRequest request, HttpSession session) {
		Json json = new Json();
		try {
			int count = this.cmsChannelService.batchRemove(param, ids);
			if (count > 0) {
				json.setMsg("共删除了" + count + "条CMS栏目数据");
				json.setSuccess(true);
			} else {
				json.setMsg("批量删除CMS栏目失败！！！");
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
	public Json changeStatus(JfCmsChannel param, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			int count = this.cmsChannelService.changeStatus(param);
			if (count > 0) {
				json.setMsg("修改CMS栏目状态成功！！！");
				json.setSuccess(true);
			} else {
				json.setMsg("修改CMS栏目状态失败！！！");
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
	public Json getList(JfCmsChannel param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			List<JfCmsChannel> channelList = this.cmsChannelService.getList(param);
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

	@RequestMapping("/getOne")
	@ResponseBody
	public Json getOne(JfCmsChannel param, HttpServletRequest request,HttpServletResponse response, HttpSession session) {

		Json json = new Json();
		try {
			JfCmsChannel channel = this.cmsChannelService.getOne(param);
			if (channel != null) {
				json.setSuccess(true);
				json.setObj(channel);
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

package com.justfresh.xiudoua.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfNotices;
import com.justfresh.xiudoua.service.INoticesService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/notices")
public class NoticesController {

	@Autowired
	INoticesService noticesService;
	
	//添加系统通知
		@ResponseBody
		@RequestMapping("/addNotices")
		public Json addNotices(JfNotices param,HttpServletRequest request,HttpSession session){
			Json json = new Json();
			try {
				int count = this.noticesService.add(param);
				if(count > 0){
					json.setMsg("添加系统通知成功！！！");
					json.setSuccess(true);
				}else{
					json.setMsg("添加系统通知失败！！！");
					json.setSuccess(false);
				}
			} catch (Exception e) {
				json.setMsg(e.getMessage());
				json.setSuccess(false);
				e.printStackTrace();
			}
			return json;
		}
		
		//编辑系统通知
		@ResponseBody
		@RequestMapping("/editNotices")
		public Json editNotices(JfNotices param,HttpServletRequest request,HttpSession session){
			Json json = new Json();
			try {
				int count = this.noticesService.update(param);
				if(count > 0){
					json.setMsg("编辑系统通知成功！！！");
					json.setSuccess(true);
				}else{
					json.setMsg("编辑系统通知失败！！！");
					json.setSuccess(false);
				}
			} catch (Exception e) {
				json.setMsg(e.getMessage());
				json.setSuccess(false);
				e.printStackTrace();
			}
			return json;
		}
		
		//删除系统通知
		@ResponseBody
		@RequestMapping("/removeNotices")
		public Json removeNotices(JfNotices param,HttpServletRequest request,HttpSession session){
			Json json = new Json();
			try {
				int count = this.noticesService.delete(param);
				if(count > 0){
					json.setMsg("删除系统通知成功！！！");
					json.setSuccess(true);
				}else{
					json.setMsg("删除系统通知失败！！！");
					json.setSuccess(false);
				}
			} catch (Exception e) {
				json.setMsg(e.getMessage());
				json.setSuccess(false);
				e.printStackTrace();
			}
			return json;
		}
		
		//批量删除系统通知
		@ResponseBody
		@RequestMapping("/batchRemove")
		public Json batchRemove(String ids,JfNotices param,HttpServletRequest request,HttpSession session){
			Json json = new Json();
			try {
				int count = this.noticesService.batchRemove(param,ids);
				if(count > 0){
					json.setMsg("共删除了" + count + "条系统通知数据");
					json.setSuccess(true);
				}else{
					json.setMsg("批量删除系统通知失败！！！");
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

package com.justfresh.xiudoua.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.model.JfUser;
import com.justfresh.xiudoua.service.IUserService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	
	@Autowired
	IUserService userService;
	
	//查询用户列表
	@ResponseBody
	@RequestMapping("/getList")
	public Json getList(JfUser param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			List<JfUser> userList = this.userService.getList(param);
			if(userList != null && userList.size() > 0){
				json.setObj(userList);
				json.setSuccess(true);
			}else{
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}

	//添加用户
	@ResponseBody
	@RequestMapping("/addUser")
	public Json addUser(JfUser param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.userService.add(param);
			if(count > 0){
				json.setMsg("添加用户成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("添加用户失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//编辑用户
	@ResponseBody
	@RequestMapping("/editUser")
	public Json editUser(JfUser param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.userService.update(param);
			if(count > 0){
				json.setMsg("编辑用户成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("编辑用户失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//删除用户
	@ResponseBody
	@RequestMapping("/removeUser")
	public Json removeUser(JfUser param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.userService.delete(param);
			if(count > 0){
				json.setMsg("删除用户成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("删除用户失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	//批量删除用户
	@ResponseBody
	@RequestMapping("/batchRemove")
	public Json batchRemove(String ids,JfUser param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.userService.batchRemove(param,ids);
			if(count > 0){
				json.setMsg("共删除了" + count + "条用户数据");
				json.setSuccess(true);
			}else{
				json.setMsg("批量删除用户失败！！！");
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
	public Json changeStatus(JfUser param,HttpServletRequest request, HttpServletResponse response,HttpSession session){
		
		Json json = new Json();
		try {
			int count = this.userService.changeStatus(param);
			if(count > 0){
				json.setMsg("修改用户状态成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("修改用户状态失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
		
	}
	
}

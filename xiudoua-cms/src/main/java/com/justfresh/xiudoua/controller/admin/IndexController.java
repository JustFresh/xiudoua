package com.justfresh.xiudoua.controller.admin;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.entity.SiteConfig;
import com.justfresh.xiudoua.model.JfAdmin;
import com.justfresh.xiudoua.model.JfLinks;
import com.justfresh.xiudoua.model.JfNotices;
import com.justfresh.xiudoua.model.JfSettings;
import com.justfresh.xiudoua.model.JfUser;
import com.justfresh.xiudoua.service.IAdminService;
import com.justfresh.xiudoua.service.ILinksService;
import com.justfresh.xiudoua.service.IMessagesService;
import com.justfresh.xiudoua.service.INoticesService;
import com.justfresh.xiudoua.service.ISettingsService;
import com.justfresh.xiudoua.service.IUserService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin")
public class IndexController {

	@Autowired
	IAdminService adminService;
	
	@Autowired
	ISettingsService setttingsService;
	
	@Autowired
	ILinksService linksService;
	
	@Autowired
	IMessagesService messagesService;
	
	@Autowired
	INoticesService noticesService;
	
	@Autowired
	IUserService userService;
	
	@RequestMapping("/{url}")
	public String url(@PathVariable String url, HttpServletRequest request,HttpSession session) {
		return "Admin/" + url;
	}
	
	/**
	 * 生成验证码
	 */
	@RequestMapping("/getVerifyCode")
	public String getVerifyCode(HttpServletRequest request, HttpServletResponse response,HttpSession session)  throws IOException{
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setDateHeader("Expires", 0);
		session = request.getSession();
		// 在内存中创建图象
		int width = 70, height = 23;
		BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
		// 获取图形上下
		Graphics g = image.getGraphics();
		// 生成随机
		Random random = new Random();
		// 设定背景
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		// 设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN, 24));
		// 画边
		g.setColor(getRandColor(160, 200));
		g.drawRect(0, 0, width - 1, height - 1);
		// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		// 取随机产生的认证
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// 将认证码显示到图象中
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生�?
			g.drawString(rand, 13 * i + 14, 20);
		}

		// 将认证码存入SESSION
		session.setAttribute("checkcode", sRand);
		// 图象生效
		g.dispose();
		// 输出图象到页�?
		ImageIO.write(image, "JPEG", response.getOutputStream());
		return null;
	}
	
	private Color getRandColor(int fc, int bc) {// 给定范围获得随机颜色
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
	
	/**
	 * @desc: 校验登录用户名是否正确
	 * @author JustFresh
	 * @time: 2017-06-22 17:07
	 * @version: v1.0.0
	 */
	@RequestMapping("/checkLoginName")
	@ResponseBody
	public Json checkLoginName(JfAdmin param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			boolean flag = this.adminService.checkLoginName(param.getLoginName());
			if(flag){
				json.setSuccess(true);
				json.setMsg("管理员账号输入正确！");
			}else{
				json.setSuccess(false);
				json.setMsg("管理员账号输入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg(e.getMessage());
			json.setSuccess(true);
		}
		return json;
	}
	
	/**
	 * @desc: 管理员登录
	 * @author JustFresh
	 * @time: 2017-06-22 17:07
	 * @version: v1.0.0
	 */
	@RequestMapping(value = "/rlogin")    
	@ResponseBody
	public Json rlogin(String checkcode,JfAdmin param,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			if(!checkcode.equals(session.getAttribute("checkcode"))){
				json.setMsg("验证码输入错误");
				json.setSuccess(false);
			}else{
				JfAdmin loginAdmin = this.adminService.login(param);
				if(loginAdmin != null && loginAdmin.getId() > 0){
					loginAdmin.setPassword("******");
					session.setAttribute("loginAdmin", loginAdmin);
					json.setSuccess(true);
					json.setMsg("管理员登录成功");
					json.setObj(loginAdmin);
				}else{
					json.setSuccess(false);
					json.setMsg("管理员登录失败");
				}
			}
			
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
	
	/**
	 * @desc: 管理员注�?
	 * @author JustFresh
	 * @time: 2017-06-22 17:07
	 * @version: v1.0.0
	 */
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request,HttpSession session){
		session.setAttribute("loginAdmin", null);
		return "success";
	}
	
	/**
	 * @desc: 用户对后台管理系统界面的跳转
	 */
	@RequestMapping("/index")
	public String index(String mod,String act,HttpServletRequest request,HttpSession session){
		String url = "";
		if(mod == null || mod.equals("")){
			mod = "index";
		}
		if(act == null || act.equals("")){
			act = "index";
		}
		switch(mod){
			case "index":
				if(act.equals("index")){
					url = "Admin/index/index";
				}else if(act.equals("aboutUs")){
					url = "forward:/admin/aboutUs.htm";
				}else if(act.equals("config")){
					url = "forward:/admin/config.htm";
				}else if(act.equals("links")){
					url = "forward:/admin/links.htm";
				}else if(act.equals("messages")){
					url = "forward:/admin/messages.htm";
				}else if(act.equals("notices")){
					url = "forward:/admin/notices.htm";
				}else if(act.equals("power")){
					url = "forward:/admin/power.htm";
				}else if(act.equals("users")){
					url = "forward:/admin/users.htm";
				}else{
					url = "Admin/index/index.htm";
				}
				break;
			case "cms" :
				if(act.equals("ads")){
					url = "forward:/admin/cms/ads.htm";
				}else if(act.equals("channels")){
					url = "forward:/admin/cms/channels.htm";
				}else if(act.equals("contents")){
					url = "forward:/admin/cms/contents.htm";
				}else if(act.equals("film_categorys")){
					url = "forward:/admin/cms/film_categorys.htm";
				}else if(act.equals("films")){
					url = "forward:/admin/cms/films.htm";
				}
				break;
			default: 
				url = "Admin/index/index";
				break;
		}
		if(url.equals("")){
			return "Admin/index/index";
		}else{
			return url;
		}
	}
	
	//跳转到关于我们页面
	@RequestMapping("/aboutUs")
	public String aboutUs(JfSettings settings,String mod,String act,HttpServletRequest request,HttpSession session){
		//查询settings表的配置数据存储到前台展示
		try {
			Map<String,String> map = new HashMap<String, String>();
			List<JfSettings> settingsList = this.setttingsService.getList(settings);
			if(settingsList != null && settingsList.size() > 0){
				for(int i=0;i<settingsList.size();i++){
					map.put(settingsList.get(i).getName(), settingsList.get(i).getValue());
				}
			}
			request.setAttribute("settings", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/index/aboutUs";
	}
	
	//跳转到站点设置页面
	@RequestMapping("/config")
	public String config(JfSettings settings,String mod,String act,HttpServletRequest request,HttpSession session){
		try {
			Map<String,String> map = new HashMap<String, String>();
			List<JfSettings> settingsList = this.setttingsService.getList(settings);
			if(settingsList != null && settingsList.size() > 0){
				for(int i=0;i<settingsList.size();i++){
					map.put(settingsList.get(i).getName(), settingsList.get(i).getValue());
				}
			}
			request.setAttribute("settings", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/index/config";
	}
	
	//跳转到站点设置页面
	@ResponseBody
	@RequestMapping("/siteConfig")
	public Json siteConfig(SiteConfig config,String mod,String act,HttpServletRequest request,HttpSession session){
		Json json = new Json();
		try {
			int count = this.setttingsService.editSettings(config);
			if(count > 0){
				json.setMsg("修改站点配置成功！！！");
				json.setSuccess(true);
			}else{
				json.setMsg("修改站点配置失败！！！");
				json.setSuccess(false);
			}
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping("/links")
	public String links(String mod,String act,String opt,String name,JfLinks param,HttpServletRequest request,HttpSession session){
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/" + opt + ".htm";
		}
		//条件查询系统的友情链接分页数据存储
		try {
			if(name != null && !"".equals(name)){
				param.setName(new String(name.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordName", new String(name.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfLinks> page = this.linksService.page(param);
			request.setAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/index/links";
	}
	
	
	//跳转到友情链接添加/编辑页面
	@RequestMapping("/links_mng")
	public String links_mng(String mod,String act,String opt,JfLinks param,HttpServletRequest request,HttpSession session){
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储友情链接对象到页面回显
			try {
				JfLinks links = this.linksService.getOne(param);
				request.setAttribute("links", links);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/index/links_mng";
		
	}
	
	@RequestMapping("/messages")
	public String messages_mng(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/messages";
	}
	
	@RequestMapping("/notices")
	public String notices_mng(JfNotices param,String mod,String act,String opt,String title,HttpServletRequest request,HttpSession session){
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/" + opt + ".htm";
		}
		//条件查询系统的友情链接分页数据存储
		try {
			if(title != null && !"".equals(title)){
				param.setTitle(new String(title.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordTitle", new String(title.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfNotices> page = this.noticesService.page(param);
			request.setAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/index/notices";
	}
	
	//跳转到系统通知添加/编辑页面
	@RequestMapping("/notices_mng")
	public String notices_mng(String mod,String act,String opt,JfNotices param,HttpServletRequest request,HttpSession session){
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储友情链接对象到页面回显
			try {
				JfNotices notices = this.noticesService.getOne(param);
				request.setAttribute("notices", notices);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/index/notices_mng";
		
	}
	
	@RequestMapping("/power")
	public String power(String mod,String act,String opt,HttpServletRequest request,HttpSession session){
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/" + opt + ".htm";
		}
		request.setAttribute("opt", null);
		return "Admin/index/power";
	}
	
	//跳转到添加权限组页面
	@RequestMapping("/add_admin_role")
	public String add_admin_role(String mod,String act,String opt,HttpServletRequest request,HttpSession session){
		request.setAttribute("opt", "add_admin_role");
		return "Admin/index/add_admin_role";
	}
	
	@RequestMapping("/users")
	public String users(String mod,String act,String opt,String keywordNickName,JfUser param,HttpServletRequest request,HttpSession session){
		if(opt != null && !opt.trim().equals("")){
			return "forward:/admin/" + opt + ".htm";
		}
		//条件查询系统的友情链接分页数据存储
		try {
			if(keywordNickName != null && !"".equals(keywordNickName)){
				param.setNickName(new String(keywordNickName.getBytes("ISO-8859-1"),"UTF-8"));
				request.setAttribute("keywordNickName", new String(keywordNickName.getBytes("ISO-8859-1"),"UTF-8"));
			}
			Page<JfUser> page = this.userService.page(param);
			request.setAttribute("page", page);
			request.setAttribute("user", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Admin/index/users";
	}
	
	
	//跳转到系统用户添加/编辑页面
	@RequestMapping("/user_mng")
	public String user_mng(String mod,String act,String opt,JfUser param,HttpServletRequest request,HttpSession session){
		if(param != null && param.getId() != null && param.getId() > 0){
			//跳转到编辑页面，存储系统用户对象到页面回显
			try {
				JfUser user = this.userService.getOne(param);
				request.setAttribute("user", user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Admin/index/user_mng";
		
	}
		
}

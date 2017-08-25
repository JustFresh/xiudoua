package com.justfresh.cms.xiudoua.controller.admin;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
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

import com.justfresh.xiudoua.model.JfAdmin;
import com.justfresh.xiudoua.service.IAdminService;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/admin")
public class IndexController {

	@Autowired
	IAdminService adminService;
	
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
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		// 设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN, 24));
		// 画边框
		g.setColor(getRandColor(160, 200));
		g.drawRect(0, 0, width - 1, height - 1);
		// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		// 取随机产生的认证码(4位数字)
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// 将认证码显示到图象中
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.drawString(rand, 13 * i + 14, 20);
		}

		// 将认证码存入SESSION
		session.setAttribute("checkcode", sRand);
		// 图象生效
		g.dispose();
		// 输出图象到页面
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
	 * @desc: 管理员注销
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
				}else if(act.equals("accoutSync")){
					url = "forward:/admin/accoutSync.htm";
				}else if(act.equals("uploadConfig")){
					url = "forward:/admin/uploadConfig.htm";
				}else if(act.equals("seo")){
					url = "forward:/admin/seo.htm";
				}else if(act.equals("messages")){
					url = "forward:/admin/messages.htm";
				}else if(act.equals("pay")){
					url = "forward:/admin/pay.htm";
				}else if(act.equals("cache")){
					url = "forward:/admin/cache.htm";
				}else if(act.equals("keywords")){
					url = "forward:/admin/keywords.htm";
				}else if(act.equals("mobilePay")){
					url = "forward:/admin/mobilePay.htm";
				}else if(act.equals("logs")){
					url = "forward:/admin/logs.htm";
				}else{
					url = "Admin/index/index.htm";
				}
				break;
			case "goods" :
				if(act.equals("categorys")){
					url = "forward:/admin/goods/categorys.htm";
				}else if(act.equals("brands")){
					url = "forward:/admin/goods/brands.htm";
				}else if(act.equals("goods")){
					url = "forward:/admin/goods/goods.htm";
				}else if(act.equals("types")){
					url = "forward:/admin/goods/types.htm";
				}else if(act.equals("spec")){
					url = "forward:/admin/goods/spec.htm";
				}else if(act.equals("images")){
					url = "forward:/admin/goods/images.htm";
				}
				break;
			case "member" :
				if(act.equals("index")){
					url = "forward:/admin/member/index.htm";
				}else if(act.equals("memberLevel")){
					url = "forward:/admin/member/memberLevel.htm";
				}else if(act.equals("empirValue")){
					url = "forward:/admin/member/empirValue.htm";
				}else if(act.equals("infoList")){
					url = "forward:/admin/member/infoList.htm";
				}else if(act.equals("preDeposit")){
					url = "forward:/admin/member/preDeposit.htm";
				}else if(act.equals("shareBind")){
					url = "forward:/admin/member/shareBind.htm";
				}
				break;
			case "transaction" :
				if(act.equals("order")){
					url = "forward:/admin/transaction/order.htm";
				}else if(act.equals("refund")){
					url = "forward:/admin/transaction/refund.htm";
				}else if(act.equals("returnGoods")){
					url = "forward:/admin/transaction/returnGoods.htm";
				}else if(act.equals("consult")){
					url = "forward:/admin/transaction/consult.htm";
				}else if(act.equals("report")){
					url = "forward:/admin/transaction/report.htm";
				}else if(act.equals("comment")){
					url = "forward:/admin/transaction/comment.htm";
				}
				break;
			case "site" :
				if(act.equals("articleCategorys")){
					url = "forward:/admin/site/articleCategorys.htm";
				}else if(act.equals("articles")){
					url = "forward:/admin/site/articles.htm";
				}else if(act.equals("agreement")){
					url = "forward:/admin/site/agreement.htm";
				}else if(act.equals("pageNavlist")){
					url = "forward:/admin/site/pageNavlist.htm";
				}else if(act.equals("adsPlace")){
					url = "forward:/admin/site/adsPlace.htm";
				}else if(act.equals("ads")){
					url = "forward:/admin/site/ads.htm";
				}
				break;
			case "operate" :
				if(act.equals("basic")){
					url = "forward:/admin/operate/basic.htm";
				}else if(act.equals("panicBuying")){
					url = "forward:/admin/operate/panicBuying.htm";
				}else if(act.equals("discount")){
					url = "forward:/admin/operate/discount.htm";
				}else if(act.equals("fullFree")){
					url = "forward:/admin/operate/fullFree.htm";
				}else if(act.equals("cashCoupon")){
					url = "forward:/admin/operate/cashCoupon.htm";
				}else if(act.equals("gifts")){
					url = "forward:/admin/operate/gifts.htm";
				}else if(act.equals("customerService")){
					url = "forward:/admin/operate/customerService.htm";
				}else if(act.equals("chargeCard")){
					url = "forward:/admin/operate/chargeCard.htm";
				}
				break;
			case "chart" :
				if(act.equals("index")){
					url = "forward:/admin/chart/index.htm";
				}else if(act.equals("memberChart")){
					url = "forward:/admin/chart/memberChart.htm";
				}else if(act.equals("saleChart")){
					url = "forward:/admin/chart/saleChart.htm";
				}else if(act.equals("visitChart")){
					url = "forward:/admin/chart/visitChart.htm";
				}
				break;
			case "wap" :
				if(act.equals("index")){
					url = "forward:/admin/wap/index.htm";
				}else if(act.equals("advs")){
					url = "forward:/admin/wap/advs.htm";
				}else if(act.equals("comments")){
					url = "forward:/admin/wap/comments.htm";
				}
				break;
			case "cms" :
				if(act.equals("index")){
					url = "forward:/admin/cms/index.htm";
				}else if(act.equals("articles")){
					url = "forward:/admin/cms/articles.htm";
				}else if(act.equals("articleCategorys")){
					url = "forward:/admin/cms/articleCategorys.htm";
				}else if(act.equals("navlist")){
					url = "forward:/admin/cms/navlist.htm";
				}else if(act.equals("topics")){
					url = "forward:/admin/cms/topics.htm";
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
	
	@RequestMapping("/aboutUs")
	public String aboutUs(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/aboutUs";
	}
	
	@RequestMapping("/config")
	public String config(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/config";
	}
	
	@RequestMapping("/accoutSync")
	public String accoutSync(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/accoutSync";
	}
	
	@RequestMapping("/uploadConfig")
	public String uploadConfig(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/uploadConfig";
	}
	
	@RequestMapping("/seo")
	public String seo(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/seo";
	}
	
	@RequestMapping("/messages")
	public String messages(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/messages";
	}
	
	@RequestMapping("/pay")
	public String pay(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/pay";
	}
	
	@RequestMapping("/keywords")
	public String keywords(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/keywords";
	}
	
	@RequestMapping("/cache")
	public String cache(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/cache";
	}
	
	@RequestMapping("/mobilePay")
	public String mobilePay(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/mobilePay";
	}
	
	@RequestMapping("/logs")
	public String logs(String mod,String act,HttpServletRequest request,HttpSession session){
		return "Admin/index/logs";
	}
	
}

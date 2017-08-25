package com.justfresh.cms.xiudoua.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	/** 
     * Handler执行完成之后调用这个方法 
     */
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object obj, Exception exc) throws Exception {
		
	}

	/** 
     * Handler执行之后，ModelAndView返回之前调用这个方法 
     */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,Object obj, ModelAndView view) throws Exception {
		
	}

	/** 
     * Handler执行之前调用这个方法 
     */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object obj) throws Exception {
		/*//获取请求的URL  
        String url = request.getRequestURI();  
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
        if(url.indexOf("login.do")>=0){ 
        	System.out.println("不拦截");
            return true;  
        }  
        //获取Session  
        HttpSession session = request.getSession(); 
        JfAdmin loginAdmin = (JfAdmin) session.getAttribute("loginAdmin");  
        if(loginAdmin != null && !loginAdmin.getLoginName().equals("")){  
            return true;  
        }  
        //不符合条件的，跳转到登录界面  
        request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);
        request.getRequestDispatcher("login.do").forward(request, response);
		return false;*/
		String url = request.getRequestURI(); 
		if(url.indexOf("admin/login.do")>=0 || url.indexOf("admin/css.do")>=0 || url.indexOf("admin/js.do")>=0){ 
        	System.out.println("不拦截");
            return true;  
        }
		String redirectUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/" + "admin/login.do";
		response.sendRedirect(redirectUrl);
		return false;
	}

}

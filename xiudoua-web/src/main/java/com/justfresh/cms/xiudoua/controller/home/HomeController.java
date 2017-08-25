package com.justfresh.cms.xiudoua.controller.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("/{url}")
	public String url(@PathVariable String url, HttpServletRequest request,
			HttpSession session) {
		return "Home/" + url;
	}
	
}

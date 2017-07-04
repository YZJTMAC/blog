package com.csdn.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.csdn.domain.User;
import com.csdn.service.UserService;

/**
 * 功能概要：LoginController
 *  TMACJ
 *   2017.6.30
 */
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value="/login.action	", method = RequestMethod.POST)
	public String loginSucceed(HttpServletRequest request,ModelMap modelMap) {
		String account = request.getParameter("account");
		String psw = request.getParameter("psw");
		User user = userService.selectUserByAccount(account, psw);
		if (null != user) {
			modelMap.addAttribute("account", user.getAccount());
			return "MyHomePage";
		} else {
			modelMap.addAttribute("message","登入失败，请检查您的账号和密码是否正确！");
			return "Login";
		}
	}

	  
	  @RequestMapping(value = "/login", method = RequestMethod.GET)
	   public String GoToLoginPage() {
	      return "Login";
	   }
	  
	  @RequestMapping(value = "/go_find_psw.action", method = RequestMethod.GET)
	   public String GoFindPswPage() {
	      return "FindPsw";
	   }
	  
	  @RequestMapping(value = "/find_psw.action", method = RequestMethod.POST)
	   public String FindPswPage(HttpServletRequest request,ModelMap modelMap) {
			String email = request.getParameter("email");
			User user = userService.selectInfoByEmail(email);
			if(user!=null){
				modelMap.addAttribute("message", "账号密码已发送到您的账户，请查收！");
			}
			else{
				modelMap.addAttribute("message", "您输入的邮箱有误！");
			}
	      return "Warm";
	   }
}
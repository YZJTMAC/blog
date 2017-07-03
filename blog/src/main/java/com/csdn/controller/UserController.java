package com.csdn.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
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
	public String loginSucceed(HttpServletRequest request) {
		String account = request.getParameter("account");
		String psw = request.getParameter("psw");
		User user = userService.selectUserByAccount(account, psw);
		if (null != user) {
			return "LoginSucceed";
		} else {
			return "LoginFailed";
		}
	}

	  @RequestMapping(value = "/hello", method = RequestMethod.GET)
	   public String printHello(HttpServletRequest request) {
	      return "hello";
	   }
	  
	  @RequestMapping(value = "/login", method = RequestMethod.GET)
	   public String GoToLoginPage(HttpServletRequest request) {
	      return "Login";
	   }
	
}
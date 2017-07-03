package com.csdn.service;

import com.csdn.domain.User;

/**
 * 功能概要：UserService接口类
 * 
 *  TMACJ
 *  2017.6.30
 */
public interface UserService {
	User selectUserByAccount(String account,String psw);
}
package com.csdn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csdn.dao.UserMapper;
import com.csdn.dao.UserMapperImpl;
import com.csdn.domain.User;

/**
 * 功能概要：UserService实现类
 * 
 * TMACJ 
 * 2017.6.30
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapperImpl;

	@Override
	public User selectUserByAccount(String account,String psw) {
		return userMapperImpl.selectUserByAccount(account,psw);
	}

	@Override
	public User selectInfoByEmail(String email) {
		return userMapperImpl.selectInfoByEmail(email);
	}

}
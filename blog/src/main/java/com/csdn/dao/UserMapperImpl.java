package com.csdn.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csdn.domain.User;
@Repository
public class UserMapperImpl implements UserMapper {
	@Autowired
	SqlSession SqlSession;
	UserMapper userMapper ;
	@Override
	public User selectUserByAccount(String account,String psw) {
		createUserMapper();
		 User userDTO = userMapper.selectUserByAccount(account,psw);
		return userDTO;
	}
	@Override
	public User selectInfoByEmail(String email) {
		createUserMapper();
		User user = userMapper.selectInfoByEmail(email);
		return user;
	}
	
	public UserMapper createUserMapper(){
		if(userMapper==null){
			userMapper = SqlSession.getMapper(UserMapper.class);
		}
		return userMapper;
	}
	
	
}

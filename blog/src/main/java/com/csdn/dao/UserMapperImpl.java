package com.csdn.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csdn.domain.User;
@Repository
public class UserMapperImpl implements UserMapper {
	@Autowired
	SqlSession SqlSession;
	@Override
	public User selectUserByAccount(String account,String psw) {
		 UserMapper userMapper =  SqlSession.getMapper(UserMapper.class);
		 User userDTO = userMapper.selectUserByAccount(account,psw);
		return userDTO;
	}

}

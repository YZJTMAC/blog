package com.csdn.dao;

import com.csdn.domain.User;

public interface UserMapper {

	 User selectUserByAccount(String account,String psw);
	
}

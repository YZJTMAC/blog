package com.csdn.daoTest;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.csdn.dao.UserMapper;
import com.csdn.dao.UserMapperImpl;
import com.csdn.domain.User;

public class UserDaoTest {

	Logger logger = Logger.getLogger(UserDaoTest.class);
	
	@Autowired
	private UserMapper userMapper;
	@Test
	public void test() {
		ApplicationContext context = new ClassPathXmlApplicationContext("application.xml");
		UserMapperImpl userMapperImpl = (UserMapperImpl)context.getBean(UserMapperImpl.class);
		User selectUserByAccount = userMapperImpl.selectUserByAccount("a","b");
		logger.debug("=======" + selectUserByAccount);
	}
	
}

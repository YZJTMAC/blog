package com.csdn.beanTest;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.csdn.domain.User;
import com.csdn.service.UserService;
import com.lin.baseTest.SpringTestCase;

/**
 * 功能概要：UserService单元测试
 * 
 * @author TMACJ
 * @since 2017.6.29
 */
public class UserBeanTest extends SpringTestCase {
	
	Logger logger = Logger.getLogger(UserBeanTest.class);

	@Test
	public void test() {
		User userDTO = (User)applicationContext.getBean("userDTO");
		logger.debug("==========" + userDTO);
	}

}
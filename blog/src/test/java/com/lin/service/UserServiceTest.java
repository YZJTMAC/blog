    package com.lin.service;  
      
    import org.apache.log4j.Logger;  
    import org.junit.Test;  
    import org.springframework.beans.factory.annotation.Autowired;

import com.csdn.controller.UserController;
import com.csdn.domain.User;
import com.csdn.service.UserService;
import com.lin.baseTest.SpringTestCase;  
      
    /** 
     * 功能概要：UserService单元测试 
     *  
     * @author linbingwen 
     * @since  2015年9月28日  
     */  
    public class UserServiceTest extends SpringTestCase {  
        @Autowired  
        private UserController userController;  
        Logger logger = Logger.getLogger(UserServiceTest.class);  
          
        @Test  
        public void selectUserByIdTest(){  
//            User user = userService.selectUserById(10);  
//            logger.debug("查找结果" + user);  
//        	userController.loginSucceed(request)
        }  
          
      
    }  
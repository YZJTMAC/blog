package com.lin.c3p0Test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;  
  
import org.junit.Test;

import com.csdn.c3p0.JdbcUtils;

import org.junit.Before;

public class c3p0Test {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testGetDataSource() throws SQLException {
	        Connection con = JdbcUtils.getConnection();  
	        System.out.println(con);  
	        JdbcUtils.releaseConnection(con);  
	        System.out.println(con.isClosed());  
	}

	@Test
	public void testGetConnection() {
		System.out.println("testGetDataSource");
	}

	@Test
	public void testBeginTransaction() {
		System.out.println("testGetDataSource");
	}

	@Test
	public void testCommitTransaction() {
		System.out.println("testGetDataSource");
	}

	@Test
	public void testRollbackTransaction() {
		System.out.println("testGetDataSource");
	}

	@Test
	public void testReleaseConnection() {
		System.out.println("testGetDataSource");
	}

}

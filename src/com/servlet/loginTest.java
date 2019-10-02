package com.servlet;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.dao.DBManager;

import utils.EncryptionUtil;

public class loginTest {
	EncryptionUtil c = null;
	@Test
	public void testLogin() {
		fail("Not yet implemented");

	}
    @Test
    public void testMultiplyException() {
    
        assertEquals(true,DBManager.getlogin("allen",c.encrypt("mysystem")));
   }

	
}

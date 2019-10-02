package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection con=null;
	private DBConnection(){}
	
	public static Connection getConnection()
	{
		if(con==null)
		{
			
			     try{   Class.forName("com.mysql.jdbc.Driver");
	                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/auction_app","root","");
	            return con;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
		return con;
	

	}
}

package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {
	
	public static Connection getConnection() {
			
			Connection con = null;
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_vaccine", "root", "SWE1909766_101234^^");
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
		
	}	
	
	
	public static boolean validate(String admin_acc_id, String password)
	{
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from admin where admin_acc_id = ? and password = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pst.setString(1, admin_acc_id);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			
			 rs.last();
	         int rsSize = rs.getRow();
	         rs.beforeFirst();
	
	         if(rsSize < 1) {
	        	 
	        	 return false;
	         }
	         else {
	
	             if(rs.next()) {
			
	            	 return true;
	            	 
	             }
	             
	         }
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return false;
	}
	
}

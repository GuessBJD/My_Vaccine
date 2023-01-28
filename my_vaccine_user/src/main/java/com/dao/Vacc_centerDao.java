package com.dao;

import java.sql.*;
import java.util.ArrayList;

import com.dao.bean.Vacc_center;

public class Vacc_centerDao {

	public static Connection getConnection() {
		
		Connection con = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_vaccine","root","SWE1909766_101234^^");
							
		}catch (Exception e){
			
			System.out.println(e);
			
		}
		
		return con;
		
	}
	
	public static java.util.List<String> getAllStates(){
		
		java.util.List<String> list = new ArrayList<String>();
		
		try {
			
			Connection con = getConnection();
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("select distinct state from vacc_center;");

			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1) {
				
			}
			else {
				
				while(rs.next()) {
					
					String rec = new String();
					rec = rs.getString("state");
					
					list.add(rec);
					
				}
				
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return list;
		
	}
	
	public static java.util.List<String> getDistrictByState(String state){
		
		java.util.List<String> list = new ArrayList<String>();
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select distinct district from vacc_center where state=?;", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, state);
			
			ResultSet rs = pst.executeQuery();

			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1) {
				
			}
			else {
				
				while(rs.next()) {
					
					String rec = new String();
					rec = rs.getString("district");
					
					list.add(rec);
					
				}
				
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return list;
		
	}

	public static java.util.List<String> getVaccCenterByDistrict(String district){
		
		java.util.List<String> list = new ArrayList<String>();
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select center_name from vacc_center where district=?;", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, district);
			
			ResultSet rs = pst.executeQuery();

			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1) {
				
			}
			else {
				
				while(rs.next()) {
					
					String rec = new String();
					rec = rs.getString("center_name");
					
					list.add(rec);
					
				}
				
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return list;
		
	}	
}

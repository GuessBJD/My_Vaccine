package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
	
	public static List<Vacc_center> getAllRecords(){
		List<Vacc_center> list = new ArrayList<Vacc_center>();
		
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("select * from vacc_center");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Vacc_center vc = new Vacc_center();
				vc.setCenter_id(rs.getInt("center_id"));
				vc.setCenter_name(rs.getString("center_name"));
				vc.setState(rs.getString("state"));
				vc.setDistrict(rs.getString("district"));
				vc.setAddress(rs.getString("address"));
				
				
				list.add(vc);
			}
			
			
			}catch(Exception e) {
				System.out.println(e);
			}return list;	
		}

	public static java.util.List<Vacc_center> getResultBySearchAll(String state, String district, String vacc_center){
		java.util.List<Vacc_center> list = new ArrayList<Vacc_center>();
		
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("select * from vacc_center where state=? and district = ? and center_name=?;", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, state);
			pst.setString(2, district);
			pst.setString(3, vacc_center);
			ResultSet rs = pst.executeQuery();
			
			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1)
			{
				
			}else {
				while(rs.next()) {
					Vacc_center vc = new Vacc_center();
					vc.setCenter_id(rs.getInt("center_id"));
					vc.setCenter_name(rs.getString("center_name"));
					vc.setState(rs.getString("state"));
					vc.setDistrict(rs.getString("district"));
					vc.setAddress(rs.getString("address"));
					list.add(vc);
				}
			}
			
			}catch(Exception e) {
				System.out.println(e);
			}return list;	
		}

	public static java.util.List<Vacc_center> getResultBySearchState(String state){
		java.util.List<Vacc_center> list = new ArrayList<Vacc_center>();
		
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("select * from vacc_center where state=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, state);
			ResultSet rs = pst.executeQuery();
			
			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1)
			{
				
			}else {
				while(rs.next()) {
					Vacc_center vc = new Vacc_center();
					vc.setCenter_id(rs.getInt("center_id"));
					vc.setCenter_name(rs.getString("center_name"));
					vc.setState(rs.getString("state"));
					vc.setDistrict(rs.getString("district"));
					vc.setAddress(rs.getString("address"));
					list.add(vc);
				}
			}
			
			}catch(Exception e) {
				System.out.println(e);
			}return list;	
		}
	
	public static java.util.List<Vacc_center> getResultBySearchStateDistrict(String state, String district){
		java.util.List<Vacc_center> list = new ArrayList<Vacc_center>();
		
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("select * from vacc_center where state=? and district=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, state);
			pst.setString(2, district);
			ResultSet rs = pst.executeQuery();
			
			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1)
			{
				
			}else {
				while(rs.next()) {
					Vacc_center vc = new Vacc_center();
					vc.setCenter_id(rs.getInt("center_id"));
					vc.setCenter_name(rs.getString("center_name"));
					vc.setState(rs.getString("state"));
					vc.setDistrict(rs.getString("district"));
					vc.setAddress(rs.getString("address"));
					list.add(vc);
				}
			}
			
			}catch(Exception e) {
				System.out.println(e);
			}return list;	
		}
	
	public static int save(Vacc_center vc) {
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("insert into vacc_center (center_name, state, district, address) values (?, ?, ?, ?)");
			pst.setString(1, vc.getCenter_name());
			pst.setString(2, vc.getState());
			pst.setString(3, vc.getDistrict());
			pst.setString(4, vc.getAddress());
			
			
			status=pst.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}return status;
	}

	public static int update(Vacc_center vc) {
		int status=0;
		try {
			
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("update vacc_center set center_name=?, state=?, district=?, address=? where center_id=?");
			pst.setString(1, vc.getCenter_name());
			pst.setString(2, vc.getState());
			pst.setString(3, vc.getDistrict());
			pst.setString(4, vc.getAddress());
			pst.setInt(5,  vc.getCenter_id());
			status=pst.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}return status;
	}

	public static int delete(Vacc_center vc) {
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("delete from vacc_center where center_id=?; ");
			pst.setInt(1, vc.getCenter_id());
			status=pst.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}return status;
	}

	public static int resetAutoIncre(Vacc_center vc)
	{
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("ALTER TABLE vacc_center AUTO_INCREMENT = 1; ");
			status=pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}return status;
	}

	public static Vacc_center getRecordBycenter_Id (int center_id) {
		
		Vacc_center vc = null;
		try {
			Connection con=getConnection();
			PreparedStatement pst = con.prepareStatement("select * from vacc_center where center_id=?");
			pst.setInt(1, center_id);
			ResultSet rs = pst.executeQuery();
			vc= new Vacc_center();
			while(rs.next()) {
				
				vc.setCenter_id(rs.getInt("center_id"));
				vc.setCenter_name(rs.getString("center_name"));
				vc.setState(rs.getString("state"));
				vc.setDistrict(rs.getString("district"));
				vc.setAddress(rs.getString("address"));
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}return vc;
	}
	
}

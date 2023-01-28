package com.dao;

import java.sql.*;
import java.util.ArrayList;

import com.dao.bean.Applicant_vacc_status;

public class Applicant_vacc_statusDao {
	
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
	
	/*
	 * to-do:
	 * getAllRec
	 * getRecByIc
	 * update
	 * */
	
	public static java.util.List<Applicant_vacc_status> getAllRec(){
		
		java.util.List<Applicant_vacc_status> list = new ArrayList<Applicant_vacc_status>();
		
		try {
			
			Connection con = getConnection();
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("select * from applicant_vacc_status;");

			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1) {
				
			}
			else {
				
				while(rs.next()) {
					
					Applicant_vacc_status rec = new Applicant_vacc_status();
					
					rec.setIc(rs.getString("ic"));
					rec.setName(rs.getString("name"));
					rec.setFirstdose(rs.getBoolean("1stdose"));
					rec.setSeconddose(rs.getBoolean("2nddose"));
					
					list.add(rec);
					
				}
				
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return list;
		
	}

	public static Applicant_vacc_status getRecordByIcNo(String icNo) {
		
		Applicant_vacc_status rec = null;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from applicant_vacc_status where ic=?;", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pst.setString(1, icNo);
			
			ResultSet rs = pst.executeQuery();
			
			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1) {
				
			}
			else {
				
				rec = new Applicant_vacc_status();
	
				while(rs.next()) {
							
					rec.setIc(rs.getString("ic"));
					rec.setName(rs.getString("name"));
					rec.setFirstdose(rs.getBoolean("1stdose"));
					rec.setSeconddose(rs.getBoolean("2nddose"));
							
				}
			
			}
			
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return rec;
		
	}	

	public static int add(Applicant_vacc_status rec) {
		
		int status = 0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into applicant_vacc_status (ic, name, 1stdose, 2nddose) value(?,?,?,?);");
			pst.setString(1, rec.getIc());
			pst.setString(2, rec.getName());
			pst.setBoolean(3, rec.isFirstdose());
			pst.setBoolean(4, rec.isSeconddose());
			
			status=pst.executeUpdate();
			
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return status;
		
	}
	
	public static int update(String ic, boolean firstDose, boolean secondDose) {
		
		int status = 0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update applicant_vacc_status set 1stdose=?, 2nddose=? where ic=?;");
			pst.setBoolean(1, firstDose);
			pst.setBoolean(2, secondDose);
			pst.setString(3, ic);
			
			status = pst.executeUpdate();
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return status;
	}	
	
}

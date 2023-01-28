package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.ListIterator;

import com.dao.bean.Appointment;

public class AppointmentDao {
	
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
	 * to-do
	 * getUnassignedBySearch
	 * assignByList
	 * */
	
	public static java.util.List<Appointment> getUnassignedBySearch(String vacc_center, String vacc_choice, int doseNum){
		
		java.util.List<Appointment> list = new ArrayList<Appointment>();
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from appointment where appointment_id is null", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			if(doseNum == 1) {
				pst = con.prepareStatement("select * from appointment where vacc_center=? and vacc_choice=? and 1stdose_date is null", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}
			else if(doseNum == 2) {
				pst = con.prepareStatement("select * from appointment where vacc_center=? and vacc_choice=? and 2nddose_date is null", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}
			
			pst.setString(1, vacc_center);
			pst.setString(2, vacc_choice);
			ResultSet rs = pst.executeQuery();

			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();
			
			if(rsSize < 1) {
				
			}
			else {
				
				while(rs.next()) {
					
					Appointment rec = new Appointment();
					
					rec.setAppointment_id(rs.getInt("appointment_id"));
					rec.setIc(rs.getString("ic"));
					rec.setName(rs.getString("name"));
					rec.setVacc_center(rs.getString("vacc_center"));
					rec.setVacc_choice(rs.getString("vacc_choice"));
					rec.setFirstDose_Date(rs.getDate("1stdose_date"));
					rec.setSecondDose_Date(rs.getDate("2nddose_date"));
					
					list.add(rec);
					
				}
				
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return list;
		
	}	
	
	public static int assignByList(java.util.List<Appointment> assigningList, int count, Date date, int doseNum) {
		
		int status = 0;
		int c = 0;
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update appointment set 1stdose_date=? where appointment_id=?");
			
			if(doseNum == 1) {
				pst = con.prepareStatement("update appointment set 1stdose_date=? where appointment_id=?");
			}
			else if(doseNum == 2) {
				pst = con.prepareStatement("update appointment set 2nddose_date=? where appointment_id=?");
			}
			
			for(ListIterator<Appointment> iter = assigningList.listIterator(); iter.hasNext() && c < count; c++) {
				
				Appointment appointment = iter.next();
				
				pst.setDate(1, date);
				pst.setInt(2, appointment.getAppointment_id());
				
				status = pst.executeUpdate();
				
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return status;
		
	}	
	
	public static java.util.List<Appointment> getByList(java.util.List<Appointment> recs){
		
		java.util.List<Appointment> list = new ArrayList<Appointment>();
		
		try {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from appointment where appointment_id=?");
			ResultSet rs;
			
			for(ListIterator<Appointment> iter = recs.listIterator(); iter.hasNext(); ) {
				
				Appointment appointment = iter.next();
				
				pst.setInt(1, appointment.getAppointment_id());
				
				rs = pst.executeQuery();
				
				while(rs.next()) {
					
					Appointment rec = new Appointment();
					
					rec.setAppointment_id(rs.getInt("appointment_id"));
					rec.setIc(rs.getString("ic"));
					rec.setName(rs.getString("name"));
					rec.setVacc_center(rs.getString("vacc_center"));
					rec.setVacc_choice(rs.getString("vacc_choice"));
					rec.setFirstDose_Date(rs.getDate("1stdose_date"));
					rec.setSecondDose_Date(rs.getDate("2nddose_date"));
					
					list.add(rec);
					
				}
			}
						
		}catch(Exception e) {
			
			System.out.println(e);
			
		}
		
		return list;
		
	}
	
}

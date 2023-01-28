package com.dao;

import java.sql.*;

import com.dao.bean.Applicant;
import com.dao.bean.Appointment;


public class AppointmentDao 
{
	public static Connection getConnection()
	{
		Connection con=null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_vaccine","root","SWE1909766_101234^^");
			
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return con;
	}
	
	public static int insertAppointment(String applicant_name, String applicant_ic, String center_name, String vacc_choice, Date firstdose )
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into appointment (ic, name, vacc_center, vacc_choice, 1stdose_date) values (?,?,?,?,?)");
			pst.setString(1,applicant_ic);
			pst.setString(2,applicant_name);
			pst.setString(3, center_name);
			pst.setString(4,vacc_choice);
			pst.setDate(5, firstdose);
			
				
			status = pst.executeUpdate();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return status;
	}
	
	public static int UpdateName(String applicant_name, String applicant_ic)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update appointment set name=? where ic=?");
			pst.setString(2,applicant_ic);
			pst.setString(1,applicant_name);
				
			status = pst.executeUpdate();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return status;
	}
	
	public static int getAppointmentbyIc(Appointment u1)
	{
		int i=0;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from appointment where ic=?");
			pst.setString(1,u1.getIc());
			ResultSet rs=pst.executeQuery(); 
			while(rs.next())
			{
				++i;
				u1.setName(rs.getString("name"));
				u1.setVaccCenter(rs.getString("vacc_center"));
				u1.setVaccChoice(rs.getString("vacc_choice"));
				u1.setFirstdose(rs.getDate("1stdose_date"));
				u1.setSeconddose(rs.getDate("2nddose_date"));				
				
			}
			
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return i;
	}

	public static int CancelFirstDosebyIc(String ic)
	{
		int i=0; 
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update appointment set 1stdose_date=null where ic=?");
			pst.setString(1,ic);	
			i = pst.executeUpdate();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	
		return i;
	}

	public static int CancelSecondDosebyIc(String ic)
	{
		int i=0; 
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update appointment set 2nddose_date=null where ic=?");
			pst.setString(1,ic);	
			i = pst.executeUpdate();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	
		return i;
	}

}



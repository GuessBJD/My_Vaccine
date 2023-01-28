package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.bean.Applicant_vacc_status;

public class Applicant_vacc_statusDao
{
	public static Connection getConnection() 
	{
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/my_vaccine","root","SWE1909766_101234^^");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return con;
	}
	
	public static int insertApplicant(String applicant_name, String  applicant_ic )
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into applicant_vacc_status (ic, name) values (?,?)");
			pst.setString(1,applicant_ic);
			pst.setString(2,applicant_name);			
			
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
			PreparedStatement pst = con.prepareStatement("update applicant_vacc_status set name=? where ic=?");
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
	
	public static int getVaccineStatusbyIc(Applicant_vacc_status v)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from Applicant_vacc_status where ic=?");
			pst.setString(1, v.getIc());
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				++status;
				v.setFirstdose_sts(rs.getByte("1stdose"));
				v.setSeconddose_sts(rs.getByte("2nddose"));
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return status;
	}
	
}

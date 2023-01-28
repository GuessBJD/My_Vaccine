package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dao.bean.Applicant;

public class ApplicantDao 
{
	public static Connection getConnection()
	{
		Connection con= null;
		
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
	
	public static int insert(Applicant u)
	{
		int status = 0;
		try
		{
System.out.println("applicant insert");
System.out.println(u.getIc());
			Connection con =getConnection();
			PreparedStatement pst = con.prepareStatement("insert into applicant (name,ic,gender,phone_no,email,address) values (?,?,?,?,?,?)" );
			pst.setString(1,u.getName());
			pst.setString(2,u.getIc());
			pst.setByte(3,u.getGender());
			pst.setString(4,u.getPhone());
			pst.setString(5,u.getEmail());
			pst.setString(6,u.getAddress());
			
			status = pst.executeUpdate();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return status;
	}
	
	public static int update(Applicant u)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update applicant set name=?, gender=?, phone_no=?, email=?, address=? where ic=?;");
			pst.setString(1,u.getName());
			pst.setByte(2,u.getGender());
			pst.setString(3,u.getPhone());
			pst.setString(4,u.getEmail());
			pst.setString(5,u.getAddress());
			pst.setString(6,u.getIc());
			
			status = pst.executeUpdate();
				
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return status;
	}
	
	public static int getApplicantbyIc(Applicant u)
	{
		int i=0; 
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from applicant where ic=?");
			pst.setString(1,u.getIc());
			ResultSet rs=pst.executeQuery(); 
			while(rs.next())
			{
				++i;
				u.setName(rs.getString("name"));
				u.setIc(rs.getString("ic"));
				u.setGender(rs.getByte("gender"));
				u.setPhone(rs.getString("phone_no"));
				u.setEmail(rs.getString("email"));
				u.setAddress(rs.getString("address"));
				
			}
			
		
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return i;
	}
	
	public static Applicant getApplicantbyIc(String ic)
	{
		Applicant rec= null;
		try
		{
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from applicant where ic=?;", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pst.setString(1, ic);

			ResultSet rs = pst.executeQuery();

			rs.last();
			int rsSize = rs.getRow();
			rs.beforeFirst();

			if(rsSize < 1) {

			}
			else {

			rec = new Applicant();
		
			while(rs.next()) {

				rec.setName(rs.getString("name"));
				rec.setIc(rs.getString("ic"));
				rec.setGender(rs.getByte("gender"));
				rec.setPhone(rs.getString("phone_no"));
				rec.setEmail(rs.getString("email"));
				rec.setAddress(rs.getString("address"));

			}

			}
		
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return rec;
	}
		public static boolean validate(Applicant u) {
			boolean status = true;
			
			try {
				Connection con=getConnection();
				PreparedStatement pst=con.prepareStatement("select * from applicant where ic=?");
				pst.setString(1,  u.getIc());
				//pst.setString(2,  u.getName());	
				ResultSet rs = pst.executeQuery();
				status=rs.next();
				
			} catch (Exception e) {
				
				System.out.println(e);
			}
			return status;
		}
		
	
		
		public static List<Applicant> getAllRecords() { 
			List<Applicant> list= new ArrayList<Applicant>();
			
			try {
				Connection con=getConnection();
				PreparedStatement pst = con.prepareStatement("select * from applicant");
				ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					Applicant u = new Applicant();
					
					u.setName(rs.getString("name"));
					u.setIc(rs.getString("ic"));
					u.setGender(rs.getByte("gender"));
					u.setPhone(rs.getString("phone_no"));
					u.setEmail(rs.getString("email"));
					u.setAddress(rs.getString("address"));
					
					
					list.add(u);
				}
				
			}catch(Exception e) {
				System.out.println(e);
			}return list;
		}

	
}
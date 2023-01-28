package com.dao.bean;

public class Applicant 
{
	private int applicant_id;
	private String name, ic, phone_no, email, address;
	private Byte gender;
	
	public int getId()
	{
		return applicant_id;
	}
	
	public void setId(int applicant_id)
	{
		this.applicant_id = applicant_id;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getIc()
	{
		return ic;
	}
	
	public void setIc(String ic)
	{
		this.ic = ic;
	}
	
	public String getPhone()
	{
		return phone_no;
	}
	
	public void setPhone(String phone_no)
	{
		this.phone_no = phone_no;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getAddress()
	{
		return address;
	}
	
	public void setAddress(String address)
	{
		this.address = address;
	}

	public Byte getGender() 
	{
		return gender;
	}
	

	public void setGender(Byte gender) 
	{
		this.gender = gender;
	}
	
	
}

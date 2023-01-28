package com.dao.bean;

import java.sql.Date;

public class Appointment 
{
	private int appointment_id;
	private String name, ic, vacc_center, vacc_choice;
	private Date firstdose, seconddose;
	
	public int getAppointment_id()
	{
		return appointment_id;
	}
	
	public void setId(int appointment_id)
	{
		this.appointment_id = appointment_id;
	}
	
	public String getIc()
	{
		return ic;
	}
	
	public void setIc(String ic)
	{
		this.ic = ic;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getVaccCenter()
	{
		return vacc_center;
	}
	
	public void setVaccCenter(String vacc_center)
	{
		this.vacc_center = vacc_center;
	}
	
	public String getVaccChoice()
	{
		return vacc_choice;
	}
	
	public void setVaccChoice(String vacc_choice)
	{
		this.vacc_choice = vacc_choice;
	}

	public Date getFirstdose()
	{
		return firstdose;
	}

	public void setFirstdose(Date firstdose) 
	{
		this.firstdose = firstdose;
	}

	public Date getSeconddose() 
	{
		return seconddose;
	}

	public void setSeconddose(Date seconddose)
	{
		this.seconddose = seconddose;
	}
	
	
}

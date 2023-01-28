package com.dao.bean;

import java.sql.Date;

public class Appointment {
	
	private int appointment_id;
	private String ic, name, vacc_center, vacc_choice;
	private Date firstDose_Date, secondDose_Date;
		
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	
	public String getIc() {
		return ic;
	}
	public void setIc(String ic) {
		this.ic = ic;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getVacc_center() {
		return vacc_center;
	}
	public void setVacc_center(String vacc_center) {
		this.vacc_center = vacc_center;
	}
	
	public String getVacc_choice() {
		return vacc_choice;
	}
	public void setVacc_choice(String vacc_choice) {
		this.vacc_choice = vacc_choice;
	}
	
	public Date getFirstDose_Date() {
		return firstDose_Date;
	}
	public void setFirstDose_Date(Date firstDose_Date) {
		this.firstDose_Date = firstDose_Date;
	}
	
	public Date getSecondDose_Date() {
		return secondDose_Date;
	}
	public void setSecondDose_Date(Date secondDose_Date) {
		this.secondDose_Date = secondDose_Date;
	}
		
}

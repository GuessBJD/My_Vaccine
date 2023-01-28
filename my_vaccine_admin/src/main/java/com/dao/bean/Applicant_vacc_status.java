package com.dao.bean;

public class Applicant_vacc_status {
	
	private String ic, name;
	private boolean firstdose, seconddose;
	
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
	
	public boolean isFirstdose() {
		return firstdose;
	}
	public void setFirstdose(boolean firstdose) {
		this.firstdose = firstdose;
	}
	
	public boolean isSeconddose() {
		return seconddose;
	}
	public void setSeconddose(boolean seconddose) {
		this.seconddose = seconddose;
	}
		
}

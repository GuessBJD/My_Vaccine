package com.dao.bean;

public class Applicant_vacc_status 
{
	 private String name, ic;
	 private Byte firstdose_sts, seconddose_sts;

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

	public Byte getFirstdose_sts() 
	{
		return firstdose_sts;
	}

	public void setFirstdose_sts(Byte firstdose_sts) 
	{
		this.firstdose_sts = firstdose_sts;
	}

	public Byte getSeconddose_sts() 
	{
		return seconddose_sts;
	}

	public void setSeconddose_sts(Byte seconddose_sts)
	{
		this.seconddose_sts = seconddose_sts;
	}
	
	

}

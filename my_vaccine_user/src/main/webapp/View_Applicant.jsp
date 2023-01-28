<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Applicant (after Search)</title>

	<link href="BSS/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/View_Applicant.css" rel="stylesheet" type="text/css">
	
</head>
<body class="ViewApplicantS">
<%@page import="com.dao.ApplicantDao, com.dao.bean.Applicant, 
				com.dao.AppointmentDao, com.dao.bean.Appointment, 
				com.dao.Applicant_vacc_statusDao, com.dao.bean.Applicant_vacc_status, 
				java.util.*"
%>

<%
	String IC;
	IC = request.getParameter("ic");
	String Name;
	if (IC==null)
	{	
		IC = (String) request.getSession().getAttribute("ic_del");
		Name = (String) request.getSession().getAttribute("name_del");
	}
	else
	{
		Name = request.getParameter("name");
	}
	String gender="";
	Applicant u=new Applicant();
	u.setIc(IC);
	u.setName(Name);
	boolean status = ApplicantDao.validate(u);
	Boolean status_1st = false;
	Boolean status_2nd = false;
	Applicant list;
	Appointment appointment_rec = new Appointment();
	appointment_rec.setIc(IC);
	Applicant_vacc_status status_rec = new Applicant_vacc_status();
	status_rec.setIc(IC);
	
	String firstdate = "Not Available";
	String seconddate = "Not Available";

	session.setAttribute("ic_edit", request.getParameter("ic"));
	if (status) 
	{
		list= ApplicantDao.getApplicantbyIc(IC);

		if (!list.getName().equals(Name)) 
		{
			response.sendRedirect("Applicant-invalidName.jsp");
			list.setAddress("");
	    	list.setEmail("");
	    	list.setName("");
	    	list.setPhone("");			
			status = false;
		}
		else 
		{
			int i = AppointmentDao.getAppointmentbyIc(appointment_rec);
			int j = Applicant_vacc_statusDao.getVaccineStatusbyIc(status_rec);

			if(i>0)
			{
				if(appointment_rec.getFirstdose() != null)
				{
					firstdate = appointment_rec.getFirstdose().toString();
				}
				if(appointment_rec.getSeconddose() != null)
				{
					seconddate = appointment_rec.getSeconddose().toString();
				}
			}
			if (j>0)
			{
				if (status_rec.getFirstdose_sts()==1)
				{
					status_1st = true;
				}
				if (status_rec.getSeconddose_sts()==1)
				{
					status_2nd =  true;
				}
			}
			
			//out.println("Applicant found");
			session.setAttribute("session","TRUE");
			if (list.getGender()== 0)
			{
				gender = "Female";
			}
			else if (list.getGender()== 1)
			{
				gender = "Male";
			}			
		}
	}
	else
	{
		//out.println("Applicant not found !");
		list = new Applicant();
    	list.setAddress("");
    	list.setEmail("");
    	list.setName("");
    	list.setPhone("");
    	response.sendRedirect("Applicant-notfound.jsp");
	}
 			
%>


<h2 class="title">Applicant Vaccination Information</h2>

<table align="center" style="width: 70%" class="table-Pdetails">
		<tr>
			<td>Applicant Ic No.: </td>
			<td><%=IC%></td>
		</tr>

		<tr>
			<td>Applicant Name: </td>
			<td><%=list.getName()%></td>
		</tr>		
		
		<tr>
			<td>Gender: </td>
			<td><%=gender%></td>
		</tr>
		
		<tr>
			<td>Phone: </td>
			<td><%=list.getPhone()%></td>
		
		</tr>
		
		<tr>
			<td>Email: </td>
			<td><%=list.getEmail()%></td>
		
		<tr>
			<td>Address: </td>
			<td><%=list.getAddress()%>
		</tr>

		<tr>
			<td>Vaccination Center:</td>
			<td><%=appointment_rec.getVaccCenter() %></td>
		</tr>
		
		<tr>
			<td>Vaccination Choice:</td>
			<td><%=appointment_rec.getVaccChoice() %></td>
		</tr>
	
</table>

	<table align="center" border="1" width="70%" class="table-status">
		<tr>
			<th>Dose</th>
			<th>Appointment Date</th>
			<th>Vaccination Status</th>
			<th>Cancel Appointment</th>
		</tr>
		
		<tr>
			<td>1</td>
			<td><%=firstdate %></td>
			<td><input type="checkbox" name="firstdose" id="firstdose"  onclick="return false"/></td>
			<td><a href="deleteAppointment.jsp?ic=<%=IC%>&name=<%=Name%>&dose=1" onclick="return validate_dose1();">Cancel</a>
		</tr>	
		
		<tr>
			<td>2</td>
			<td><%=seconddate %></td>
			<td><input type="checkbox" name="seconddose" id="seconddose" onclick="return false"/></td>
			<td><a href="deleteAppointment.jsp?ic=<%=IC%>&name=<%=Name%>&dose=2" onclick="return validate_dose2();">Cancel</a>
		</tr>
	</table>
		<br>
	
		
		<button id="btn" type="button" class="edit-info" onClick="location.href='EditApplicantForm.jsp?ic=<%=IC%>&name=<%=Name%>'">Edit Info</button>   
		<button type="button" class="back" onClick="history.back()">Back</button>  



	

<script type="text/javascript">
	document.getElementById("btn").disabled =<%=!status%>;
	
	document.getElementById("firstdose").checked=<%= status_1st%>;
	document.getElementById("seconddose").checked=<%= status_2nd%>;
	
	
</script>

<script type="text/javascript">
	function validate_dose1()
	{
		if (<%=appointment_rec.getFirstdose()%> == null ) 
		{
			alert("Cannot cancel 1st appointment, appointment not define yet");
			return false;
		}
		else
		{
			if (document.getElementById("firstdose").checked==true)
			{
				alert("Cannot cancel 1st appointment, vaccination completed");
				return false;
			}
			else
			{	
				return true;
			}
		}
	}
	
	function validate_dose2()
	{
		
		if (<%=appointment_rec.getSeconddose()%> == null ) 
		{
			alert("Cannot cancel 2nd appointment, appointment not define yet");
			return false;
		}
		else
		{
			if (document.getElementById("seconddose").checked==true)
			{
				alert("Cannot cancel 2nd appointment, vaccination completed");
				return false;
			}
			else
			{	
				return true;
			}
		}	
	}
	
</script>

</body>
</html>
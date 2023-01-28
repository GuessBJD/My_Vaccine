<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Applicant Form</title>

	<link href="BSS/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/EditApplicantForm.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<%@page import="com.dao.ApplicantDao, com.dao.bean.Applicant" %>

<%
	String Ic = request.getParameter("ic");
	Applicant a = ApplicantDao.getApplicantbyIc(Ic);
	Boolean m = false;
	Boolean f = false;
	
	if(a.getGender() == 1)
	{
		m = true;
		
	}
	else if(a.getGender()==0)
	{
		f = true;
		
	}
%>

<h2 class="editapplicant1">Edit Applicant Information</h2>

<form id="applicantedit" action="EditApplicant.jsp" method="post">
	
	
	<table class="edit" style="margin-left: 20%; margin-right: auto;">
		<tr>
			<td class="edit-details"> Applicant Ic No.: </td>
			<td><input type="text" name="ic" class="edit-details-item" value=<%=Ic %> readonly /></td>
		</tr>
		
		<tr>
			<td class="edit-details">Applicant Name: </td>
			<td><input type="text" name="name" class="edit-details-item" value="<%=a.getName()%>"/></td>
		</tr>
		
		<tr>
			<td class="edit-details">Gender: </td>
			<td><input type="radio" name="gender" id="male" value="1"/>Male</td>
			<td><input type="radio" name="gender" id="female" value="0"/>Female</td>
		</tr>
		
		<tr>
			<td class="edit-details">Phone: </td>
			<td><input type="text" name="phone" class="edit-details-item" value="<%= a.getPhone()%>"/></td>
		</tr>
		
		<tr>
			<td class="edit-details">Email: </td>
			<td><input type="text" name="email" class="edit-details-item"value="<%=a.getEmail() %>"/></td>
		</tr>
		
		<tr>
			<td class="edit-details">Address: </td>
			<td><input type="text" name="address" class="edit-details-address" value="<%=a.getAddress() %>"/></td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<input type="submit" value="Confirm Edit" class="confirm-edit"/>
				<button type="button" class="back" onClick="history.back()">Back</button> 
			</td>
		</tr>
	</table>
</form>
  	

<script type="text/javascript">
	document.forms["applicantedit"]["male"].checked=<%= m %>;
	document.forms["applicantedit"]["female"].checked=<%= f %>;
</script>

</body>
</html>
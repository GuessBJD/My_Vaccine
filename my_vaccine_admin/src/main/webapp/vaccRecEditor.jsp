<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccination Record Editor</title>
</head>
<body>

<%@page import="com.dao.Applicant_vacc_statusDao, com.dao.bean.Applicant_vacc_status" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
	String setCheck(boolean doseStatus){
		if(doseStatus == true){
			return "checked=\"checked\"";
		}
		else{
			return null;
		}
	}
%>

<%
	String ic = request.getParameter("ic");
	
	Applicant_vacc_status rec = null;

	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
	}
	else{
		
		if (ic != null){		
			rec = Applicant_vacc_statusDao.getRecordByIcNo(ic);		
		}
		else{		
			response.sendRedirect("error.jsp?error=Unassigned+request+parameter&backtrace=---+vaccRecEditor.jsp+---");		
		}		
	}
	
%>

<h1>Admin Portal</h1>

<h2>Record editor</h2>

<core:if test="<%=rec != null%>">
		
	<form action="updateVaccRec.jsp" method="post">
		
		<input type="hidden" name="icNo" value="<%=rec.getIc()%>"/>
		
		<table border="1" width="100%">
			<tr>
				<td>IC No.:</td>
				<td><%=rec.getIc()%></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><%=rec.getName()%></td>
			</tr>
			<tr>
				<td>1st Dose:</td>
				<td><label for="1stDose"><input type="checkbox" id="1stDose" name="1stDose" value="true" <%=setCheck(rec.isFirstdose()) %>/></label></td>
			</tr>
			<tr>
				<td>2nd Dose:</td>
				<td><label for="2ndDose"><input type="checkbox" id="2ndDose" name="2ndDose" value="true" <%=setCheck(rec.isSeconddose()) %>/></label></td>
			</tr>
		</table>
		<br/>
		
		<input type="submit" value="Edit patient resgister"/>
		<a href="applicantVaccRecManager.jsp"><input type="button" value="Cancel"></a>		
	</form>
	<br />		
	
</core:if>

<core:if test="<%=rec == null%>">
	<p>Empty query returned :(</p>
</core:if>

</body>
</html>
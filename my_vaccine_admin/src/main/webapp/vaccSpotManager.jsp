<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccination Spot Manager</title>
<script type="text/javascript" src="resources/stateCity.js"></script>
</head>
<body>
<%@page import="com.dao.Vacc_centerDao, com.dao.bean.Vacc_center, java.util.*" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("invalidUserSession.html");
	}
	
	List<Vacc_center>list=Vacc_centerDao.getAllRecords(); 
	request.setAttribute("list", list);
%>


<table	width="100%">
	<tr>
		<td>
			<a href="adminPortal.jsp"><h1>Admin Portal</h1></a>		
		</td>	
		<td style="text-align: right">
			<a href="adminLogout.jsp">Log out</a>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td><a href="vaccSpotManager.jsp"><h2>Vaccination Spot Manager</h2></a></td>
	</tr>
</table>


<table>
	<tr>
		<td>
			<form action="searchVaccSpot.jsp" method="post">
				<select id="state" name="state">
					<option>---Select State---</option>
				</select>
				<select id="district" name="district">
					<option>---Select district---</option>
				</select>
				<select id="vacc_center" name="vacc_center">
					<option>---Select vaccination center---</option>
				</select>
			<input type="submit" value="Search"/>
			</form>
		</td>
		
		<td>
			<form action="addVaccSpotForm.jsp">
				<input type="submit" value="Add new Vaccination Spot"/>
			</form>
		</td>
	</tr>
	
</table>

<br>
	


<table border="1" width="100%">
	<tr>
		<th>CenterId</th>
		<th>Center Name</th>
		<th>State</th>
		<th>District</th>
		<th>Address</th>
		<th>Edit</th>
		<th>Delete</th>
		
	</tr>

<core:forEach items="${list}" var="vc">
	<tr>
		<td style="text-align: center;">${vc.getCenter_id()}</td>
		<td style="text-align: center;">${vc.getCenter_name()}</td>
		<td style="text-align: center;">${vc.getState()}</td>
		<td style="text-align: center;">${vc.getDistrict()}</td>
		<td style="text-align: center;">${vc.getAddress()}</td>
		
		<td>
			<form action="editVaccSpotForm.jsp" method="post" style="text-align: center;">
			<input type="hidden" name="center_id" value="${vc.getCenter_id()}"/>
			<input type="submit" value="Edit">
			</form>
		</td>
		
		
		<td>
			<form action="deleteVaccSpot.jsp" method="post" style="text-align: center;">
			<input type="hidden" name="center_id" value="${vc.getCenter_id()}"/>
			<input type="submit" value="Delete"/>
			</form>
		</td>
		
	</tr>
</core:forEach>

</table>

<script src="jquery/js/jquery-3.6.0.min.js"></script>
<script src="bss/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
		
    $.ajax({
        url: "setOptions",
        method: "GET",
        data: {operation: 'state'},
        success: function (data, textStatus, jqXHR) {
            let obj = $.parseJSON(data);
            $.each(obj, function (key, value) {
                $('#state').append('<option value=\"' + value + '\">' + value + '</option>')
            });
            //$('select').formSelect();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#state').append('<option>State Unavailable</option>');
        },
        cache: false
    });


    $('#state').change(function () {
        $('#district').find('option').remove();
        $('#district').append('<option>Select District</option>'); 
        $('#vacc_center').find('option').remove();
        $('#vacc_center').append('<option>Select Vaccination Center</option>');

        let option = $('#state').val();
        let data = {
            operation: "district",
            state: option
        };

        $.ajax({
            url: "setOptions",
            method: "GET",
            data: data,
            success: function (data, textStatus, jqXHR) {
                let obj = $.parseJSON(data);
                $.each(obj, function (key, value) {
                    $('#district').append('<option value=\"' + value + '\">' + value + '</option>')
                });
                //$('select').formSelect();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#district').append('<option>District Unavailable</option>');
            },
            cache: false
        });
    });
    
    $('#district').change(function () {
        $('#vacc_center').find('option').remove();
        $('#vacc_center').append('<option>Select Vaccination Center</option>');

        let option = $('#district').val();
        let data = {
            operation: "vacc_center",
            district: option
        };

        $.ajax({
            url: "setOptions",
            method: "GET",
            data: data,
            success: function (data, textStatus, jqXHR) {
                let obj = $.parseJSON(data);
                $.each(obj, function (key, value) {
                    $('#vacc_center').append('<option value=\"' + value + '\">' + value + '</option>')
                });
                //$('select').formSelect();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#vacc_center').append('<option>Vaccination Center Unavailable</option>');
            },
            cache: false
        });
    });
});
</script>

</body>
</html>
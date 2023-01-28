<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Applicant Appointment</title>

		<link href="BSS/css/bootstrap.min.css" rel="stylesheet">
		<link href="resources/addAppointment.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
	String ic = (String)session.getAttribute("ic");
%>

<h3 class="add-appointment">Registration Form</h3>
<form method="post" action="getAppointmentCenter.jsp" onsubmit="javascript:return validate_Appointment();" >
	<table  align="center" class=addappointment">
		
		<tr>
			<td class="details">Ic no.</td>
			<td><%=ic %></td>
		</tr>

		<tr>
			<td class="details">Name</td>
			<td><input type="text" id="name" name="name" class="details-item"/><div id="name_err"></div></td>
		</tr>		
		
		<tr>
			<td class="details">Gender </td>
			<td>
				<input type="radio" id="gender0" name="gender" value="0"class="details-item1"/>Female
				<input type="radio" id="gender1" name="gender" value="1" class="details-item1"/>Male
				<div id="gender_err"></div>
			</td>
		</tr>
		
		<tr>
			<td class="details">Phone</td>
			<td><input type="text" id="phone" name="phone" class="details-item"/></td>
		</tr>
		
		<tr>
			<td class="details">Email </td>
			<td><input type="email" id="email" name="email" class="details-item"/><div id="email_err"></div></td>
		</tr>
		
		<tr>
			<td class="details">Address</td>
			<td><input type="text" id="address" name="address" class="details-item"/><div id="address_err"></div></td>
		</tr>

		<tr>
			<td class="details">State</td>
			<td>
				<select id="state" name="state" class="state" style="width:100%">
					<option>--- Select state ---</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td class="details">District</td>
			<td>
				<select id="district" name="district" class="district" style="width:100%">
					<option>--- Select district ---</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td class="details">Center</td>
			<td>
				<select id="vacc_center" name="vacc_center" class="vac-cen" style="width:100%">
					<option>--- Select vaccination center ---</option>
				</select>
				<div id="vacc_center_err"></div>
			</td>
			
		</tr>
		
		<tr>
			<td class="details">Vaccination Choice</td>
			<td>
				<select id="vacc_choice" name="vacc_choice" class="vac-choice" style="width:100%">
					<option>--- Select Choice ---</option>
					<option>AstraZeneca</option>
					<option>Pfizer</option>
					<option>Sinovac</option>
				</select>
				<div id="vacc_choice_err"></div>
			</td>
				
		</tr>
		
		<tr>
			<td class="details">First Dose date</td>
			<td><input type="date" id=firstdose name="firstdose" class="details-item" pattern="\d{4}-\d{2}-\d{2}"><div id="firstdose_err"></div></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Confirm" class="submit">
			<button onclick="history.back()" class="back">Cancel</button>	
			</td>
		</tr>
	
	</table>
	
	
	
</form>



<script src="jquery/js/jquery-3.6.0.min.js"></script>
<script src="bss/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(document).ready(function () 
{
    $.ajax({
        url: "setOptions",
        method: "GET",
        data: {operation: 'state'},
        success: function (data, textStatus, jqXHR) 
        {
        	let obj = $.parseJSON(data);
            $.each(obj, function (key, value) { $('#state').append('<option value=\"' + value + '\">' + value + '</option>')});
        },
        error: function (jqXHR, textStatus, errorThrown) {$('#state').append('<option>State Unavailable</option>'); },
        cache: false
    });


    $('#state').change(function () {
        $('#district').find('option').remove();
        $('#district').append('<option>Select District</option>'); 
        $('#vacc_center').find('option').remove();
        $('#vacc_center').append('<option>Select Vaccination Center</option>');

        let option = $('#state').val();
        let data = {operation: "district", state: option};

        $.ajax({
            url: "setOptions",
            method: "GET",
            data: data,
            success: function (data, textStatus, jqXHR) {
                let obj = $.parseJSON(data);
                $.each(obj, function (key, value) {
                    $('#district').append('<option value=\"' + value + '\">' + value + '</option>')});
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
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#vacc_center').append('<option>Vaccination Center Unavailable</option>');
            },
            cache: false
        });
    });
});
</script>

<!-- Field validation using HTML -->


<script type="text/javascript">
function validate_Appointment() 
{

	let name= document.getElementById("name").value;
	let phone= document.getElementById("phone").value;
	let email= document.getElementById("email").value;
	let address= document.getElementById("address").value;
	let vacc_center= document.getElementById("vacc_center").value;
	let vacc_choice= document.getElementById("vacc_choice").value;
	let firstdose= document.getElementById("firstdose").value;
	
	let name_err = document.getElementById("name_err");
	let gender_err = document.getElementById("gender_err");
	let email_err = document.getElementById("email_err");
	let address_err = document.getElementById("address_err");
	let vacc_center_err = document.getElementById("vacc_center_err");
	let vacc_choice_err = document.getElementById("vacc_choice_err");
	let firstdose_err = document.getElementById("firstdose_err");
		
	let error_count=0;

	name_err.innerHTML = "";
	gender_err.innerHTML = "";
	email_err.innerHTML = "";
	address_err.innerHTML = "";
	vacc_center_err.innerHTML = "";
	vacc_choice_err.innerHTML = "";
	firstdose_err.innerHTML = "";
	
	if (name.length ==0 )
	{
		name_err.innerHTML = "Error ** Name must not be blank";
		error_count = error_count + 1;
	}
	
	var getSelectedValue = document.querySelector( 'input[name="gender"]:checked');   
	if (getSelectedValue == null) 
	{
		gender_err.innerHTML = "Error ** Pls select your gender";
		error_count = error_count + 1;
	}  
	
	if ((email.length ==0) && (phone.length == 0))
	{
		email_err.innerHTML = "Error ** Pls enter your contact detail, either by phone or email or both";
		error_count = error_count + 1;
	}
	
	if (address.length ==0)
	{
		address_err.innerHTML = "Error ** Address cannot be blank";
		error_count = error_count + 1;
	}
	
	if ((vacc_center.length ==0) || (vacc_center == "--- Select vaccination center ---"))
	{
		vacc_center_err.innerHTML = "Error ** Pls select a vacccination center, by selecting state, district then vaccination center ";
		error_count = error_count + 1;
	}
	
	if ((vacc_choice.length ==0) || (vacc_choice == "--- Select Choice ---"))
	{
		vacc_choice_err.innerHTML = "Error ** Pls select your prefer vaccine";
		error_count = error_count + 1;
	}
	
	if (firstdose.length ==0)
	{
		firstdose_err.innerHTML = "Error ** Pls enter a valid date for your first dose";
		error_count = error_count + 1;
	}

	if (error_count == 0)
	{
		return true;
	}
	
	else
	{
		return false;
	}	
}
</script>

</body>
</html>
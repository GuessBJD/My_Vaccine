function validate_form() 
{

System.out.println("in validate");	
	let ic= document.getElementById("ic").value;

	let error_msg_ic = document.getElementById("error_ic");
	//error_message.style.padding = "10px";
		
	let error_count=0;
	error_msg_ic.innerHTML = "";	
	alert ("xxxxxxxxxxxxxx");
	if (ic.length ==0 )
	{
		error_msg_ic.innerHTML = "Error ** Please enter your valid IC No (at least > 8 numbers)";
		error_count = error_count + 1;
	}
	if (error_count == 0)
	{
		alert ("Your request submitted successfully");
		return true;
	}
	else
	{
		return false;
	}
}/**
 * 
 */